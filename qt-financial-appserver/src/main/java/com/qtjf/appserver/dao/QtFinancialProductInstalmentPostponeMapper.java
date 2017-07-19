package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinancialProductInstalmentPostpone;

public interface QtFinancialProductInstalmentPostponeMapper {
    int deleteByPrimaryKey(String id);

    int insert(QtFinancialProductInstalmentPostpone record);

    QtFinancialProductInstalmentPostpone selectByPrimaryKey(String id);

    List<QtFinancialProductInstalmentPostpone> selectAll();

    int updateByPrimaryKey(QtFinancialProductInstalmentPostpone record);
    
    QtFinancialProductInstalmentPostpone selectInfo(QtFinancialProductInstalmentPostpone id);

}