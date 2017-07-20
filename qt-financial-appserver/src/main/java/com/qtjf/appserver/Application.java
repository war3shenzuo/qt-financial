package com.qtjf.appserver;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.qtjf.jwt.entity.JwtConfig;
import com.qtjf.jwt.filter.HTTPBasicAuthorizeAttribute;

/**
 * spring启动类
 * 
 * @author shixianjie
 */
@SpringBootApplication
@MapperScan("com.qtjf.appserver.dao")
public class Application {
	
	@Autowired
	private JwtConfig jwtconfig;
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

//	@Bean
//	public FilterRegistrationBean basicFilterRegistrationBean() {
//		FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//		HTTPBasicAuthorizeAttribute httpBasicFilter = new HTTPBasicAuthorizeAttribute();
//		registrationBean.setFilter(httpBasicFilter);
//		registrationBean.addInitParameter("base64Secret", jwtconfig.getBase64Secret());
//		registrationBean.addInitParameter("tokenType", jwtconfig.getTokenType());
//		List<String> urlPatterns = new ArrayList<String>();
// 		registrationBean.setUrlPatterns(urlPatterns);
//		return registrationBean;
//	}

}
