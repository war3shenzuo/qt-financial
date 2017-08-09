package com.qtjf.web.vo;

import java.util.List;

import com.qtjf.web.entity.QtFinancialAdminMenu;

public class MenuVo extends QtFinancialAdminMenu {
	
	private List<QtFinancialAdminMenu> list;

	public List<QtFinancialAdminMenu> getList() {
		return list;
	}

	public void setList(List<QtFinancialAdminMenu> list) {
		this.list = list;
	}
	
}
