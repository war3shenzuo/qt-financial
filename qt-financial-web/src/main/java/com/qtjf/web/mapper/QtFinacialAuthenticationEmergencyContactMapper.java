package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;

public interface QtFinacialAuthenticationEmergencyContactMapper {
    int insert(QtFinacialAuthenticationEmergencyContact record);

    List<QtFinacialAuthenticationEmergencyContact> selectAll();
    
    QtFinacialAuthenticationEmergencyContact selectByUserId(String userId);
}