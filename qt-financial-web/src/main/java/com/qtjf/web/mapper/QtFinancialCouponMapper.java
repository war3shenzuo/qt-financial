package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialCoupon;

public interface QtFinancialCouponMapper {
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialCoupon record);

    QtFinancialCoupon selectByPrimaryKey(String id);

    List<QtFinancialCoupon> selectAll();

    int updateByPrimaryKey(QtFinancialCoupon record);
}