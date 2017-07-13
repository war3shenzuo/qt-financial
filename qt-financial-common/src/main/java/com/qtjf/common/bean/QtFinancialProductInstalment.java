package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialProductInstalment {
    private String id;

    private String productId;

    private BigDecimal amount;

    private Date repayAt;

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

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
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