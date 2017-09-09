package com.qtjf.appserver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtjf.common.emus.SysStatus;
import com.qtjf.common.vo.ResultCode;

@ControllerAdvice
public class GlobalExceptionHandler {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@ExceptionHandler(value = Exception.class)
	@ResponseBody
	public ResultCode exception(Exception e) {
		logger.error(e.getMessage(), e);
		return ResultCode.getFail("操作失败！请联系管理员---"+e.getMessage());
	}

	@ExceptionHandler(BindException.class)
	public ResultCode bindExceptionHandler(BindException e) {
		return new ResultCode(SysStatus.PARAM_FAULT.getStatus(),SysStatus.PARAM_FAULT.getMsg()+e.getMessage());
	}

}
