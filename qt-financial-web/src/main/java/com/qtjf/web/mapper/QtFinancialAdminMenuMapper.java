package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminMenu;
import com.qtjf.web.vo.MenuVo;

public interface QtFinancialAdminMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAdminMenu record);

    QtFinancialAdminMenu selectByPrimaryKey(Integer id);

    List<QtFinancialAdminMenu> selectAll();

    int updateByPrimaryKey(QtFinancialAdminMenu record);

	List<MenuVo> selectByUserId(Integer id);
}