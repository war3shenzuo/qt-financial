package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUserCoupon;

public interface CouponServer {

	List<QtFinancialUserCoupon> getCoupons(String userId);

}
