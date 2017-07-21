package com.qtjf.jdt.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.qtjf.jdt.util.CreditFlowUtil;

@RestController
public class CreditFlowController {

	@Autowired
	private RestTemplate template;
	
	@Value("${jdt.testHost}")
	private String host;

	/**
	 * 实时通告接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "Communication", method = RequestMethod.POST)
	public String Communication(String token, String demandId, String dmandKey, String dataTime,
			HttpServletRequest req) {

		req.getSession().setAttribute("token", token);
		req.getSession().setAttribute("dmandKey", dmandKey);
		return "hi! " + token;
	}

	/**
	 * accessToken获取接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "AccessToken", method = RequestMethod.GET)
	public Map<String, Object> AccessToken(String org, String secret, HttpServletRequest req) {
		
		req.getSession().setAttribute("org", org);
		req.getSession().setAttribute("secret", secret);

		//String url = host + "AccessToken?org=" + org + "&secret=" + secret;
		
		CreditFlowUtil util = new CreditFlowUtil(host,template);
		
		Map<String, Object> map = util.AccessToken(org, secret);

		if (Objects.equals(map.get("result"), "SUCCESS")) {
			req.getSession().setAttribute("accessToken", map.get("accessToken"));
		}

		return map;
	}

	@RequestMapping(value = "GetSSPData", method = RequestMethod.GET)
	public Map<String,Object> getSSPdata(HttpServletRequest req ,String accessToken ) {
		
		Map<String, String> map = getOrgInfo(req);

		String url = host + "GetSSPData?org=" + map.get("orgName") + "&secret=" + map.get("secret")
				+ "&accessToken=" + accessToken+"&token="+ map.get("token");
		
		System.out.println(url);
		@SuppressWarnings("unchecked")
		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/**
	 * 未拉取报告查询接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "QueryOustandingTokens", method = RequestMethod.GET)
	public Map<String, Object> QueryOustandingTokens(HttpServletRequest req) {

		Map<String, String> map = getOrgInfo(req);
		String url = host + "QueryOustandingTokens?org=" + map.get("orgName") + "&secret=" + map.get("secret")
				+ "&accessToken=" + map.get("accessToken");
		
		@SuppressWarnings("unchecked")
		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/**
	 * 商户3日流量查询接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "QueryTokensByDemand", method = RequestMethod.GET)
	public Map<String, Object> QueryTokensByDemand(HttpServletRequest req) {

		Map<String, String> map = getOrgInfo(req);

		String url = host + "QueryTokensByDemand??org=" + map.get("orgName") + "&secret=" + map.get("secret")
				+ "&accessToken=" + map.get("accessToken") + "&demandKey=" + map.get("demandKey");

		@SuppressWarnings("unchecked")
		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	/**
	 * 账户下所有商户列表查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "QueryConsume", method = RequestMethod.GET)
	public Map<String, Object> QueryConsume(HttpServletRequest req) {
		
		Map<String, String> map = getOrgInfo(req);
		String url = host + "QueryConsume?org=" + map.get("orgName") + "&secret=" + map.get("secret") + "&accessToken="
				+ map.get("accessToken");

		@SuppressWarnings("unchecked")
		Map<String, Object> result = template.getForObject(url, Map.class);

		return result;
	}

	private Map<String, String> getOrgInfo(HttpServletRequest req) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("token", (String) req.getSession().getAttribute("token"));
		map.put("orgName", (String) req.getSession().getAttribute("org"));
		map.put("secret", (String) req.getSession().getAttribute("secret"));
		map.put("accessToken", (String) req.getSession().getAttribute("accessToken"));
		map.put("demandKey", (String) req.getSession().getAttribute("demandKey"));

		return map;

	}

}
