package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.List;

public class QtFinacialProduct {
    private String id;

    private String productName;

    private String productCode;

    private BigDecimal amount;

    private BigDecimal auditCost;
    
    private BigDecimal manageCost;

    private String daynum;

    private String userlevel;

    private String isActivated;

    private Long createdat;

    private Integer createdby;

    private Long updatedat;

    private Integer updateby;
    
    private Integer succeeNum;//用户成功消费次数
    
    private BigDecimal arriveAmount;//到账
    
    private String usable;
    
    private Integer dayAmount;//逾期费用  元/天
    
    private List<QtFinancialProductInstalment> instalments;

    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getIsActivated() {
		return isActivated;
	}

	public void setIsActivated(String isActivated) {
		this.isActivated = isActivated;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
        this.amount = amount;
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

	public Integer getSucceeNum() {
		return succeeNum;
	}

	public void setSucceeNum(Integer succeeNum) {
		this.succeeNum = succeeNum;
	}

	public String getUsable() {
		return usable;
	}

	public void setUsable(String usable) {
		this.usable = usable;
	}

	public List<QtFinancialProductInstalment> getInstalments() {
		return instalments;
	}

	public void setInstalments(List<QtFinancialProductInstalment> instalments) {
		this.instalments = instalments;
	}

	public Integer getDayAmount() {
		return dayAmount;
	}

	public void setDayAmount(Integer dayAmount) {
		this.dayAmount = dayAmount;
	}
    
}