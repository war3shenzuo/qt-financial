package com.qtjf.appserver.controller;

import java.util.*;


import com.alibaba.fastjson.JSONObject;
import com.qtjf.common.bean.QtFinancialUserSmsCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BannerServer;
import com.qtjf.appserver.server.LoginService;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.vo.ResultCode;

@RestController
@RequestMapping(value = "/index")
public class LoginController {


    @Autowired
    private BannerServer bannerserver;

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    /**
     * 登录
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public ResultCode login(String usermobile, String type, String authCode) throws Exception {
        verify(authCode, type, usermobile);
        QtFinancialUser user = userService.getUserInfoByMobile(usermobile);
        return ResultCode.getSuccess("登陆成功",user);
    }

    @RequestMapping(value = "/getBanners")
    public ResultCode getBanners() throws Exception {
        return ResultCode.getSuccess("获取banner成功", bannerserver.getBanner());

    }

    @RequestMapping(value = "/register")
    public ResultCode register(String usermobile, String authCode, String invite, String type) throws Exception {

        verify(authCode, type, usermobile);
        //保存用户
        QtFinancialUser user = new QtFinancialUser();
        user.setUsermobile(usermobile);
        user.setInviteuser(invite);
        userService.inset(user);
        return ResultCode.getSuccess("注册成功");


    }

    /**
     * 获取版本
     *
     * @param editionType 机器类型
     * @param editionCode 版本号码
     * @return ResultCode
     * @throws Exception
     */
    @RequestMapping(value = "/getedition")
    public ResultCode getEdition(String editionType, String editionCode) throws Exception {
        Map<String, String> m = loginService.getEdition(editionType, editionCode);
        return ResultCode.getSuccess("版本信息获取成功", m);
    }


    @RequestMapping(value = "/sendSmsCode")
    public ResultCode sendSmsCode(String usermobile, String type) throws Exception {

        int authCode = (int) ((Math.random() * 9 + 1) * 100000);
        String result = loginService.sendRegisterSmsCode(usermobile, String.valueOf(authCode));
        if (Objects.equals(result, "fail")) {
            return ResultCode.getFail("短信发送失败");
        }

        if (Integer.valueOf(result) <= 0) {
            return ResultCode.getError(result);
        }

        QtFinancialUserSmsCode smsCode = new QtFinancialUserSmsCode();
        smsCode.setCreatedAt(new Date().getTime());
        smsCode.setPassAt(smsCode.getCreatedAt() + 600 * 1000);
        smsCode.setMobile(usermobile);
        smsCode.setType(type);
        smsCode.setSmsCode(authCode);
        userService.saveSmsCode(smsCode);

        //查询是否有这个用户
        QtFinancialUser user = userService.getUserInfoByMobile(usermobile);
        if (user == null) {
            return ResultCode.getSuccess("发送成功", "");
        } else {
            return ResultCode.getSuccess("发送成功", user);
        }


    }


    @RequestMapping(value = "/verifySmsCodeJsonp")
    public String verifySmsCodeJsonp(String usermobile, String type, String authCode, String jsonp) throws Exception {

        try {
            verify(authCode, type, usermobile);

        } catch (Exception e) {
            return jsonp + "(" + JSONObject.toJSONString(ResultCode.getFail(e.getMessage())) + ");";
        }

        return jsonp + "(" + JSONObject.toJSONString(ResultCode.getSuccess("验证成功")) + ");";
    }


    @RequestMapping(value = "/verifySmsCode")
    public String verifySmsCode(String usermobile, String type, String authCode) throws Exception {

        try {
            verify(authCode, type, usermobile);

        } catch (Exception e) {
            return JSONObject.toJSONString(ResultCode.getFail(e.getMessage())) ;
        }

        return JSONObject.toJSONString(ResultCode.getSuccess("验证成功"));
    }

    private void verify(String authCode, String type, String mobile) {
        QtFinancialUserSmsCode smsCode = new QtFinancialUserSmsCode();
        smsCode.setSmsCode(Integer.valueOf(authCode));
        smsCode.setType(type);
        smsCode.setMobile(mobile);
        userService.verifySmsCode(smsCode);
    }



}
