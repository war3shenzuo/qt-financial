package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationWx;

public interface QtFinacialAuthenticationWxMapper {
    int insert(QtFinacialAuthenticationWx record);

    List<QtFinacialAuthenticationWx> selectAll();
}