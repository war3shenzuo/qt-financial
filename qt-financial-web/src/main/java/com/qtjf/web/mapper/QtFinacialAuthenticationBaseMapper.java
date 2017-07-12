package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationBase;

public interface QtFinacialAuthenticationBaseMapper {
    int insert(QtFinacialAuthenticationBase record);

    List<QtFinacialAuthenticationBase> selectAll();
    
    QtFinacialAuthenticationBase selectByUserId(String userId);
}