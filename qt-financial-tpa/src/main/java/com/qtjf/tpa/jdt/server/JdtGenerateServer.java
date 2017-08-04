package com.qtjf.tpa.jdt.server;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSONObject;
import com.qtjf.tpa.jdt.bean.UserInfo;
import com.qtjf.tpa.jdt.bean.UserParam;

public class JdtGenerateServer implements GenerateServer {

	private RestTemplate template;

	private String host;

	private volatile static JdtGenerateServer jdtGenerateServer = null;

	/**
	 * @param host 远程地址
	 * @param template 自定义模版对象
	 */
	private JdtGenerateServer(String host, RestTemplate template) {
		this.template = template;
		this.host = host;
	}

	@Override
	public String reqToken(String app_id, String perso_name, String mobile_number, String id_number) {

		String url = host + "security/reqToken";

		MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
		params.add("app_id", app_id);
		params.add("perso_name", perso_name);
		params.add("mobile_number", mobile_number);
		params.add("id_number", id_number);
		return template.postForObject(url, params, String.class);
	}

	@Override
	public String submitApplicationInfo(UserInfo user, String dk, String token) {
		String url = host + "api/submitApplicationInfo";

		UserParam params = new UserParam();
		params.setApplication(user);
		params.setDk(dk);
		params.setToken(token);
		String json = JSONObject.toJSONString(params);
		System.out.println(json);
		return template.postForObject(url, json, String.class);
	}

	@Override
	public String submitMobile(String dk, String token, String password, String captcha) {

		String url = host + "api/submitMobile";

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dk", dk);
		params.put("token", token);
		params.put("password", password);
		params.put("captcha", captcha);
		String json = JSONObject.toJSONString(params);
		return template.postForObject(url, json, String.class);
	}

	@Override
	public String finishApplication(String dk, String token, Integer durationNumber, Integer lovDurationType,
			Integer requestAmount) {

		String url = host + "api/finishApplication";

		Map<String, Integer> application = new HashMap<String, Integer>();
		application.put("durationNumber", durationNumber);
		application.put("lovDurationType", lovDurationType);
		application.put("requestAmount", requestAmount);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dk", dk);
		params.put("token", token);
		params.put("application", application);

		String json = JSONObject.toJSONString(params);
		return template.postForObject(url, json, String.class);
	}
	

	public static JdtGenerateServer getInstance(String host, RestTemplate template) {
		if (jdtGenerateServer == null) {
			synchronized (JdtGenerateServer.class) {
				if (jdtGenerateServer == null) {
					jdtGenerateServer = new JdtGenerateServer(host, template);
				}
			}
		}
		return jdtGenerateServer;
	}

}
