package com.qtjf.common.bean;

import java.math.BigDecimal;

public class QtFinancialBorrowMoneyInstalmentPostpone {
	private String id;

	private String instalmentId;

	private String borrowmoneyId;

	private String daynum;

	private BigDecimal amount;

	private Integer rank;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInstalmentId() {
		return instalmentId;
	}

	public void setInstalmentId(String instalmentId) {
		this.instalmentId = instalmentId;
	}

	public String getBorrowmoneyId() {
		return borrowmoneyId;
	}

	public void setBorrowmoneyId(String borrowmoneyId) {
		this.borrowmoneyId = borrowmoneyId;
	}

	public String getDaynum() {
		return daynum;
	}

	public void setDaynum(String daynum) {
		this.daynum = daynum;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}
}