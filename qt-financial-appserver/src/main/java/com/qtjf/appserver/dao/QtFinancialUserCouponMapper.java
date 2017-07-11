package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialUserCoupon;

public interface QtFinancialUserCouponMapper {
	int deleteByPrimaryKey(String id);

	int insert(QtFinancialUserCoupon record);

	QtFinancialUserCoupon selectByPrimaryKey(String id);

	List<QtFinancialUserCoupon> selectAll(QtFinancialUserCoupon fuc);

	int updateByPrimaryKey(QtFinancialUserCoupon record);
}