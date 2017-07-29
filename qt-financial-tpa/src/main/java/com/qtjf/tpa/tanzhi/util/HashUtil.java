package com.qtjf.tpa.tanzhi.util;

import java.security.MessageDigest;

/**
 * @author darren
 * @date 2016年6月20日 上午10:59:10
 */
public class HashUtil {
	/**
	 * MD5加密
	 * 
	 * @param content
	 *            待加密文本
	 * @return
	 */
	public static String MD5(Object content) {
		return encryption("MD5", content);
	}

	/**
	 * SHA-1加密
	 * 
	 * @param content
	 *            待加密文本
	 * @return
	 */
	public static String SHA1(Object content) {
		return encryption("SHA-1", content);
	}

	/**
	 * MD5、SHA-1 等通用加密方法
	 * 
	 * @param type
	 *            加密方法
	 * @param content
	 *            待加密文本
	 * @return
	 */
	private static String encryption(String type, Object content) {
		try {
			MessageDigest md = MessageDigest.getInstance(type);
			md.update(content.toString().getBytes("UTF-8"));
			byte[] hash = md.digest();
			StringBuilder secpwd = new StringBuilder();
			for (int i = 0; i < hash.length; i++) {
				int v = hash[i] & 0xFF;
				if (v < 16) secpwd.append(0);
				secpwd.append(Integer.toString(v, 16));
			}
			return secpwd.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
