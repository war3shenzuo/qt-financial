package com.qtjf.common.bean;

import java.util.Date;

public class QtFinancialUser {
	private String id;

	private String usercode;

	private String username;

	private String usermobile;

	private String useremail;

	private String userstatus;

	private String userlevel;

	private String turename;//TODO 有用到？没用到删了吧
	
	private String truename;

	private String password;

	private String usercid;

	private String iscidvalid;

	private String islockedout;

	private String avatarurl;

	private String inviteuser;

	private Date createdat;

	private String isBorrowMoney;
	
	private String iswxvalid;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsermobile() {
		return usermobile;
	}

	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}

	public String getUserlevel() {
		return userlevel;
	}

	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}

	public String getTurename() {
		return turename;
	}

	public void setTurename(String turename) {
		this.turename = turename;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsercid() {
		return usercid;
	}

	public void setUsercid(String usercid) {
		this.usercid = usercid;
	}

	public String getIscidvalid() {
		return iscidvalid;
	}

	public void setIscidvalid(String iscidvalid) {
		this.iscidvalid = iscidvalid;
	}

	public String getIslockedout() {
		return islockedout;
	}

	public void setIslockedout(String islockedout) {
		this.islockedout = islockedout;
	}

	public String getAvatarurl() {
		return avatarurl;
	}

	public void setAvatarurl(String avatarurl) {
		this.avatarurl = avatarurl;
	}

	public String getInviteuser() {
		return inviteuser;
	}

	public void setInviteuser(String inviteuser) {
		this.inviteuser = inviteuser;
	}

	public Date getCreatedat() {
		return createdat;
	}

	public void setCreatedat(Date createdat) {
		this.createdat = createdat;
	}

	public String getIsBorrowMoney() {
		return isBorrowMoney;
	}

	public void setIsBorrowMoney(String isBorrowMoney) {
		this.isBorrowMoney = isBorrowMoney;
	}

	public String getIswxvalid() {
		return iswxvalid;
	}

	public void setIswxvalid(String iswxvalid) {
		this.iswxvalid = iswxvalid;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}
	
}