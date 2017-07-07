package com.qtjf.common.bean;

import java.util.Date;

public class QtFinancialBorrowMoneyFlow {
    private String id;

    private String borrowId;

    private String status;

    private String comment;

    private Date updatedat;

    

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(String borrowId) {
		this.borrowId = borrowId;
	}

	public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Date updatedat) {
        this.updatedat = updatedat;
    }
}