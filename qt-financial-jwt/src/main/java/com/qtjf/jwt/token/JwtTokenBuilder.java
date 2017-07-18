package com.qtjf.jwt.token;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.qtjf.jwt.entity.JwtResultMsg;
import com.qtjf.jwt.entity.JwtStatusCode;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.util.Date;
import java.util.Map;

/**
 * JWT 处理token的生成、解码
 * 
 * @author shixianjie
 * @create 2017/07/17
 */
@Component
public class JwtTokenBuilder {

	/**
	 * 生成token
	 * 
	 * @param subject
	 * @param ttlMillis
	 * @param base64Secret
	 * @return
	 * @throws Exception
	 */
	public static String buildToken(String subject, long ttlMillis, String base64Secret) throws Exception {
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		long nowMillis = System.currentTimeMillis();
		Date now = new Date(nowMillis);

		// 生成签名密钥
		byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(base64Secret);
		SecretKey key = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());

		JwtBuilder builder = Jwts.builder().setIssuedAt(now).setSubject(subject).signWith(signatureAlgorithm, key);

		// 设置token过期时间
		if (ttlMillis >= 0) {
			long expMillis = nowMillis + ttlMillis;
			Date exp = new Date(expMillis);
			builder.setExpiration(exp).setNotBefore(now);
		}
		return builder.compact();
	}

	/**
	 * 解码token
	 * 
	 * @param jwt
	 * @param base64Secret
	 * @return
	 */
	public static JwtResultMsg decodeToken(String jwt, String base64Secret) {

		try {
			Claims claims = Jwts.parser().setSigningKey(DatatypeConverter.parseBase64Binary(base64Secret))
					.parseClaimsJws(jwt).getBody();
			return  new JwtResultMsg(JwtStatusCode.OK.getCode(), JwtStatusCode.OK.getMsg(), claims);
		} catch (ExpiredJwtException e) {
			// 过期
			return new JwtResultMsg(JwtStatusCode.EXPIRE_TOKEN.getCode(), JwtStatusCode.EXPIRE_TOKEN.getMsg(), null);
		} catch (SignatureException e) {
			// 签名错误
			return new JwtResultMsg(JwtStatusCode.FORMAT_TOKEN.getCode(), JwtStatusCode.FORMAT_TOKEN.getMsg(), null);
		} 
	}

	public static String buildSubject(@SuppressWarnings("rawtypes") Map map) {
		String subject = JSON.toJSONString(map);
		return subject;
	}
}
