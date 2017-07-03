package com.qtjf.common.bean;

import java.math.BigDecimal;

public class QtFinacialProduct {
    private String id;

    private String productname;

    private String productcode;

    private BigDecimal amount;

    private BigDecimal factorageCost;
    
    private BigDecimal auditCost;
    
    private BigDecimal manageCost;

    private String rate;

    private String daynum;

    private String userlevel;

    private String isactivated;

    private Long createdat;

    private Integer createdby;

    private Long updatedat;

    private Integer updateby;
    
    private Integer succeeNum;//用户成功消费次数
    
    private BigDecimal arriveAmount;//到账
    
    private BigDecimal repaymentAmount;//应还
    
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductcode() {
        return productcode;
    }

    public void setProductcode(String productcode) {
        this.productcode = productcode;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getFactorageCost() {
		return factorageCost;
	}

	public void setFactorageCost(BigDecimal factorageCost) {
		this.factorageCost = factorageCost;
	}

	public BigDecimal getAuditCost() {
		return auditCost;
	}

	public void setAuditCost(BigDecimal auditCost) {
		this.auditCost = auditCost;
	}

	public BigDecimal getManageCost() {
		return manageCost;
	}

	public void setManageCost(BigDecimal manageCost) {
		this.manageCost = manageCost;
	}

	public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getDaynum() {
        return daynum;
    }

    public void setDaynum(String daynum) {
        this.daynum = daynum;
    }

    public String getUserlevel() {
        return userlevel;
    }

    public void setUserlevel(String userlevel) {
        this.userlevel = userlevel;
    }

    public String getIsactivated() {
        return isactivated;
    }

    public void setIsactivated(String isactivated) {
        this.isactivated = isactivated;
    }

    public Long getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Long createdat) {
        this.createdat = createdat;
    }

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Long getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Long updatedat) {
        this.updatedat = updatedat;
    }

    public Integer getUpdateby() {
        return updateby;
    }

    public void setUpdateby(Integer updateby) {
        this.updateby = updateby;
    }

	public BigDecimal getArriveAmount() {
		return arriveAmount;
	}

	public void setArriveAmount(BigDecimal arriveAmount) {
		this.arriveAmount = arriveAmount;
	}

	public BigDecimal getRepaymentAmount() {
		return repaymentAmount;
	}

	public void setRepaymentAmount(BigDecimal repaymentAmount) {
		this.repaymentAmount = repaymentAmount;
	}

	public Integer getSucceeNum() {
		return succeeNum;
	}

	public void setSucceeNum(Integer succeeNum) {
		this.succeeNum = succeeNum;
	}
    
    
    
}