package com.qtjf.common.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SmsUtil {

	private final static String UID = "qingtoujinfu";

	private final static String Key = "06e57d06a95c477e7d4c";
	
	
	public static String loginAuthCode(String mobile,String authCode) throws Exception{
		
		String smsTest = "验证码："+authCode;
		
		return sendSms(mobile,smsTest);
	}
	
	

	private static String sendSms(String mobile, String smsText) throws Exception {

		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://utf8.api.smschinese.cn");
		post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf8");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", UID), new NameValuePair("Key", Key),
				new NameValuePair("smsMob", mobile), new NameValuePair("smsText", smsText) };
		post.setRequestBody(data);

		client.executeMethod(post);
		int statusCode = post.getStatusCode();

		if (statusCode == 200) {
			return new String(post.getResponseBodyAsString().getBytes("utf8"));
		}

		return "fail";

	}

}
