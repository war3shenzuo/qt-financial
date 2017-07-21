package com.qtjf.jdt.util;

import java.util.Map;

import org.springframework.web.client.RestTemplate;

@SuppressWarnings("unchecked")
public class CreditFlowUtil {

	private RestTemplate template;

	private String host;
	
	/**
	 * @param host 远程地址
	 * @param template 自定义模版对象
	 */
	public CreditFlowUtil(String host, RestTemplate template) {

		this.template = template;

		this.host = host;
	}

	public String Communication(String token, String demandId, String dmandKey, String dataTime) {

		return "hi! " + token;
	}

	/** accessToken获取接口 */
	public Map<String, Object> AccessToken(String org, String secret) {

		String url = host + "AccessToken?org=" + org + "&secret=" + secret;

		Map<String, Object> map = template.getForObject(url, Map.class);

		return map;
	}

	/** getSSPdata获取报告 */
	public Map<String, Object> getSSPdata(String org, String secret, String accessToken, String token) {

		String url = host + "GetSSPData?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken + "&token="
				+ token;

		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/** 未拉取报告查询接口 */
	public Map<String, Object> QueryOustandingTokens(String org, String secret, String accessToken) {

		String url = host + "QueryOustandingTokens?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken;

		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/** 商户3日流量查询接口 */
	public Map<String, Object> QueryTokensByDemand(String org, String secret, String accessToken, String demandKey) {

		String url = host + "QueryTokensByDemand??org=" + org + "&secret=" + secret + "&accessToken=" + accessToken
				+ "&demandKey=" + demandKey;

		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/** 账户下所有商户列表查询 */
	public Map<String, Object> QueryConsume(String org, String secret, String accessToken) {

		String url = host + "QueryConsume?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken;

		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

}
