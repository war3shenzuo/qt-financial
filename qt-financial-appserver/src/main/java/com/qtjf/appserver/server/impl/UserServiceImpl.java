package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinancialUserMapper;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialUser;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	QtFinancialUserMapper qtFinancialUserMapper;

	@Override
	public QtFinancialUser getUserInfoByMobile(String mobile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QtFinancialUser> getUserList(QtFinancialUser user) {
		return qtFinancialUserMapper.selectAll(user);
	}

	@Override
	public void inset(QtFinancialUser user) throws Exception {
		user.setId(UUID.randomUUID().toString());
		user.setCreatedat(new Date());
		user.setUserlevel("1");
		user.setIslockedout("0");
		user.setUserstatus("1");
		qtFinancialUserMapper.insert(user);
	}

}
