package com.qtjf.web.entity;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialProductInstalment {
    private String id;

    private String productid;

    private String instalmentname;

    private Integer rank;

    private BigDecimal amount;

    private Date repayat;

    private BigDecimal overdueamount;

    private String status;

    private Integer daynum;

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

    public String getInstalmentname() {
        return instalmentname;
    }

    public void setInstalmentname(String instalmentname) {
        this.instalmentname = instalmentname;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getRepayat() {
        return repayat;
    }

    public void setRepayat(Date repayat) {
        this.repayat = repayat;
    }

    public BigDecimal getOverdueamount() {
        return overdueamount;
    }

    public void setOverdueamount(BigDecimal overdueamount) {
        this.overdueamount = overdueamount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getDaynum() {
        return daynum;
    }

    public void setDaynum(Integer daynum) {
        this.daynum = daynum;
    }
}