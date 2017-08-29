package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialProductInstalmentPostpone;


public interface QtFinancialProductInstalmentPostponeMapper {
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialProductInstalmentPostpone record);

    QtFinancialProductInstalmentPostpone selectByPrimaryKey(String id);

    List<QtFinancialProductInstalmentPostpone> selectAll();

    int updateByPrimaryKey(QtFinancialProductInstalmentPostpone record);
}