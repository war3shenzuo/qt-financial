package com.qtjf.appserver.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.common.vo.ResultCode;
import com.qtjf.tpa.tanzhi.server.TaobaoApiQrClient;

/**
 * 借贷通api认证Controller类
 * 
 * @author 史贤杰 2017/07/25
 */
@RestController
@RequestMapping("tanzhi")
public class TanzhiController {
	
	/**
	 * 获取认证token
	 * @return
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = "taobao")
	public ResultCode reqToken(String app_id, String perso_name, String mobile_number, String id_number) throws InterruptedException {
			JSONObject json =TaobaoApiQrClient.submitTask();
			Object code = json.get("code");
			if ("0010".equals(code)) {
				String token = json.getString("token");
				// 轮询状态
				while (true) {
					json = TaobaoApiQrClient.checkStatus(token);
					code = json.get("code");
					if ("0012".equals(code)) {
						System.out.println(json.getString("msg"));
					} else if ("0000".equals(code)) {
						// 获取结果
						TaobaoApiQrClient.getResult(token);
						return ResultCode.getSuccess("认证信息提交成功"); 
					} else if (!"".equals(code) && !code.toString().startsWith("0")) {
						return ResultCode.getFail();
					} else {
						Thread.sleep(2000);
					}
				}
			}
			return ResultCode.getFail("提交淘宝审核失败！");
	}
	
	

}
