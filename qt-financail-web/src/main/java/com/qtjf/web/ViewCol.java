package com.qtjf.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "view")
public class ViewCol {

	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/index_info")
	public String index_info() {
		return "ajax/index_info";
	}
}
