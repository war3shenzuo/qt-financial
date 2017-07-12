package com.qtjf.web.mapper;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinancialUser;

public interface QtFinancialUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialUser record);

    QtFinancialUser selectByPrimaryKey(Integer id);

    List<QtFinancialUser> selectAll();

    int updateByPrimaryKey(QtFinancialUser record);
    
    //分页查找客户数据
  	List<QtFinancialUser> selectAllByPage(Map<String, Object> paramMap);

  	//分页查找客户数据总数
  	int selectAllByPageCount(Map<String, Object> paramMap);
}