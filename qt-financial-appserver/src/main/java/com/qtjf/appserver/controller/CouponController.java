package com.qtjf.appserver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.CouponServer;
import com.qtjf.common.bean.QtFinancialUserCoupon;
import com.qtjf.common.vo.ResultCode;

/**
 * 优惠券Controller类
 * @author 史贤杰
 * 2017/07/01
 */
@RestController
@RequestMapping("/coupons")
public class CouponController {
	
	@Autowired
	CouponServer couponserver;
	/**
	 * 获取用户的优惠劵
	 * @param userId 用户Id
	 * @return 优惠劵集合
	 */
	@RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
	public ResultCode getUserCoupon(@PathVariable("userId") String userId) {
			List<QtFinancialUserCoupon> list = couponserver.getCoupons(userId);
			return ResultCode.getSuccess("获取用户优惠劵成功", list);
	}
	
	

}
