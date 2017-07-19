package com.qtjf.web.mapper;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinacialProduct;

public interface QtFinacialProductMapper {

    QtFinacialProduct selectByPrimaryKey(String id);

    List<QtFinacialProduct> selectAll();
    
    int insert(QtFinacialProduct record);

    //分页查找产品数据
	List<QtFinacialProduct> selectAllByPage(Map<String, Object> paramMap);

	//分页查找产品数据总数
	int selectAllByPageCount(Map<String, Object> paramMap);

}