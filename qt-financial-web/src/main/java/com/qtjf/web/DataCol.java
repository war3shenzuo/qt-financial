package com.qtjf.web;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="data")
public class DataCol {
	
	//分页获取审核数据，类型分审核中和审核完毕的
	@RequestMapping(value = "/all")
	public Map<String,Object> all(String type,Integer start,Integer end) {
		return null;
	}
	
}
