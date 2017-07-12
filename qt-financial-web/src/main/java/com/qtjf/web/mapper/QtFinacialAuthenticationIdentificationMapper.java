package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationIdentification;

public interface QtFinacialAuthenticationIdentificationMapper {
    int insert(QtFinacialAuthenticationIdentification record);

    List<QtFinacialAuthenticationIdentification> selectAll();
    
    QtFinacialAuthenticationIdentification selectByUserId(String userId);
}