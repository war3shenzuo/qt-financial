package com.qtjf.tpa.jdt.server;

public interface PullServer {
	/** accessToken获取接口 */
	public String AccessToken(String org, String secret);

	/** getSSPdata获取报告 */
	public String getSSPdata(String org, String secret, String accessToken, String token);

	/** 未拉取报告查询接口 */
	public String QueryOustandingTokens(String org, String secret, String accessToken);

	/** 商户3日流量查询接口 */
	public String QueryTokensByDemand(String org, String secret, String accessToken, String demandKey);

	/** 账户下所有商户列表查询 */
	public String QueryConsume(String org, String secret, String accessToken);
}
