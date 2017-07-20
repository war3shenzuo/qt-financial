package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinanicalBanner;

public interface QtFinanicalBannerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinanicalBanner record);

    QtFinanicalBanner selectByPrimaryKey(Integer id);

    List<QtFinanicalBanner> selectAll();

    int updateByPrimaryKey(QtFinanicalBanner record);
}