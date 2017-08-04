package com.qtjf.tpa.tanzhi.server;

import java.util.HashMap;
import java.util.Map;

import com.qtjf.tpa.tanzhi.util.HttpRequest;
import com.qtjf.tpa.tanzhi.util.MapParamUtil;


/**
 * @author darren
 *
 */
public class IdentityVerifyClient {

	private static final String api = "http://api.tanzhishuju.com/api/gateway";
	
	private static final String key ="7352481512931223";
	
	private static final String secret ="x4X7G6E5HfHvpnMaRE2mGrLlzX68h6QR";
	
	private static final String version ="1.0.0";
	
	
	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		
		//身份证二要素验证（姓名、身份证）
		System.out.println(idcard2("史xx", "110101xxxxxxxxxxxx"));
		
		//身份证二要素返照验证（姓名、身份证）
		System.out.println(idcard2p("陈xx", "110101xxxxxxxxxxxx"));
		
		//银行卡二要素验证（银行卡、姓名）
		System.out.println(bankcard2("6214xxxxxxxxxxxx","陈xx"));
		
		//银行卡三要素验证（银行卡、姓名、身份证）
		System.out.println(bankcard3("6214xxxxxxxxxxxx","陈xx", "110101xxxxxxxxxxxx"));
		
		//银行卡四要素验证（银行卡、姓名、身份证、手机号）
		System.out.println(bankcard4("6214xxxxxxxxxxxx","陈xx", "110101xxxxxxxxxxxx","1388888xxxx"));
		
		//运营商三要素验证（姓名、身份证、手机号）
		System.out.println(mp3("陈xx", "110101xxxxxxxxxxxx","1388888xxxx"));
		
		//详细的请求响应报文格式请参阅身份验证文档
		System.out.println("耗时："+(System.currentTimeMillis()-start));
	}
	
	/**
	 * 身份证二要素验证
	 * @param name 姓名
	 * @param identityNo 身份证号
	 * @return
	 */
	public static String idcard2(String name,String identityNo){
		Map<String,Object> param = initParam( "api.identity.idcard2check");
		param.put("name", name);
		param.put("identityNo", identityNo);
		param.put("sign", MapParamUtil.signParam(param,secret));
		return HttpRequest.post(api).put(param).send();
	}
	
	/**
	 * 身份证二要素返照
	 * @param name 姓名
	 * @param identityNo 身份证号
	 * @return
	 */
	public static String idcard2p(String name,String identityNo){
		Map<String,Object> param = initParam( "api.identity.idcard2pcheck");
		param.put("name", name);
		param.put("identityNo", identityNo);
		param.put("sign", MapParamUtil.signParam(param,secret));
		return HttpRequest.post(api).put(param).send();
	}
	
	/**
	 * 银行卡二要素验证
	 * @param bankCardNo 银行卡号
	 * @param name 姓名
	 * @return
	 */
	public static String bankcard2(String bankCardNo,String name){
		Map<String,Object> param = initParam( "api.identity.bankcard2check");
		param.put("bankCardNo", bankCardNo);
		param.put("name", name);
		param.put("sign", MapParamUtil.signParam(param,secret));
		return HttpRequest.post(api).put(param).send();
	}
	
	/**
	 * 银行三要素验证
	 * @param bankCardNo 银行卡号
	 * @param name 姓名
	 * @param identityNo 身份证号
	 * @return
	 */
	public static String bankcard3(String bankCardNo,String name,String identityNo){
		Map<String,Object> param = initParam( "api.identity.bankcard3check");
		param.put("bankCardNo", bankCardNo);
		param.put("name", name);
		param.put("identityNo", identityNo);
		param.put("sign", MapParamUtil.signParam(param,secret));
		param.put("verifyChannel", "CUPS");
		return HttpRequest.post(api).put(param).send();
	}
	
	/**
	 * 银行卡四要素验证
	 * @param bankCardNo 银行卡号
	 * @param name 用户姓名
	 * @param identityNo 身份证号
	 * @param mobile 手机号
	 * @return
	 */
	public static String bankcard4(String bankCardNo,String name,String identityNo,String mobile){
		Map<String,Object> param = initParam( "api.identity.bankcard4check");
		param.put("bankCardNo", bankCardNo);
		param.put("name", name);
		param.put("identityNo", identityNo);
		param.put("mobileNo", mobile);
		param.put("sign", MapParamUtil.signParam(param,secret));
		param.put("verifyChannel", "CUPS");
		return HttpRequest.post(api).put(param).send();
	}

	/**
	 * 运营商三要素验证
	 * @param name 姓名
	 * @param identityNo 身份证号
	 * @param mobile 手机号
	 * @return
	 */
	public static String mp3(String name,String identityNo,String mobile){
		Map<String,Object> param = initParam( "api.identity.mp3check");
		param.put("name", name);
		param.put("identityNo", identityNo);
		param.put("mobileNo", mobile);
		param.put("sign", MapParamUtil.signParam(param,secret));
		return HttpRequest.post(api).put(param).send();
	}
	
	/**
	 * 构造基础的Map参数
	 * @param method
	 * @return
	 */
	private static Map<String,Object> initParam(String method){
		Map<String,Object> param = new HashMap<>();
		param.put("method",method);
		param.put("apiKey", key);
		param.put("version", version);
		return param;
	}
}
