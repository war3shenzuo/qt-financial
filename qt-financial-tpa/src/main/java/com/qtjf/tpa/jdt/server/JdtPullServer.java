package com.qtjf.tpa.jdt.server;

import org.springframework.web.client.RestTemplate;

public class JdtPullServer implements PullServer {

	private RestTemplate template;

	private String host;

	private volatile static JdtPullServer jdtPullServer = null;

	/**
	 * @param host
	 *            远程地址
	 * @param template
	 *            自定义模版对象
	 */
	private JdtPullServer(String host, RestTemplate template) {

		this.template = template;

		this.host = host;
	}

	/** accessToken获取接口 */
	public String AccessToken(String org, String secret) {

		String url = host + "AccessToken?org=" + org + "&secret=" + secret;

		String result = template.getForObject(url, String.class);

		return result;
	}

	/** getSSPdata获取报告 */
	public String getSSPdata(String org, String secret, String accessToken, String token) {

		String url = host + "GetSSPData?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken + "&token="
				+ token;

		String result = template.getForObject(url, String.class);

		return result;
	}

	/** 未拉取报告查询接口 */
	public String QueryOustandingTokens(String org, String secret, String accessToken) {

		String url = host + "QueryOustandingTokens?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken;

		String result = template.getForObject(url, String.class);

		return result;
	}

	/** 商户3日流量查询接口 */
	public String QueryTokensByDemand(String org, String secret, String accessToken, String demandKey) {

		String url = host + "QueryTokensByDemand??org=" + org + "&secret=" + secret + "&accessToken=" + accessToken
				+ "&demandKey=" + demandKey;

		String result = template.getForObject(url, String.class);

		return result;
	}

	/** 账户下所有商户列表查询 */
	public String QueryConsume(String org, String secret, String accessToken) {

		String url = host + "QueryConsume?org=" + org + "&secret=" + secret + "&accessToken=" + accessToken;

		String result = template.getForObject(url, String.class);

		return result;
	}

	public static JdtPullServer getInstance(String host, RestTemplate template) {
		if (jdtPullServer == null) {
			synchronized (JdtPullServer.class) {
				if (jdtPullServer == null) {
					jdtPullServer = new JdtPullServer(host, template);
				}
			}
		}
		return jdtPullServer;
	}

}
