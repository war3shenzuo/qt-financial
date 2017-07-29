package com.qtjf.tpa.tanzhi.server;

//探知数据 淘宝查询 api demo
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.tpa.tanzhi.util.HttpRequest;
import com.qtjf.tpa.tanzhi.util.MapParamUtil;

public class TaobaoApiQrClient {

	private static final String api = "http://api.tanzhishuju.com/api/gateway";
	// 系统分配的key，请用您的key进行替换
	private static final String key = "7352481512931223";
	// 系统分配的Secret，请用您的Secret进行替换
	private static final String secret = "x4X7G6E5HfHvpnMaRE2mGrLlzX68h6QR";
	private static final String version = "1.0.0";

	

	/**
	 * 提交淘宝查询的业务请求
	 * 
	 * @return
	 */
	public static JSONObject submitTask() {
		Map<String, Object> param = initParam("api.taobao.get");
		param.put("loginType", "qr");// 二维码方式登录，这里请填写固定值“qr”
		param.put("sign", MapParamUtil.signParam(param, secret));
		String result = HttpRequest.post(api).put(param).send();
		System.out.println("submitTask:\t" + result);
		return JSON.parseObject(result);
	}

	/**
	 * 检查业务状态
	 * 
	 * @param token
	 * @return
	 */
	public static JSONObject checkStatus(String token) {
		Map<String, Object> param = initParam("api.common.getStatus");
		param.put("token", token);
		param.put("sign", MapParamUtil.signParam(param, secret));
		JSONObject result = JSON.parseObject(HttpRequest.post(api).put(param).send());
		if ("".equals(result.getString("code"))) {
			System.out.print(">");
		} else {
			System.out.println("checkStatus:\t" + result);
		}
		return result;
	}

	/**
	 * 查询结果
	 * 
	 * @param token
	 * @return
	 */
	public static void getResult(String token) {
		Map<String, Object> param = initParam("api.common.getResult");
		param.put("token", token);
		param.put("bizType", "taobao");// 根据Token获取淘宝的抓取结果，这里请填写固定值“taobao”
		param.put("sign", MapParamUtil.signParam(param, secret));
		System.out.println(HttpRequest.post(api).put(param).send());
	}

	/**
	 * 构造基础的API接口Http请求的通用参数
	 * 
	 * @param method
	 * @return
	 */
	private static Map<String, Object> initParam(String method) {
		Map<String, Object> param = new HashMap<>();
		param.put("method", method);
		param.put("apiKey", key);
		param.put("version", version);
		return param;
	}
}
