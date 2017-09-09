package com.qtjf.web.mapper;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinancialCouponChild;

public interface QtFinancialCouponChildMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialCouponChild record);

    QtFinancialCouponChild selectByPrimaryKey(Integer id);

    List<QtFinancialCouponChild> selectAll();

    int updateByPrimaryKey(QtFinancialCouponChild record);

	void addBatch(List<QtFinancialCouponChild> list);//批量添加

	int selectAllByPageCount(Map<String, Object> paramMap);

	List<QtFinancialCouponChild> selectAllByPage(Map<String, Object> paramMap);
}