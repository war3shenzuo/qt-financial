package com.qtjf.web;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="data")
public class DataCol {
	
	/**
	 * 分页获取审核数据，类型分审核中和审核完毕的
	 * 
	 * @param type 审核中、审核完毕
	 * @param start 分页起始
	 * @param end 分页结束
	 * @return
	 */
	@RequestMapping(value = "/all")
	public Map<String,Object> all(String type,Integer start,Integer end) {
		return null;
	}
	
	/**
	 * 是否同意借款
	 * 
	 * @param id
	 * @param type 是否同意
	 * @return
	 */
	@RequestMapping(value = "/borrow/agree")
	public Map<String,Object> borrowAgree(Integer id,String type) {
		return null;
	}
	
	/**
	 * 根据用户id，查找用户借款记录
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/borrow/total")
	public Map<String,Object> borrowTotal(Integer userId) {
		return null;
	}
	
	/**
	 * 查看借款详情
	 * 
	 * @param id 订单id
	 * @return
	 */
	@RequestMapping(value = "/borrow/info")
	public Map<String,Object> borrowInfo(Integer id) {
		return null;
	}
	
	/**
	 * 根据用户的id来获取用户基本信息
	 * 
	 * @param userId 用户id
	 * @return
	 */
	@RequestMapping(value = "/base")
	public Map<String,Object> base(Integer userId) {
		return null;
	}
	
	/**
	 * 根据用户id和认证类型获取认证状态
	 * 
	 * @param userId 用户id
	 * @param type 认证类型
	 * @return
	 */
	@RequestMapping(value = "/auth/state")
	public Map<String,Object> authState(Integer userId,String type) {
		return null;
	}
	
	/**
	 * 根据id和类型获取认证的内容
	 * 
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/auth/info")
	public Map<String,Object> authInfo(Integer id,String type) {
		return null;
	}
	
	
}
