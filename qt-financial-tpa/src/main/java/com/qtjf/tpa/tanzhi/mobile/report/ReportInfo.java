package com.qtjf.tpa.tanzhi.mobile.report;

import com.qtjf.tpa.tanzhi.mobile.report.reportInfo.Communication_sub_level;
import com.qtjf.tpa.tanzhi.mobile.report.reportInfo.Consumption_sub_level;
import com.qtjf.tpa.tanzhi.mobile.report.reportInfo.Identity_sub_level;
import com.qtjf.tpa.tanzhi.mobile.report.reportInfo.Relationship_sub_level;

public class ReportInfo {
	private String report_no;
	private String time;
	private String risk_level;
	private Integer score;
	private Integer identity_level;
	private Integer consumption_level;
	private Integer communication_level;
	private Integer relationship_level;
	
	private Communication_sub_level communication_sub_level; // Version:1.1.0
	private Consumption_sub_level consumption_sub_level; // Version:1.1.0
	private Identity_sub_level identity_sub_level; // Version:1.1.0
	private Relationship_sub_level relationship_sub_level; // Version:1.1.0
	
	
	public String getReport_no() {
		return report_no;
	}
	public void setReport_no(String report_no) {
		this.report_no = report_no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRisk_level() {
		return risk_level;
	}
	public void setRisk_level(String risk_level) {
		this.risk_level = risk_level;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getIdentity_level() {
		return identity_level;
	}
	public void setIdentity_level(Integer identity_level) {
		this.identity_level = identity_level;
	}
	public Integer getConsumption_level() {
		return consumption_level;
	}
	public void setConsumption_level(Integer consumption_level) {
		this.consumption_level = consumption_level;
	}
	public Integer getCommunication_level() {
		return communication_level;
	}
	public void setCommunication_level(Integer communication_level) {
		this.communication_level = communication_level;
	}
	public Integer getRelationship_level() {
		return relationship_level;
	}
	public void setRelationship_level(Integer relationship_level) {
		this.relationship_level = relationship_level;
	}
	public Communication_sub_level getCommunication_sub_level() {
		return communication_sub_level;
	}
	public void setCommunication_sub_level(Communication_sub_level communication_sub_level) {
		this.communication_sub_level = communication_sub_level;
	}
	public Consumption_sub_level getConsumption_sub_level() {
		return consumption_sub_level;
	}
	public void setConsumption_sub_level(Consumption_sub_level consumption_sub_level) {
		this.consumption_sub_level = consumption_sub_level;
	}
	public Identity_sub_level getIdentity_sub_level() {
		return identity_sub_level;
	}
	public void setIdentity_sub_level(Identity_sub_level identity_sub_level) {
		this.identity_sub_level = identity_sub_level;
	}
	public Relationship_sub_level getRelationship_sub_level() {
		return relationship_sub_level;
	}
	public void setRelationship_sub_level(Relationship_sub_level relationship_sub_level) {
		this.relationship_sub_level = relationship_sub_level;
	}
}
