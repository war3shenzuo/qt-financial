package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationProfession;

public interface QtFinacialAuthenticationProfessionMapper {
    int insert(QtFinacialAuthenticationProfession record);

    List<QtFinacialAuthenticationProfession> selectAll();
}