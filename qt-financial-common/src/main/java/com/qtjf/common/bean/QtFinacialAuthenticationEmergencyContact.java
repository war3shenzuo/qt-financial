package com.qtjf.common.bean;

public class QtFinacialAuthenticationEmergencyContact {
    private String id;

    private String relationship;

    private String relationshipPhone;

    private String social;

    private String socialPhone;


    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getRelationshipPhone() {
        return relationshipPhone;
    }

    public void setRelationshipPhone(String relationshipPhone) {
        this.relationshipPhone = relationshipPhone;
    }

    public String getSocial() {
        return social;
    }

    public void setSocial(String social) {
        this.social = social;
    }

    public String getSocialPhone() {
        return socialPhone;
    }

    public void setSocialPhone(String socialPhone) {
        this.socialPhone = socialPhone;
    }
}