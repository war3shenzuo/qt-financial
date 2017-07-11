package com.qtjf.common.bean;

import java.util.Date;

public class QtFinancialUserCoupon {
    private String id;

    private String userId;

    private String couponId;

    private Date validstartTime;

    private Date validendTime;

    private String status;

    private Date createdAt;

    private String source;
    
    private QtFinancialCoupon coupon;

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

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public Date getValidstartTime() {
		return validstartTime;
	}

	public void setValidstartTime(Date validstartTime) {
		this.validstartTime = validstartTime;
	}

	public Date getValidendTime() {
		return validendTime;
	}

	public void setValidendTime(Date validendTime) {
		this.validendTime = validendTime;
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

	public QtFinancialCoupon getCoupon() {
		return coupon;
	}

	public void setCoupon(QtFinancialCoupon coupon) {
		this.coupon = coupon;
	}
	
 
}