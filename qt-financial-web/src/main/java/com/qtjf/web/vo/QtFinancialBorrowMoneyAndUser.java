package com.qtjf.web.vo;

import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialUser;

public class QtFinancialBorrowMoneyAndUser extends QtFinancialBorrowMoney {
	
	private QtFinancialUser user;

	public QtFinancialUser getUser() {
		return user;
	}

	public void setUser(QtFinancialUser user) {
		this.user = user;
	}
	
}
