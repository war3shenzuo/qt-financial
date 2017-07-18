package com.qtjf.jwt.entity;

import org.springframework.stereotype.Component;

/**
 * @author shixianjie
 * @create 2017-04-08
 */
@Component
public class JwtConfig {

    private String base64Secret;
    private String tokenType;
    private long expiresSecond;
	public String getBase64Secret() {
		return base64Secret;
	}
	public void setBase64Secret(String base64Secret) {
		this.base64Secret = base64Secret;
	}
	public String getTokenType() {
		return tokenType;
	}
	public void setTokenType(String tokenType) {
		this.tokenType = tokenType;
	}
	public long getExpiresSecond() {
		return expiresSecond;
	}
	public void setExpiresSecond(long expiresSecond) {
		this.expiresSecond = expiresSecond;
	}


}
