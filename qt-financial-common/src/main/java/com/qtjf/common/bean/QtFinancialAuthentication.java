package com.qtjf.common.bean;

import java.util.Date;

public class QtFinancialAuthentication {
    private String id;

    private String userid;

    private String authtype;

    private String authstatus;

    private String authenticationid;

    private Date createdat;

    private Date updatedat;



    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAuthtype() {
        return authtype;
    }

    public void setAuthtype(String authtype) {
        this.authtype = authtype;
    }

    public String getAuthstatus() {
        return authstatus;
    }

    public void setAuthstatus(String authstatus) {
        this.authstatus = authstatus;
    }

    public Date getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Date createdat) {
        this.createdat = createdat;
    }

    public Date getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Date updatedat) {
        this.updatedat = updatedat;
    }

	public String getAuthenticationid() {
		return authenticationid;
	}

	public void setAuthenticationid(String authenticationid) {
		this.authenticationid = authenticationid;
	}
    
    

}