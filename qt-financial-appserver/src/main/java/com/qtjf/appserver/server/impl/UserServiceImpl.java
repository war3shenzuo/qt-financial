package com.qtjf.appserver.server.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.qtjf.common.bean.QtFinancialUserSmsCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinancialUserMapper;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialUser;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    QtFinancialUserMapper qtFinancialUserMapper;

    @Override
    public QtFinancialUser getUserInfoByMobile(String mobile) {

        return qtFinancialUserMapper.selectByPrimaryMobile(mobile);
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
        user.setIscidvalid("0");
        qtFinancialUserMapper.insert(user);
    }

    @Override
    public void sumbitVerifyCrad(String mobile, String idcrad, String realName) {

        QtFinancialUser user = new QtFinancialUser();
        user.setIscidvalid("1");
        user.setUsercid(idcrad);
        user.setUsermobile(mobile);
        user.setTurename(realName);

        qtFinancialUserMapper.sumbitVerifyCrad(user);
    }

    @Override
    public void saveSmsCode(QtFinancialUserSmsCode smsCode) {
        qtFinancialUserMapper.saveSmsCode(smsCode);
    }

    @Override
    public void verifySmsCode(QtFinancialUserSmsCode smsCode) {

        QtFinancialUserSmsCode q = qtFinancialUserMapper.selectSmsCode(smsCode);

        if (q == null) {
            throw new RuntimeException("验证失败");
        }

        Long ispass = q.getPassAt() - new Date().getTime();
        if (ispass <= 0) {
            throw new RuntimeException("验证码过期");
        }

    }

}
