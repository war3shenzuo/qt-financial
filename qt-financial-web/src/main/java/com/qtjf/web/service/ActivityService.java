package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinancialActivity;

public interface ActivityService {

	Map<String, Object> getActivities();

	Map<String, Object> getActivity(Integer id);

	Map<String, Object> saveActivity(QtFinancialActivity qg);

	Map<String, Object> editActivity(QtFinancialActivity qg);

	Map<String, Object> deleteActivity(Integer id);


}
