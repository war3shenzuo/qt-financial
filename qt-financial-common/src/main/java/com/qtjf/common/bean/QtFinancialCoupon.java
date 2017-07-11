package com.qtjf.common.bean;

import java.math.BigDecimal;
import java.util.Date;

public class QtFinancialCoupon {
    private String id;

    private String code;

    private BigDecimal amount;

    private Long limitamount;

    private String limituserlevel;

    private String limitproduct;

    private String comment;

    private Date createdAt;

    private String createdBy;

    private Date updatedAt;

    private String updateBy;
    
    
    private String userId;

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

    public Long getLimitamount() {
        return limitamount;
    }

    public void setLimitamount(Long limitamount) {
        this.limitamount = limitamount;
    }

    public String getLimituserlevel() {
        return limituserlevel;
    }

    public void setLimituserlevel(String limituserlevel) {
        this.limituserlevel = limituserlevel;
    }

    public String getLimitproduct() {
        return limitproduct;
    }

    public void setLimitproduct(String limitproduct) {
        this.limitproduct = limitproduct;
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

	
}