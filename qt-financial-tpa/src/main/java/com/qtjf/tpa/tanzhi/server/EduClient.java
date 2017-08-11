package com.qtjf.tpa.tanzhi.server;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.tpa.tanzhi.util.HttpRequest;
import com.qtjf.tpa.tanzhi.util.MapParamUtil;

public class EduClient {

	private static final String api = "http://api.tanzhishuju.com/api/gateway";
	private static final String key ="系统分配的ApiKey";
	private static final String secret ="系统分配的ApiSecret";
	
	private static final String version ="1.0.0";

	/**
	 * 任务流程：
	 * 1. submitTask 将学信网账号密码 发送给服务器，服务器返回一个token
	 * 2. 不停的使用第一步返回的token检查任务状态，直到出现新的状态码
	 * 2.1. 如果状态码为0001则表示需要短信验证，将接收到的短信发送给服务器
	 * 2.2. 如果状态码为0000则表示服务器爬虫抓取成功，停止轮询，可以获取结果了
	 * 2.3. 如果状态码为0xxx或者空字符串则表示没有错误继续轮询，其他情况则表示有错误可以中断轮询
	 * 3. 如果上一步收到了0000，则调用获取结果的接口获取结果数据
	 * @param args
	 * @throws Exception
	 */
	public  String exec( String  chsiCode,String chsiPass,String userId) throws Exception {
		JSONObject json = submitTask(chsiCode,chsiPass);//提交一个学信网查询任务
		if("0010".equals(json.get("code"))){
			String token = json.getString("token");
			//轮询任务状态
			while (true) {
				json = checkStatus(token);
				if("0001".equals(json.get("code"))){//0001表示需要短信验证
					sendAuthCode(token,"6666666");//发送短信验证码
				}else if("0000".equals(json.get("code"))){
					json = getResult(token);
					Long s = System.currentTimeMillis();
					System.out.println("发挥结果（"+(System.currentTimeMillis()-s)+"ms）");
					break;
				}else if(!"".equals(json.get("code"))&&!json.get("code").toString().startsWith("0")){
					//如果轮询状态的状态码不等于空字符串，并且不是以0开头，表示有错误，可以停止轮询
					break;
				}else{
					//其他如空字符串或以0开头的code则休息5s后继续请求
					Thread.sleep(5000);
				}
			}
		}
		return JSONObject.toJSONString(json);
	}
	
	/**
	 * 提交业务
	 * @return
	 */
	public static JSONObject submitTask(String mobile,String pwd){
		Map<String,Object> param = initMap( "api.education.get");
		param.put("username", mobile);
		//密码采用Base64编码（jdk7及以下这里使用了Apache Commons里面的方法
		param.put("password",Base64.encodeBase64(pwd.getBytes(Charset.forName("UTF-8"))));
		//jdk8可以使用java自带的Base64
//		param.put("password",java.util.Base64.getEncoder().encodeToString(pwd.getBytes(Charset.forName("UTF-8"))));
		//参数签名
		param.put("sign", MapParamUtil.signParam(param,secret));
		//发起HTTP请求并获取结果
		String result = HttpRequest.post(api).put(param).send(); 
		System.out.println("submitTask:\t"+result);
		return JSON.parseObject(result);
	}
	
	/**
	 * 检查业务状态
	 * @param token
	 * @return
	 */
	public static JSONObject checkStatus(String token){
		Map<String,Object> param = initMap( "api.common.getStatus");
		param.put("token", token);
		//参数签名
		param.put("sign", MapParamUtil.signParam(param,secret));
		JSONObject result = JSON.parseObject(HttpRequest.post(api).put(param).send());
		//返回结果JSON中的code如果为空字符串表示延续上一次状态，还需继续请求
		if("".equals(result.getString("code"))){
			System.out.print("=");
		}else{
			System.out.println("checkStatus:\t"+result);
		}
		return result;
	}
	
	/**
	 * 发送短信验证码
	 * @param token
	 * @param smsCode
	 * @return
	 */
	public static JSONObject sendAuthCode(String token,String smsCode){
		Map<String,Object> param = initMap( "api.mobile.sendSms");
		param.put("token", token);
		param.put("smsCode",smsCode);
		//参数签名
		param.put("sign", MapParamUtil.signParam(param,secret));
		String result = HttpRequest.post(api).put(param).send();
		System.out.println("sendAuthCode:\t"+result);
		return JSON.parseObject(result);
	}
	
	/**
	 * 查询结果
	 * @param token
	 * @return
	 */
	public static JSONObject getResult(String token){
		Map<String,Object> param = initMap( "api.common.getResult");
		param.put("token", token);
		param.put("bizType", "education");//学历学籍（学信网）查询，此处应填写固定值education
		param.put("sign", MapParamUtil.signParam(param,secret));
		System.out.println(">>>>>>>>>>>>>>>开始获取结果");
		Long timer = System.currentTimeMillis();
		String result = HttpRequest.post(api).put(param).send();
		System.out.println("<<<<<<<<<<<<<<<获取结果完成（"+(System.currentTimeMillis()-timer)+"ms）");
		return JSON.parseObject(result);
	}
	
	/**
	 * 构造基础的Map
	 * @param method
	 * @return
	 */
	private static Map<String,Object> initMap(String method){
		Map<String,Object> param = new HashMap<>();
		param.put("method",method);
		param.put("apiKey", key);
		param.put("version", version);
		return param;
	}
}
