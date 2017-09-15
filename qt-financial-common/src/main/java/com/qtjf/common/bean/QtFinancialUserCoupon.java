package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialUserCoupon {
    private String id;

    private String userId;

    private String couponId;

    private Date endDate;

    private Date startDate;

    private String status;

    private Date createdAt;

    private String source;


    private BigDecimal limitAmount;

    private String limitUserLevel;

    private String limitProduct;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getCouponId() {
        return couponId;
    }

    public void setCouponId(String couponId) {
        this.couponId = couponId;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public BigDecimal getLimitAmount() {
        return limitAmount;
    }

    public void setLimitAmount(BigDecimal limitAmount) {
        this.limitAmount = limitAmount;
    }

    public String getLimitUserLevel() {
        return limitUserLevel;
    }

    public void setLimitUserLevel(String limitUserLevel) {
        this.limitUserLevel = limitUserLevel;
    }

    public String getLimitProduct() {
        return limitProduct;
    }

    public void setLimitProduct(String limitProduct) {
        this.limitProduct = limitProduct;
    }
}