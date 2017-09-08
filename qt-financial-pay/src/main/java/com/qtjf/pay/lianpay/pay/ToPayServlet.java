package com.qtjf.pay.lianpay.pay;


import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.pay.lianpay.config.PartnerConfig;
import com.qtjf.pay.lianpay.config.ServerURLConfig;
import com.qtjf.pay.lianpay.utils.LLPayUtil;
import com.qtjf.pay.lianpay.vo.OrderInfo;
import com.qtjf.pay.lianpay.vo.PaymentInfo;

/**
* 调用连连支付WEB支付服务
* @author guoyx e-mail:guoyx@lianlian.com
* @date:2013-6-25 下午01:41:15
* @version :1.0
*
*/
public class ToPayServlet {
    

    /**
     * 卡前置支付处理
     * @param req
     * @param order
     */
	public static void prepositPay(HttpServletRequest req, OrderInfo order)
    {
        // 构造支付请求对象
        PaymentInfo paymentInfo = new PaymentInfo();
        paymentInfo.setVersion(PartnerConfig.VERSION);
        paymentInfo.setOid_partner(PartnerConfig.OID_PARTNER);
        paymentInfo.setUser_id(req.getParameter("user_id"));
        paymentInfo.setSign_type(PartnerConfig.SIGN_TYPE);
        paymentInfo.setBusi_partner(PartnerConfig.BUSI_PARTNER);
        paymentInfo.setNo_order(order.getNo_order());
        paymentInfo.setDt_order(order.getDt_order());
        paymentInfo.setName_goods(order.getName_goods());
        paymentInfo.setInfo_order(order.getInfo_order());
        paymentInfo.setMoney_order(order.getMoney_order());
        paymentInfo.setNotify_url(PartnerConfig.NOTIFY_URL);
        paymentInfo.setUrl_return(PartnerConfig.URL_RETURN);
        paymentInfo.setUserreq_ip(LLPayUtil.getIpAddr(req).replaceAll("\\.",
                "_"));
        paymentInfo.setUrl_order("");
        paymentInfo.setValid_order("10080");// 单位分钟，可以为空，默认7天
        paymentInfo.setRisk_item(createRiskItem());
        paymentInfo.setTimestamp(LLPayUtil.getCurrentDateTimeStr());
        // 商戶从自己系统中获取用户身份信息（认证支付必须将用户身份信息传输给连连，且修改标记flag_modify设置成1：不可修改）
        paymentInfo.setId_type("0");
        paymentInfo.setId_no("410782198912151334");
        paymentInfo.setAcct_name("连连");
        paymentInfo.setFlag_modify("1");
        if (!LLPayUtil.isnull(req.getParameter("no_agree")))
        {// 协议号和卡号同时存在时，优先将协议号送给连连，不要将协议号和卡号都送给连连
            paymentInfo.setNo_agree(req.getParameter("no_agree"));
        } else
        {
            paymentInfo.setCard_no(req.getParameter("card_no"));
        }
        paymentInfo.setBack_url("http://www.lianlianpay.com/");
        // 加签名
        String sign = LLPayUtil.addSign(JSON.parseObject(JSON
                .toJSONString(paymentInfo)), PartnerConfig.TRADER_PRI_KEY,
                PartnerConfig.MD5_KEY);
        paymentInfo.setSign(sign);

        req.setAttribute("version", paymentInfo.getVersion());
        req.setAttribute("oid_partner", paymentInfo.getOid_partner());
        req.setAttribute("user_id", paymentInfo.getUser_id());
        req.setAttribute("sign_type", paymentInfo.getSign_type());
        req.setAttribute("busi_partner", paymentInfo.getBusi_partner());
        req.setAttribute("no_order", paymentInfo.getNo_order());
        req.setAttribute("dt_order", paymentInfo.getDt_order());
        req.setAttribute("name_goods", paymentInfo.getName_goods());
        req.setAttribute("info_order", paymentInfo.getInfo_order());
        req.setAttribute("money_order", paymentInfo.getMoney_order());
        req.setAttribute("notify_url", paymentInfo.getNotify_url());
        req.setAttribute("url_return", paymentInfo.getUrl_return());
        req.setAttribute("userreq_ip", paymentInfo.getUserreq_ip());
        req.setAttribute("url_order", paymentInfo.getUrl_order());
        req.setAttribute("valid_order", paymentInfo.getValid_order());
        req.setAttribute("timestamp", paymentInfo.getTimestamp());
        req.setAttribute("sign", paymentInfo.getSign());
        req.setAttribute("risk_item", paymentInfo.getRisk_item());
        req.setAttribute("no_agree", paymentInfo.getNo_agree());
        req.setAttribute("id_type", paymentInfo.getId_type());
        req.setAttribute("id_no", paymentInfo.getId_no());
        req.setAttribute("acct_name", paymentInfo.getAcct_name());
        req.setAttribute("flag_modify", paymentInfo.getFlag_modify());
        req.setAttribute("card_no", paymentInfo.getCard_no());
        req.setAttribute("back_url", paymentInfo.getBack_url());
        req.setAttribute("req_url", ServerURLConfig.PAY_URL);

    }

    /**
     * 根据连连支付风控部门要求的参数进行构造风控参数
     * @return
     */
    private static String createRiskItem()
    {
        JSONObject riskItemObj = new JSONObject();
        riskItemObj.put("user_info_full_name", "你好");
        riskItemObj.put("frms_ware_category", "1999");
        return riskItemObj.toString();
    }

    
    

}
