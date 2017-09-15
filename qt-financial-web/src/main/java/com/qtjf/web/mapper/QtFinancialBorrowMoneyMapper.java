package com.qtjf.web.mapper;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.web.vo.QtFinancialBorrowMoneyAndUser;

public interface QtFinancialBorrowMoneyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialBorrowMoney record);

    QtFinancialBorrowMoney selectByPrimaryKey(String id);

    List<QtFinancialBorrowMoney> selectAll(QtFinancialBorrowMoney bm);

    int updateByPrimaryKey(QtFinancialBorrowMoney record);

	List<QtFinancialBorrowMoneyAndUser> selectManageAll(Map<String, Object> paramMap);

	int selectAllByPageCount(Map<String, Object> paramMap);

	List<QtFinancialBorrowMoneyAndUser> selectAllAndUser(QtFinancialBorrowMoney qm);

	QtFinancialBorrowMoneyAndUser selectBorrowInfo(String id);

	List<QtFinancialBorrowMoneyAndUser> selectPayAll(Map<String, Object> paramMap);

	int selectPayAllCount(Map<String, Object> paramMap);
}