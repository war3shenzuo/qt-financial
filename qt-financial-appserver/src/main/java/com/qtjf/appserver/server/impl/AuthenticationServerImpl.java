package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinacialAuthenticationBaseMapper;
import com.qtjf.appserver.dao.QtFinancialAuthenticationMapper;
import com.qtjf.appserver.server.AuthenticationServer;
import com.qtjf.common.bean.QtFinacialAuthenticationBank;
import com.qtjf.common.bean.QtFinacialAuthenticationBase;
import com.qtjf.common.bean.QtFinancialAuthentication;
import com.qtjf.common.emus.Authentication;

@Service
@Transactional
public class AuthenticationServerImpl implements AuthenticationServer {

	@Autowired
	QtFinancialAuthenticationMapper qtFinancialAuthenticationMapper;

	@Autowired
	QtFinacialAuthenticationBaseMapper qtFinacialAuthenticationBaseMapper;

	@Override
	public void saveTaobaoQrMsg(String msg, String userId) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("userId", userId);
		map.put("createdAt", new Date().getTime());
		qtFinancialAuthenticationMapper.deleteTaobaoQrMsgByUserId(userId);
		qtFinancialAuthenticationMapper.saveTaobaoQrMsg(map);
	}

	@Override
	public void saveTaobaoInfo(String token, String userId) {

		System.out.println(token);
	}

	@Override
	public String getTaobaoQRMsg(String userId) {
		long now = new Date().getTime();

		Map<String, Object> map = qtFinancialAuthenticationMapper.getQRMsg(userId);
		if (map != null) {
			// 判断是否过期
			if (now - (Long) map.get("createdAt") > (1000 * 60 * 3)) {
				return null;
			} else {
				return (String) map.get("qrMsg");
			}
		}

		return null;
	}

	@Override
	public void insert(QtFinancialAuthentication record) throws Exception {

		record.setCreatedat(new Date());
		record.setUpdatedat(new Date());
		record.setId(UUID.randomUUID().toString());

		qtFinancialAuthenticationMapper.insert(record);
	}

	@Override
	public void saveBankInfo(String bankCardNo, String name, String identityNo, String mobile, String userId)
			throws Exception {

		QtFinacialAuthenticationBank bank = new QtFinacialAuthenticationBank();
		bank.setId(UUID.randomUUID().toString());
		bank.setIdentityNo(identityNo);
		bank.setMobile(mobile);
		bank.setUserName(name);
		bank.setBankCardNo(bankCardNo);

		qtFinancialAuthenticationMapper.insertAuthenticationBank(bank);

		QtFinancialAuthentication record = new QtFinancialAuthentication();
		record.setAuthenticationid(bank.getId());
		record.setAuthstatus(Authentication.STATUS_APPLY.getStatus());
		record.setAuthtype(Authentication.TYPE_BANK.getStatus());
		record.setUserid(userId);

		insert(record);
	}

	@Override
	public void saveMobile(String userId, String mobile, String password) {
		// TODO Auto-generated method stub

	}

	@Override
	public void submitUserBase(QtFinacialAuthenticationBase userBase) throws Exception {

		if (Objects.isNull(qtFinacialAuthenticationBaseMapper.selectByUserId(userBase.getUserId()))) {
			qtFinacialAuthenticationBaseMapper.insert(userBase);
		} else {
			qtFinacialAuthenticationBaseMapper.update(userBase);
		}
		
		//查询是否有数据如果有就修改没有就新增
		QtFinancialAuthentication query = new QtFinancialAuthentication();
		query.setAuthtype(Authentication.TYPE_BASE.getStatus());
		query.setUserid(userBase.getUserId());
		List<QtFinancialAuthentication> list = qtFinancialAuthenticationMapper.selectAll(query);
		
		if (!Objects.isNull(list) && list.size() > 0) {
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthstatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthtype(Authentication.TYPE_BASE.getStatus());
			record.setUserid(userBase.getUserId());
			qtFinancialAuthenticationMapper.updateByPrimaryKey(record);
		} else {
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthenticationid(userBase.getUserId());
			record.setAuthstatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthtype(Authentication.TYPE_BASE.getStatus());
			record.setUserid(userBase.getUserId());
			qtFinancialAuthenticationMapper.insert(record);
		}

	}

}
