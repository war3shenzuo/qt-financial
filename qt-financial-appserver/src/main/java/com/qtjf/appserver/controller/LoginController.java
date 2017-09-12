package com.qtjf.appserver.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.common.bean.QtFinancialUserSmsCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BannerServer;
import com.qtjf.appserver.server.LoginService;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.vo.ResultCode;
import com.qtjf.jwt.entity.AccessToken;
import com.qtjf.jwt.entity.JwtConfig;
import com.qtjf.jwt.token.JwtTokenBuilder;
import com.qtjf.pay.lianpay.pay.ToPayServlet;
import com.qtjf.pay.lianpay.utils.LLPayUtil;
import com.qtjf.pay.lianpay.vo.OrderInfo;

@RestController
@RequestMapping(value = "/index")
public class LoginController {

    @Autowired
    private JwtConfig jwtConfig;

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
    public ResultCode login(String mobile, String password, String captcha) throws Exception {
        // 验证码校验

        // 用户名密码验证
        // JwtTokenBuilder jwtTokenBuilder = new JwtTokenBuilder();
        //
        // @SuppressWarnings("rawtypes")
        // Map map = new HashMap();
        // map.put("username", username);
        // String subject = JwtTokenBuilder.buildSubject(map);
        //
        // @SuppressWarnings("static-access")
        // String accessToken = jwtTokenBuilder.buildToken(subject,
        // jwtConfig.getExpiresSecond(),
        // jwtConfig.getBase64Secret());
        //
        // AccessToken token = new AccessToken();
        // token.setAccess_token(accessToken);
        // token.setToken_type(jwtConfig.getTokenType());
        // token.setExpires_in(jwtConfig.getExpiresSecond());

        if (Objects.equals("888888", captcha)) {
            return ResultCode.getSuccess("登陆成功");
        }

        return ResultCode.getError("验证码错误");

    }

    @RequestMapping(value = "/getBanners")
    public ResultCode getBanners() throws Exception {
        return ResultCode.getSuccess("获取banner成功", bannerserver.getBanner());

    }

    @RequestMapping(value = "/register")
    public ResultCode register(String mobile, String captcha, String invite) throws Exception {
        QtFinancialUser user = new QtFinancialUser();

        if (Objects.equals("888888", captcha)) {
            user.setUsermobile(mobile);
            user.setInviteuser("888888");
            userService.inset(user);
            return ResultCode.getSuccess("注册成功");
        }
        return ResultCode.getError("验证码错误");
    }

    /**
     * 获取版本
     *
     * @param editionType 机器类型
     * @param editionCode 版本号码
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getedition")
    public ResultCode getEdition(String editionType, String editionCode) throws Exception {
        Map<String, String> m = loginService.getEdition(editionType, editionCode);
        return ResultCode.getSuccess("版本信息获取成功", m);
    }

    /**
     * 支付
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/pay")
    public ResultCode pay(HttpServletRequest req) throws Exception {
        OrderInfo order = new OrderInfo();
        order.setNo_order(LLPayUtil.getCurrentDateTimeStr());
        order.setDt_order(LLPayUtil.getCurrentDateTimeStr());
        order.setMoney_order("1000");
        order.setName_goods("日本爱情动作片");
        order.setInfo_order("用户购买日本爱情动作片");
        //ToPayServlet.prepositPay(req, order);
        return ResultCode.getSuccess("支付成功成功");
    }

    @RequestMapping(value = "/sendSmsCode")
    public ResultCode sendSmsCode(String mobile, String type) throws Exception {

        int authCode = (int) ((Math.random() * 9 + 1) * 100000);
        String result = loginService.sendRegisterSmsCode(mobile, String.valueOf(authCode));
        if (Objects.equals(result, "fail")) {
            return ResultCode.getFail("短信发送失败");
        }

        if (Integer.valueOf(result) <= 0) {
            return ResultCode.getError(result);
        }

        QtFinancialUserSmsCode smsCode = new QtFinancialUserSmsCode();
        smsCode.setCreatedAt(new Date().getTime());
        smsCode.setPassAt(smsCode.getCreatedAt() + 600 * 1000);
        smsCode.setMobile(mobile);
        smsCode.setType(type);
        smsCode.setSmsCode(authCode);

        userService.saveSmsCode(smsCode);

        return ResultCode.getSuccess("发送成功");

    }


    @RequestMapping(value = "/verifySmsCodeJsonp")
    public String verifySmsCode(String mobile, String type, String authCode, String jsonp) throws Exception {

        try {

            QtFinancialUserSmsCode smsCode = new QtFinancialUserSmsCode();
            smsCode.setSmsCode(Integer.valueOf(authCode));
            smsCode.setType(type);
            smsCode.setMobile(mobile);

            userService.verifySmsCode(smsCode);

        } catch (Exception e) {

            return jsonp + "(" + JSONObject.toJSONString(ResultCode.getFail(e.getMessage())) + ");";
        }

        return jsonp + "(" + JSONObject.toJSONString(ResultCode.getSuccess("验证成功")) + ");";

    }

}
