package com.qtjf.tpa.tanzhi.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

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
	
	
	
	private static final String SEPARATOR = "::";
	private static final int SALT_BYTE_SIZE = 8;
	private static final int HASH_BYTE_SIZE = 16;
	private static final int PBKDF2_ITERATIONS = 1024;

	/**
	 * 密码自动加盐加密
	 * @param password 用户的密码
	 * @return 加密后的密码（和盐）
	 */
	public static String createHash(String password){
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[SALT_BYTE_SIZE];
		random.nextBytes(salt);
		byte[] hash = pbkdf2(password.toCharArray(), salt, HASH_BYTE_SIZE);
		return toHex(salt) + SEPARATOR + toHex(hash);
	}

	/**
	 * 验证密码是否正确
	 * @param password 用户输入的原始密码
	 * @param correctHash 带盐的密码
	 * @return 是否验证成功
	 */
	public static boolean validateHash(String password, String correctHash){
		String[] params = correctHash.split(SEPARATOR);
		byte[] salt = fromHex(params[0]);
		byte[] hash = fromHex(params[1]);
		byte[] testHash = pbkdf2(password.toCharArray(), salt, hash.length);
		return slowEquals(hash, testHash);
	}

	private static boolean slowEquals(byte[] a, byte[] b) {
		int diff = a.length ^ b.length;
		for (int i = 0; i < a.length && i < b.length; i++)
			diff |= a[i] ^ b[i];
		return diff == 0;
	}

	private static byte[] pbkdf2(char[] password, byte[] salt, int bytes){
		PBEKeySpec spec = new PBEKeySpec(password, salt, PBKDF2_ITERATIONS, bytes * 8);
		try {
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			return skf.generateSecret(spec).getEncoded();
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static byte[] fromHex(String hex) {
		byte[] binary = new byte[hex.length() / 2];
		for (int i = 0; i < binary.length; i++)
			binary[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
		return binary;
	}

	private static String toHex(byte[] array) {
		BigInteger bi = new BigInteger(1, array);
		String hex = bi.toString(16);
		int paddingLength = (array.length * 2) - hex.length();
		if (paddingLength > 0)
			return String.format("%0" + paddingLength + "d", 0) + hex;
		else
			return hex;
	}

	public static void main(String[] args) {
		String pwd = "123456";
		String hashPwd = HashUtil.createHash(pwd);
		System.out.println("生成的密码为：\n"+hashPwd);
		System.out.println("验证密码："+HashUtil.validateHash(pwd, hashPwd));
		System.out.println(MD5(pwd));
		System.out.println(SHA1(pwd));
	}
}
