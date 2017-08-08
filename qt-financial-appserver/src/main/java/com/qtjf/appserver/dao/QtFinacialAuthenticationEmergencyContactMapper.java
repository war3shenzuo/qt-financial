package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;

public interface QtFinacialAuthenticationEmergencyContactMapper {
    int insert(QtFinacialAuthenticationEmergencyContact record);

    List<QtFinacialAuthenticationEmergencyContact> selectAll();
    
	void update(QtFinacialAuthenticationEmergencyContact emergencyContact);

	QtFinacialAuthenticationEmergencyContact selectById(String id);
}