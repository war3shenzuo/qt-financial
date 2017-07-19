package com.qtjf.common.bean;

import java.math.BigDecimal;

public class QtFinancialProductInstalmentPostpone {
    private String id;

    private String productId;

    private String instalmentId;

    private String daynum;

    private BigDecimal amount;

    private Integer sort;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getInstalmentId() {
		return instalmentId;
	}

	public void setInstalmentId(String instalmentId) {
		this.instalmentId = instalmentId;
	}
    
    
}