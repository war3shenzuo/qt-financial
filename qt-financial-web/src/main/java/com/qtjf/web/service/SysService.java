package com.qtjf.web.service;

import java.util.Map;

import com.qtjf.common.bean.QtFinanicalEdition;

public interface SysService {
	
	Map<String, Object> getEditions();

	Map<String, Object> getEdition(Integer id);

	Map<String, Object> saveEdition(QtFinanicalEdition qg);

	Map<String, Object> editEdition(QtFinanicalEdition qg);

	Map<String, Object> deleteEdition(Integer id);
}
