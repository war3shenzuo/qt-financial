package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialActivity;
import com.qtjf.common.bean.QtFinancialCoupon;
import com.qtjf.common.bean.QtFinancialInvite;

public interface ActivityService {

	Map<String, Object> getActivities();//活动

	Map<String, Object> getActivity(Integer id);

	Map<String, Object> saveActivity(QtFinancialActivity qg);

	Map<String, Object> editActivity(QtFinancialActivity qg);

	Map<String, Object> deleteActivity(Integer id);

	Map<String, Object> getInvites();//邀请码

	Map<String, Object> getInvite(Integer id);

	Map<String, Object> saveInvite(QtFinancialInvite qg);

	Map<String, Object> editInvite(QtFinancialInvite qg);

	Map<String, Object> deleteInvite(Integer id);
	
	Map<String, Object> getCoupons();//优惠券

	Map<String, Object> getCoupon(String id);

	Map<String, Object> saveCoupon(QtFinancialCoupon qg);

	Map<String, Object> editCoupon(QtFinancialCoupon qg);

	Map<String, Object> deleteCoupon(String id);

	Map<String, Object> selectCouponCodeAll(Map<String, Object> paramMap);//获取所有码体
}
