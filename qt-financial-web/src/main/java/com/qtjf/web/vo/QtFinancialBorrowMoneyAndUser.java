package com.qtjf.web.vo;

import java.util.List;

import com.qtjf.common.bean.QtFinancialAuthentication;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialUser;

public class QtFinancialBorrowMoneyAndUser extends QtFinancialBorrowMoney {
	
	private QtFinancialUser user;
	
	private List<QtFinancialAuthentication> auths;

	public List<QtFinancialAuthentication> getAuths() {
		return auths;
	}

	public void setAuths(List<QtFinancialAuthentication> auths) {
		this.auths = auths;
	}

	public QtFinancialUser getUser() {
		return user;
	}

	public void setUser(QtFinancialUser user) {
		this.user = user;
	}
	
}
