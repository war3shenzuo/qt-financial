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

	// 手机认证
	@RequestMapping(value = "/modal/auth_phone")
	public String auth_phone() {
		return "ajax/modal/auth_phone";
	}

	// 个人信息
	@RequestMapping(value = "/modal/auth_base")
	public String auth_base() {
		return "ajax/modal/auth_base";
	}

	// 身份证认证
	@RequestMapping(value = "/modal/auth_id")
	public String auth_id() {
		return "ajax/modal/auth_id";
	}

	// 微信认证
	@RequestMapping(value = "/modal/auth_wx")
	public String auth_wx() {
		return "ajax/modal/auth_wx";
	}

	// 通讯录授权
	@RequestMapping(value = "/modal/auth_contact")
	public String auth_contact() {
		return "ajax/modal/auth_contact";
	}

	// 查看借款记录
	@RequestMapping(value = "/modal/borrow_list")
	public String borrow_list() {
		return "ajax/modal/borrow_list";
	}

	// 查看借款详情
	@RequestMapping(value = "/borrow_info")
	public String borrow_info() {
		return "ajax/borrow_info";
	}

	// 产品管理
	@RequestMapping(value = "/product")
	public String product() {
		return "ajax/product";
	}

	// 新增产品
	@RequestMapping(value = "/product_add")
	public String product_add() {
		return "ajax/product_add";
	}
}
