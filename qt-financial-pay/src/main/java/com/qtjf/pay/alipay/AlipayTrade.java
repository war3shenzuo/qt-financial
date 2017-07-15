package com.qtjf.pay.alipay;


import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * 支付宝交易类
 * @author shixianjie
 * @date 2016/07/15
 */
public class AlipayTrade {

    private Logger logger = LoggerFactory.getLogger(AlipayTrade.class);

    /**
     * web支付下单并支付(web支付在安卓中是可以直接唤醒支付宝APP的)
     * url https://doc.open.alipay.com/doc2/detail.htm?treeId=203&articleId=105463&docType=1#s1
     * @return web支付的表单
     */
    public String TradeWapPayRequest(Map<String, String> sParaTemp){
        AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();
        alipayRequest.setReturnUrl(AliPayConfig.RETURN_URL);
        alipayRequest.setNotifyUrl(AliPayConfig.PAY_NOTIFY);
        // 待请求参数数组
        sParaTemp.put("seller_id",AliPayConfig.SELLER_ID);
        alipayRequest.setBizContent(JSON.toJSONString(sParaTemp));
        String form = "";
        try {
            form = AliPayConfig.getInstance().pageExecute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            logger.error("支付宝构造表单失败",e);
        }
        logger.debug("支付宝支付表单构造:"+form);
        return form;
    }

    /**
     * 申请退款
     * @param sParaTemp 退款参数
     * @return true成功,回调中处理
     * 备注:https://doc.open.alipay.com/docs/api.htm?spm=a219a.7629065.0.0.3RjsEZ&apiId=759&docType=4
     */
    public boolean tradeRefundRequest(Map<String, ?> sParaTemp) throws AlipayApiException {
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        request.setReturnUrl(AliPayConfig.RETURN_URL);
        request.setNotifyUrl(AliPayConfig.REFUND_NOTIFY);
        // 待请求参数数组
        request.setBizContent(JSON.toJSONString(sParaTemp));
        AlipayTradeRefundResponse response = AliPayConfig.getInstance().execute(request);
        logger.debug("支付宝退货结果:"+response.isSuccess());
        return response.isSuccess();
    }

   
}
