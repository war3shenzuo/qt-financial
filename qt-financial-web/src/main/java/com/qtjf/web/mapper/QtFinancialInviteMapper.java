package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialInvite;

public interface QtFinancialInviteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialInvite record);

    QtFinancialInvite selectByPrimaryKey(Integer id);

    List<QtFinancialInvite> selectAll();

    int updateByPrimaryKey(QtFinancialInvite record);
}