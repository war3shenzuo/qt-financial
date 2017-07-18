package com.qtjf.jwt.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.qtjf.jwt.entity.JwtConfig;
import com.qtjf.jwt.entity.JwtResultMsg;
import com.qtjf.jwt.entity.JwtStatusCode;
import com.qtjf.jwt.token.JwtTokenBuilder;

public class HTTPBasicAuthorizeAttribute implements Filter {

	private JwtConfig jwtconfig;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		JwtResultMsg result;
		jwtconfig = new JwtConfig();

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String auth = httpRequest.getHeader("Authorization");
		if ((auth != null) && (auth.length() > 7)) {
			String HeadStr = auth.substring(0, 6).toLowerCase();
			if (HeadStr.compareTo("bearer") == 0) {
				auth = auth.substring(7, auth.length());

				JwtResultMsg jrm = JwtTokenBuilder.decodeToken(auth, jwtconfig.getBase64Secret());

				if (jrm.getCode() == 30000) {
					chain.doFilter(request, response);
					return;
				} else {
					getResponse(response).getWriter().write(new ObjectMapper().writeValueAsString(jrm));
					return;
				}
			}
		}

		result = new JwtResultMsg(JwtStatusCode.FAIL.getCode(), JwtStatusCode.FAIL.getMsg(),null);
		getResponse(response).getWriter().write(new ObjectMapper().writeValueAsString(result));
		return;

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	@Override
	public void destroy() {
	}

	private HttpServletResponse getResponse(ServletResponse response) {
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		httpResponse.setCharacterEncoding("UTF-8");
		httpResponse.setContentType("application/json; charset=utf-8");
		httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		return httpResponse;
	}

}