package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinancialAuthenticationMapper;
import com.qtjf.appserver.server.QtFinancialAuthenticationServer;

@Service
@Transactional
public class qtFinancialAuthenticationServerImpl implements QtFinancialAuthenticationServer {

	@Autowired
	QtFinancialAuthenticationMapper qtFinancialAuthenticationMapper;

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
			//判断是否过期
			if (now - (Long) map.get("createdAt") > (1000 * 60 * 3)) {
				return null;
			} else {
				return (String) map.get("qrMsg");
			}
		}

		return null;
	}

}
