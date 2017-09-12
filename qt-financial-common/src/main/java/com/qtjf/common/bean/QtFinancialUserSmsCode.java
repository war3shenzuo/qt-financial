package com.qtjf.common.bean;

public class QtFinancialUserSmsCode {

    private String mobile;
    private Integer smsCode;
    private Long createdAt;
    private Long passAt;
    private String type;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getSmsCode() {
        return smsCode;
    }

    public void setSmsCode(Integer smsCode) {
        this.smsCode = smsCode;
    }

    public Long getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Long createdAt) {
        this.createdAt = createdAt;
    }

    public Long getPassAt() {
        return passAt;
    }

    public void setPassAt(Long passAt) {
        this.passAt = passAt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
