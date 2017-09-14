package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialCoupon {
    private String id;

    private String code;

    private BigDecimal amount;

    private Long limitAmount;

    private String limituserLevel;

    private String limitProduct;

    private String comment;

    private Date createdAt;//有限起始时间  TODO 不知道前段有没有用到这个字段是否会冲突

    private String createdBy;//是否可用

    private Date updatedAt;//有限结束时间

    private String updateBy;

    private String userId;

    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Long getLimitAmount() {
        return limitAmount;
    }

    public void setLimitAmount(Long limitAmount) {
        this.limitAmount = limitAmount;
    }

    public String getLimituserLevel() {
        return limituserLevel;
    }

    public void setLimituserLevel(String limituserLevel) {
        this.limituserLevel = limituserLevel;
    }

    public String getLimitProduct() {
        return limitProduct;
    }

    public void setLimitProduct(String limitProduct) {
        this.limitProduct = limitProduct;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
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
}