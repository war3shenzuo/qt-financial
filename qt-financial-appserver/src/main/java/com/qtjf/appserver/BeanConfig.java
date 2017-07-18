package com.qtjf.appserver;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.qtjf.jwt.entity.JwtConfig;

/*
 * shixianjie
 * 2017/07/18
 */
@Configuration
public class BeanConfig {
		
	@Value("${jwt.base64secret}")
	private String base64secret;
	@Value("${jwt.expireSecond}")
	private long expireSecond;
	@Value("${jwt.tokenType}")
	private String tokenType;
	
	@Bean
	public JwtConfig setJwtConfig(){
		JwtConfig conf = new JwtConfig();
		conf.setBase64Secret(base64secret);
		conf.setExpiresSecond(expireSecond);
		conf.setTokenType(tokenType);
		return conf;
	}
}
