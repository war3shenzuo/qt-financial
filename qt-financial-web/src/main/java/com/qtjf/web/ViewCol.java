package com.qtjf.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qtjf.web.entity.QtFinancialAdminMenu;
import com.qtjf.web.entity.QtFinancialAdminUser;
import com.qtjf.web.service.MenuService;
import com.qtjf.web.util.StringUtil;

@Controller
@RequestMapping(value = "view")
public class ViewCol {
	
	@Autowired
	private MenuService menuService;

	@ModelAttribute("img_url")
	public String getItemTypes() {
		return "http://tonghangimg.oss-cn-shanghai.aliyuncs.com/";// 阿里云oss的前缀
	}


	@RequestMapping(value = "/index")
	public String index(HttpSession session) {
		QtFinancialAdminUser user = (QtFinancialAdminUser)session.getAttribute(StringUtil.adminLogin);
		Map<String,Object> map = menuService.getMenuByUserId(user.getId());
		session.setAttribute("menu", map);
		return "index";
	}

	@RequestMapping(value = "/index_info")
	public String index_info() {
		return "ajax/index_info";
	}
	
	@RequestMapping(value = "/index_info_2")
	public String index_info_2() {
		return "ajax/index_info_2";
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

	// 客户管理
	@RequestMapping(value = "/customer_info")
	public String customer_infos() {
		return "ajax/customer_info";
	}

	// 客户管理-客户详情
	@RequestMapping(value = "/customer_detail")
	public String customer_detail() {
		return "ajax/customer_detail";
	}

	// 活动管理
	@RequestMapping(value = "/activity_info")
	public String activity_info() {
		return "ajax/activity_info";
	}

	// 活动管理-新建活动
	@RequestMapping(value = "/activity_add")
	public String activity_add() {
		return "ajax/activity_add";
	}

	// 活动管理-编辑活动
	@RequestMapping(value = "/activity_edit")
	public String activity_edit() {
		return "ajax/activity_edit";
	}

	// 等待复审
	@RequestMapping(value = "/examine_info")
	public String examine_info() {
		return "ajax/examine_info";
	}

	// 审核记录
	@RequestMapping(value = "/record_info")
	public String record_info() {
		return "ajax/record_info";
	}

	// 订单详情
	@RequestMapping(value = "/record_detail")
	public String record_detail() {
		return "ajax/record_detail";
	}

	// 等待打款
	@RequestMapping(value = "/playmoney_info")
	public String playmoney_info() {
		return "ajax/playmoney_info";
	}

	// 打款详情
	@RequestMapping(value = "/playmoney_detail")
	public String playmoney_detail() {
		return "ajax/playmoney_detail";
	}

	// 打款记录
	@RequestMapping(value = "/playrecond_info")
	public String playrecond_info() {
		return "ajax/playrecond_info";
	}

	// 产品管理
	@RequestMapping(value = "/product_info")
	public String product_info() {
		return "ajax/product_info";
	}

	// 产品管理-新增产品
	@RequestMapping(value = "/product_add")
	public String product_add() {
		return "ajax/product_add";
	}

	// 产品管理-编辑产品
	@RequestMapping(value = "/product_edit")
	public String product_edit() {
		return "ajax/product_edit";
	}

	// 升级策略管理
	@RequestMapping(value = "/upgrade_info")
	public String upgrade_info() {
		return "ajax/upgrade_info";
	}
	
	// banner管理
	@RequestMapping(value = "/banner_info")
	public String banner_info() {
		return "ajax/banner_info";
	}
	
	// banner添加
	@RequestMapping(value = "/banner_add")
	public String banner_add() {
		return "ajax/banner_add";
	}
	
	// banner编辑
	@RequestMapping(value = "/banner_edit")
	public String banner_edit() {
		return "ajax/banner_edit";
	}
	
	// 升级策略管理-编辑
	@RequestMapping(value = "/upgrade_edit")
	public String upgrade_edit() {
		return "ajax/upgrade_edit";
	}

	// 客户分组管理
	@RequestMapping(value = "/group_info")
	public String group_info() {
		return "ajax/group_info";
	}

	// 客户分组管理-新增分组
	@RequestMapping(value = "/group_add")
	public String group_add() {
		return "ajax/group_add";
	}

	// 客户分组管理-编辑分组
	@RequestMapping(value = "/group_edit")
	public String group_edit() {
		return "ajax/group_edit";
	}

	// 邀请码管理
	@RequestMapping(value = "/invitation_info")
	public String invitation_info() {
		return "ajax/invitation_info";
	}

	// 邀请码管理-新增邀请码
	@RequestMapping(value = "/invitation_add")
	public String invitation_add() {
		return "ajax/invitation_add";
	}

	// 邀请码管理-编辑邀请码
	@RequestMapping(value = "/invitation_edit")
	public String invitation_edit() {
		return "ajax/invitation_edit";
	}

	// 活动管理
	@RequestMapping(value = "/event_info")
	public String event_info() {
		return "ajax/event_info";
	}

	// 活动管理-新增活动
	@RequestMapping(value = "/event_add")
	public String event_add() {
		return "ajax/event_add";
	}

	// 活动管理-编辑活动
	@RequestMapping(value = "/event_edit")
	public String event_edit() {
		return "ajax/event_edit";
	}

	// 优惠券管理
	@RequestMapping(value = "/coupon_info")
	public String coupon_info() {
		return "ajax/coupon_info";
	}

	// 优惠券管理-新增优惠券
	@RequestMapping(value = "/coupon_add")
	public String coupon_add() {
		return "ajax/coupon_add";
	}

	// 优惠券管理-编辑优惠券
	@RequestMapping(value = "/coupon_edit")
	public String coupon_edit() {
		return "ajax/coupon_edit";
	}

	// 优惠券管理-查看优惠码
	@RequestMapping(value = "/couponcode_info")
	public String couponcode_info() {
		return "ajax/couponcode_info";
	}

	// CEO留言管理
	@RequestMapping(value = "/message_info")
	public String message_info() {
		return "ajax/message_info";
	}

	// 数据管理
	@RequestMapping(value = "/data_info")
	public String data_info() {
		return "ajax/data_info";
	}

	// 版本管理
	@RequestMapping(value = "/edition_info")
	public String edition_info() {
		return "ajax/edition_info";
	}

	// 版本管理-新增版本
	@RequestMapping(value = "/edition_add")
	public String edition_add() {
		return "ajax/edition_add";
	}

	// 版本管理-编辑版本
	@RequestMapping(value = "/edition_edit")
	public String edition_edit() {
		return "ajax/edition_edit";
	}



}
