package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialBorrowMoney {
    private String id;

    private String productId;

    private String couponId;

    private String userId;

    private BigDecimal amount;

    private String daynum;

    private String status;

    private Date repaymentdate;

    private BigDecimal repaymentamount;

    private BigDecimal arriveamount;

    private BigDecimal auditcost;

    private BigDecimal factoragecost;

    private Integer rate;

    private BigDecimal managecost;

    private BigDecimal reductionexemption;

    private Date applyat;

    private Date createdat;


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

    public Date getRepaymentdate() {
        return repaymentdate;
    }

    public void setRepaymentdate(Date repaymentdate) {
        this.repaymentdate = repaymentdate;
    }

    public BigDecimal getRepaymentamount() {
        return repaymentamount;
    }

    public void setRepaymentamount(BigDecimal repaymentamount) {
        this.repaymentamount = repaymentamount;
    }

    public BigDecimal getArriveamount() {
        return arriveamount;
    }

    public void setArriveamount(BigDecimal arriveamount) {
        this.arriveamount = arriveamount;
    }

    public BigDecimal getAuditcost() {
        return auditcost;
    }

    public void setAuditcost(BigDecimal auditcost) {
        this.auditcost = auditcost;
    }

    public BigDecimal getFactoragecost() {
        return factoragecost;
    }

    public void setFactoragecost(BigDecimal factoragecost) {
        this.factoragecost = factoragecost;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public BigDecimal getManagecost() {
        return managecost;
    }

    public void setManagecost(BigDecimal managecost) {
        this.managecost = managecost;
    }

    public BigDecimal getReductionexemption() {
        return reductionexemption;
    }

    public void setReductionexemption(BigDecimal reductionexemption) {
        this.reductionexemption = reductionexemption;
    }

    public Date getApplyat() {
        return applyat;
    }

    public void setApplyat(Date applyat) {
        this.applyat = applyat;
    }

    public Date getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Date createdat) {
        this.createdat = createdat;
    }

}