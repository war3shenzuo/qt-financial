package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinacialProduct;

public interface QtFinacialProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinacialProduct record);

    QtFinacialProduct selectByPrimaryKey(Integer id);

    List<QtFinacialProduct> selectAll();

    int updateByPrimaryKey(QtFinacialProduct record);
}