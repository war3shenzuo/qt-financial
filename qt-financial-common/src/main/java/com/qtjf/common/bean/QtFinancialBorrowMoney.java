package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialBorrowMoney {
    private Integer id;

    private String productid;

    private String couponid;

    private String userid;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getCouponid() {
        return couponid;
    }

    public void setCouponid(String couponid) {
        this.couponid = couponid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
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