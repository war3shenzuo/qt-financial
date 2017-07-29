package com.qtjf.tpa.tanzhi.util;

import java.util.Arrays;
import java.util.Map;

public class MapParamUtil {
	
	public enum SignType{
		MD5,SHA1
	}

	/**
	 * 将Map参数集合按key值排序 并封装成k1=v1&ke2=v2&....&kn=vn 的形式
	 * @param params 参数Map集合
	 * @return
	 */
	public static String sortParam(Map<String,? extends Object> params){
		StringBuilder sb = new StringBuilder();
		
		//jdk8 及以上版本的排序
//		params.keySet().stream().sorted()
//		.filter(k -> !"sign".equalsIgnoreCase(k)&&params.get(k)!=null)
//		.forEach(k -> sb.append(k).append("=").append(params.get(k)).append("&"));
//		return sb.length()>1?sb.substring(0, sb.length()-1):null;
		
		//jdk 7以及以下的排序方法
		Object[] keys = params.keySet().toArray();
		Arrays.sort(keys);
		for (Object key : keys) {
			if(!"sign".equals(key)&&key!=null&&!key.toString().isEmpty())
				sb.append(key).append("=").append(params.get(key)).append("&");
		}
		return sb.length()>1?sb.substring(0, sb.length()-1):null;
	}
	
	
	/**
	 * Map集合对参数进行签名
	 * @param params 参数Map集合
	 * @param key 签名规则中的key
	 * @return
	 */
	public static String signParam(Map<String,? extends Object> params,String key){
		return signParam(sortParam(params),key);
	}

	/**
	 * 对已经组装好的参数字符串进行签名
	 * @param params 参数字符串
	 * @param key 签名key
	 * @return
	 */
	public static String signParam(String params,String key){
		String signStr = key!=null&&key.length()>0?params+key:params;
		return HashUtil.SHA1(signStr);
	}
}
