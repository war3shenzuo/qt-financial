package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinanicalEdition;

public interface QtFinanicalEditionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinanicalEdition record);

    QtFinanicalEdition selectByPrimaryKey(Integer id);

    List<QtFinanicalEdition> selectAll();

    int updateByPrimaryKey(QtFinanicalEdition record);
}