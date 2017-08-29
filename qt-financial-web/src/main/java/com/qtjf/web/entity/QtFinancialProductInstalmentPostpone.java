package com.qtjf.web.entity;

import java.math.BigDecimal;

public class QtFinancialProductInstalmentPostpone {
    private String id;

    private String productid;

    private String instalmentid;

    private String daynum;

    private BigDecimal amount;

    private Integer rank;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getInstalmentid() {
        return instalmentid;
    }

    public void setInstalmentid(String instalmentid) {
        this.instalmentid = instalmentid;
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