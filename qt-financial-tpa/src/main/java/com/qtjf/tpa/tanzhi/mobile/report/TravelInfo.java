package com.qtjf.tpa.tanzhi.mobile.report;

public class TravelInfo {
	private String during_type;
	private String start_time;
	private String return_time;
	private String departure_place;
	private String destination_place;
	private Integer duration_days; // Version:1.1.0
	
	
	public Integer getDuration_days() {
		return duration_days;
	}
	public void setDuration_days(Integer duration_days) {
		this.duration_days = duration_days;
	}
	public String getDuring_type() {
		return during_type;
	}
	public void setDuring_type(String during_type) {
		this.during_type = during_type;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getReturn_time() {
		return return_time;
	}
	public void setReturn_time(String return_time) {
		this.return_time = return_time;
	}
	public String getDeparture_place() {
		return departure_place;
	}
	public void setDeparture_place(String departure_place) {
		this.departure_place = departure_place;
	}
	public String getDestination_place() {
		return destination_place;
	}
	public void setDestination_place(String destination_place) {
		this.destination_place = destination_place;
	}

}
