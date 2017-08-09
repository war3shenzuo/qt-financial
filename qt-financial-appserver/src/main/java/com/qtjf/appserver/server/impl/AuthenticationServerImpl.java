package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinacialAuthenticationBaseMapper;
import com.qtjf.appserver.dao.QtFinacialAuthenticationEmergencyContactMapper;
import com.qtjf.appserver.dao.QtFinacialAuthenticationProfessionMapper;
import com.qtjf.appserver.dao.QtFinancialAuthenticationMapper;
import com.qtjf.appserver.server.AuthenticationServer;
import com.qtjf.common.bean.QtFinacialAuthenticationBank;
import com.qtjf.common.bean.QtFinacialAuthenticationBase;
import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;
import com.qtjf.common.bean.QtFinacialAuthenticationProfession;
import com.qtjf.common.bean.QtFinancialAuthentication;
import com.qtjf.common.emus.Authentication;

@Service
@Transactional
public class AuthenticationServerImpl implements AuthenticationServer {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	QtFinancialAuthenticationMapper qtFinancialAuthenticationMapper;

	@Autowired
	QtFinacialAuthenticationBaseMapper qtFinacialAuthenticationBaseMapper;

	@Autowired
	QtFinacialAuthenticationProfessionMapper qtFinacialAuthenticationProfessionMapper;
	
	@Autowired
	QtFinacialAuthenticationEmergencyContactMapper qtFinacialAuthenticationEmergencyContactMapper;

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

		record.setCreatedAt(new Date());
		record.setUpdatedAt(new Date());
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
		record.setAuthenticationId(bank.getId());
		record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
		record.setAuthType(Authentication.TYPE_BANK.getStatus());
		record.setUserId(userId);

		insert(record);
	}

	@Override
	public void saveMobile(String userId, String mobile, String password) {
		// TODO Auto-generated method stub

	}

	@Override
	public synchronized void submitUserBase(QtFinacialAuthenticationBase userBase, String userId) throws Exception {

		// 查询是否有数据如果有就修改没有就新增
		QtFinancialAuthentication query = new QtFinancialAuthentication();
		query.setAuthType(Authentication.TYPE_BASE.getStatus());
		query.setUserId(userId);
		List<QtFinancialAuthentication> list = qtFinancialAuthenticationMapper.selectAll(query);

		if (!Objects.isNull(list) || list.size() == 0) {
			userBase.setId(UUID.randomUUID().toString());
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_BASE.getStatus());
			record.setUserId(userId);
			record.setAuthenticationId(userBase.getId());
			qtFinancialAuthenticationMapper.updateByPrimaryKey(record);
			qtFinacialAuthenticationBaseMapper.insert(userBase);
		} else if(list.size()==1)  {
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_BASE.getStatus());
			record.setUserId(userId);
			insert(record);
			userBase.setId(list.get(0).getAuthenticationId());
			qtFinacialAuthenticationBaseMapper.update(userBase);
		}else{
			logger.error("用户："+userId+"的<"+Authentication.TYPE_BASE.getMsg()+">认证大于两条");
			throw new RuntimeException("数据异常");
		}

	}

	@Override
	public synchronized void submitProfession(QtFinacialAuthenticationProfession profeesion, String userId)
			throws Exception {

		// 查询是否有数据如果有就修改没有就新增
		QtFinancialAuthentication query = new QtFinancialAuthentication();
		query.setAuthType(Authentication.TYPE_PROFESSION.getStatus());
		query.setUserId(userId);
		List<QtFinancialAuthentication> list = qtFinancialAuthenticationMapper.selectAll(query);

		if (Objects.isNull(list) || list.size() == 0) {
			profeesion.setId(UUID.randomUUID().toString());
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthenticationId(profeesion.getId());
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_PROFESSION.getStatus());
			record.setUserId(userId);
			insert(record);
			qtFinacialAuthenticationProfessionMapper.insert(profeesion);
		} else if(list.size()==1) {
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_PROFESSION.getStatus());
			record.setUserId(userId);
			qtFinancialAuthenticationMapper.updateByPrimaryKey(record);
			profeesion.setId(list.get(0).getAuthenticationId());
			qtFinacialAuthenticationProfessionMapper.update(profeesion);
		}else{
			logger.error("用户："+userId+"的<"+Authentication.TYPE_PROFESSION.getMsg()+">认证大于两条");
			throw new RuntimeException("数据异常");
		}

	}

	@Override
	public void submitEmergencyContract(QtFinacialAuthenticationEmergencyContact emergencyContact, String userId)
			throws Exception {
		// 查询是否有数据如果有就修改没有就新增
		QtFinancialAuthentication query = new QtFinancialAuthentication();
		query.setAuthType(Authentication.TYPE_MERGENCY.getStatus());
		query.setUserId(userId);
		List<QtFinancialAuthentication> list = qtFinancialAuthenticationMapper.selectAll(query);

		if (Objects.isNull(list) || list.size() == 0) {
			emergencyContact.setId(UUID.randomUUID().toString());
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthenticationId(emergencyContact.getId());
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_MERGENCY.getStatus());
			record.setUserId(userId);
			insert(record);
			qtFinacialAuthenticationEmergencyContactMapper.insert(emergencyContact);
		} else if(list.size()==1){
			QtFinancialAuthentication record = new QtFinancialAuthentication();
			record.setAuthStatus(Authentication.STATUS_APPLY.getStatus());
			record.setAuthType(Authentication.TYPE_MERGENCY.getStatus());
			record.setUserId(userId);
			qtFinancialAuthenticationMapper.updateByPrimaryKey(record);
			emergencyContact.setId(list.get(0).getAuthenticationId());
			qtFinacialAuthenticationEmergencyContactMapper.update(emergencyContact);
		}else{
			logger.error("用户："+userId+"的<"+Authentication.TYPE_MERGENCY.getMsg()+">认证大于两条");
			throw new RuntimeException("数据异常");
		}

	}

	@Override
	public List<QtFinancialAuthentication> getAuthenticationList(String userId) {
		QtFinancialAuthentication param = new QtFinancialAuthentication();
		param.setUserId(userId);
		return qtFinancialAuthenticationMapper.selectAll(param);
	}

	@Override
	public Object getAuthenticationInfoType(String id, String type) {
		
		Object result = null;
		
		if(Objects.equals(type, "0")){
			result = qtFinacialAuthenticationBaseMapper.selectById(id);
		}else if(Objects.equals(type, "1")){
			result = qtFinacialAuthenticationProfessionMapper.selectById(id);
		}else if(Objects.equals(type, "2")){
			result = qtFinacialAuthenticationEmergencyContactMapper.selectById(id);
		}else{
			result = null;
		}
		
		return  result;
	}


}
