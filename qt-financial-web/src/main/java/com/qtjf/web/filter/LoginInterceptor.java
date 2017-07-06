package com.qtjf.web.filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.qtjf.web.util.StringUtil;



public class LoginInterceptor implements HandlerInterceptor {
    //进入拦截器后，一般用于处理日志
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		// 如果是登录页面则放行
		if (request.getRequestURI().indexOf("login") >= 0) {
			return true;
		}
		// 如果是注册页面则放行
		if (request.getRequestURI().indexOf("register") >= 0) {
			return true;
		}
		if(request.getRequestURI().indexOf("registerUser") >= 0){
			return true;
		}
		//如果是忘记密码的页面则放行
		if(request.getRequestURI().indexOf("forget") >= 0) {
			return true;
		}
		if(request.getRequestURI().indexOf("forgetUser") >= 0) {
			return true;
		}
		HttpSession session = request.getSession();
		// 如果用户已登录也放行
		if (session.getAttribute(StringUtil.adminLogin) != null) {
			return true;
		}
		// 用户没有登录挑战到登录页面
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
				request, response);
		return false;
	}

}
