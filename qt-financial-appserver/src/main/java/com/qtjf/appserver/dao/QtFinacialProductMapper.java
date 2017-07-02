package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinacialProduct;

public interface QtFinacialProductMapper {

    QtFinacialProduct selectByPrimaryKey(String id);

    List<QtFinacialProduct> selectAll();

}