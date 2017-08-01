package com.qtjf.web.mapper;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface QtFinancialBorrowMoneyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialBorrowMoney record);

    QtFinancialBorrowMoney selectByPrimaryKey(String id);

    List<QtFinancialBorrowMoney> selectAll(QtFinancialBorrowMoney bm);

    int updateByPrimaryKey(QtFinancialBorrowMoney record);

	List<QtFinancialBorrowMoney> selectManageAll(Map<String, Object> paramMap);

	int selectAllByPageCount(Map<String, Object> paramMap);
}