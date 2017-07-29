package com.qtjf.appserver.controller;


import java.util.Objects;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.appserver.server.QtFinancialAuthenticationServer;
import com.qtjf.common.emus.SysStatus;
import com.qtjf.common.vo.ResultCode;
import com.qtjf.tpa.tanzhi.server.TaobaoApiQrClient;

/**
 *探知api认证Controller类
 * 
 * @author 史贤杰 2017/07/30
 */
@RestController
@RequestMapping("tanzhi")
public class TanzhiController {
	
	@Autowired
	QtFinancialAuthenticationServer qtFinancialAuthenticationServer;
	
	/**
	 * 申请淘宝二维码 
	 * @return
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = "taobao")
	public ResultCode reqToken(String userId) throws InterruptedException {
			JSONObject json =TaobaoApiQrClient.submitTask();
			Object code = json.get("code");
			if ("0010".equals(code)) {
				String token = json.getString("token");
				// 轮询状态
				while (true) {
					json = TaobaoApiQrClient.checkStatus(token);
					code = json.get("code");
					if ("0012".equals(code)) {
						//往数据库插入返回的msg
						qtFinancialAuthenticationServer.saveTaobaoQrMsg(json.getString("msg"),userId);
						Thread.sleep(3000);
					} else if ("0000".equals(code)) {
						// 获取结果
						TaobaoApiQrClient.getResult(token);
						qtFinancialAuthenticationServer.saveTaobaoInfo(token,userId);
						return ResultCode.getSuccess("认证信息提交成功"); 
					} else if ("1110".equals(code)) {
						return ResultCode.getFail("等待扫码超时");
					}else if (!"".equals(code) && !code.toString().startsWith("0")) {
						return ResultCode.getFail();
					} else {
						Thread.sleep(3000);
					}
				}
			}
			
			return ResultCode.getFail("提交淘宝审核失败！");
	}
	
	
	/**
	 * 获取qr信息
	 * @param userId 用户Id
	 * @return 产品集合
	 */
	@RequestMapping("getTaobaoQRMsg")
	public ResultCode getTaobaoQRMsg( @NotNull String userId)  {
			String msg = qtFinancialAuthenticationServer.getTaobaoQRMsg(userId);
			if(msg!=null && !Objects.equals("", msg)) {
				return ResultCode.getSuccess("获取淘宝登录二维码信息", msg);
			}else {
				return new ResultCode(SysStatus.NO_DATA.getStatus(),"没有查到二维码",null);
			}
	}
	
	

}
