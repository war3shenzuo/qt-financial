package com.qtjf.tpa.jdt.server;

import java.util.Map;

public interface PullServer {

	public String Communication(String token, String demandId, String dmandKey, String dataTime);

	/** accessToken获取接口 */
	public Map<String, Object> AccessToken(String org, String secret);

	/** getSSPdata获取报告 */
	public Map<String, Object> getSSPdata(String org, String secret, String accessToken, String token);

	/** 未拉取报告查询接口 */
	public Map<String, Object> QueryOustandingTokens(String org, String secret, String accessToken);

	/** 商户3日流量查询接口 */
	public Map<String, Object> QueryTokensByDemand(String org, String secret, String accessToken, String demandKey);

	/** 账户下所有商户列表查询 */
	public Map<String, Object> QueryConsume(String org, String secret, String accessToken);
}
