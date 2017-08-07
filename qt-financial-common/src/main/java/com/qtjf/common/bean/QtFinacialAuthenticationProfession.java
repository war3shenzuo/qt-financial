package com.qtjf.common.bean;

public class QtFinacialAuthenticationProfession {
    private String id;

    private String income;

    private String company;

    private Integer provinceId;

    private Integer cityId;

    private String domain;

    private String companyPhone;


    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }
}