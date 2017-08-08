package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationProfession;

public interface QtFinacialAuthenticationProfessionMapper {
    int insert(QtFinacialAuthenticationProfession record);

    List<QtFinacialAuthenticationProfession> selectAll();
    
	QtFinacialAuthenticationProfession selectById(String id);

	void update(QtFinacialAuthenticationProfession profeesion);

}