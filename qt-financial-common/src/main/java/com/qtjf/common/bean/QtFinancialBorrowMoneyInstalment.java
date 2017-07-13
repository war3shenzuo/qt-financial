package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialBorrowMoneyInstalment {
    private String id;

    private String borrowmoneyId;

    private BigDecimal amount;

    private Date repayAt;

    private String status;

    private BigDecimal overdueAmount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	public String getBorrowmoneyId() {
		return borrowmoneyId;
	}

	public void setBorrowmoneyId(String borrowmoneyId) {
		this.borrowmoneyId = borrowmoneyId;
	}

	public Date getRepayAt() {
		return repayAt;
	}

	public void setRepayAt(Date repayAt) {
		this.repayAt = repayAt;
	}

	public BigDecimal getOverdueAmount() {
		return overdueAmount;
	}

	public void setOverdueAmount(BigDecimal overdueAmount) {
		this.overdueAmount = overdueAmount;
	}

}