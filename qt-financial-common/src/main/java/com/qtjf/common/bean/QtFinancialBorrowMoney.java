package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.List;

public class QtFinancialBorrowMoney {
    private String id;

    private String productId;

    private String couponId;

    private String userId;

    private BigDecimal amount;

    private String daynum;

    private String status;

    private BigDecimal arriveAmount;

    private BigDecimal auditCost;

    private BigDecimal factorageCost;

    private BigDecimal manageCost;

    private BigDecimal reductionExemption;

    private Long applyAt;

    private Long createdAt;
    
    private List<QtFinancialBorrowMoneyFlow> borrowMoneyFlow;


    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDaynum() {
        return daynum;
    }

    public void setDaynum(String daynum) {
        this.daynum = daynum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	public Long getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Long createdAt) {
		this.createdAt = createdAt;
	}

	public Long getApplyAt() {
		return applyAt;
	}

	public void setApplyAt(Long applyAt) {
		this.applyAt = applyAt;
	}

	public BigDecimal getArriveAmount() {
		return arriveAmount;
	}

	public void setArriveAmount(BigDecimal arriveAmount) {
		this.arriveAmount = arriveAmount;
	}

	public BigDecimal getAuditCost() {
		return auditCost;
	}

	public void setAuditCost(BigDecimal auditCost) {
		this.auditCost = auditCost;
	}

	public BigDecimal getFactorageCost() {
		return factorageCost;
	}

	public void setFactorageCost(BigDecimal factorageCost) {
		this.factorageCost = factorageCost;
	}

	public BigDecimal getManageCost() {
		return manageCost;
	}

	public void setManageCost(BigDecimal manageCost) {
		this.manageCost = manageCost;
	}

	public BigDecimal getReductionExemption() {
		return reductionExemption;
	}

	public void setReductionExemption(BigDecimal reductionExemption) {
		this.reductionExemption = reductionExemption;
	}

	public List<QtFinancialBorrowMoneyFlow> getBorrowMoneyFlow() {
		return borrowMoneyFlow;
	}

	public void setBorrowMoneyFlow(List<QtFinancialBorrowMoneyFlow> borrowMoneyFlow) {
		this.borrowMoneyFlow = borrowMoneyFlow;
	}

	


}