package com.qtjf.appserver.dao;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationBase;

public interface QtFinacialAuthenticationBaseMapper {
    int insert(QtFinacialAuthenticationBase record);

    List<QtFinacialAuthenticationBase> selectAll();
    
	void update(QtFinacialAuthenticationBase userBase);

	QtFinacialAuthenticationBase selectById(String id);
}