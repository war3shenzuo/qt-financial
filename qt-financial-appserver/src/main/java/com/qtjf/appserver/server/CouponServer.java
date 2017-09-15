package com.qtjf.appserver.server;


import com.qtjf.common.bean.QtFinancialUserCoupon;

import java.util.List;
import java.util.Map;

public interface CouponServer {

	List<Map<String,Object>> getCoupons(QtFinancialUserCoupon userCoupon);

}
