package com.qtjf.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.emus.borrowStatus;
import com.qtjf.web.service.BorrowService;
import com.qtjf.web.service.ProductService;
import com.qtjf.web.util.StringUtil;

@RestController
@RequestMapping(value="data")
public class DataCol {
	
	@Autowired
	private BorrowService borrowService;
	
	@Autowired
	private ProductService productService;
	
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
		QtFinancialBorrowMoney qm = new QtFinancialBorrowMoney();
		qm.setStatus(borrowStatus.BORROW_APPLY.getStatus());
		return borrowService.getBorrows(qm);
	}
	
	/**
	 * 是否同意借款
	 * 
	 * @param id
	 * @param type 是否同意 borrowStatus.NOCHECK表示不同意，CHECK表示同意
	 * @return
	 */
	@RequestMapping(value = "/borrow/agree")
	public Map<String,Object> borrowAgree(String id,String type) {
		QtFinancialBorrowMoney qm = new QtFinancialBorrowMoney();
		qm.setId(id);
		qm.setStatus(type);
		return borrowService.updateBorrows(qm);
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
	
	/**
	 * 分页查看产品列表
	 * 
	 * @param aoData
	 * @return
	 */
	@RequestMapping(value = "/product/all")
	public String sign_info(String aoData) {
        JSONArray jsonarray = JSONArray.parseArray(aoData);
        String sEcho = null;// 对比数据
        int iDisplayStart = 0; // 起始索引
        int iDisplayLength = 0; // 每页显示的行数
        String search = "";
        for (int i = 0; i < jsonarray.size(); i++) {
            JSONObject obj = (JSONObject) jsonarray.get(i);
            if (obj.get("name").equals("sEcho"))
                sEcho = obj.get("value").toString();

            if (obj.get("name").equals("iDisplayStart"))
                iDisplayStart = obj.getIntValue("value");

            if (obj.get("name").equals("iDisplayLength"))
                iDisplayLength = obj.getIntValue("value");

            if (obj.get("name").equals("sSearch"))
                search = obj.get("value").toString();
        }
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", search);
        paramMap.put("start", iDisplayStart);
        paramMap.put("end", iDisplayLength);
        Map<String, Object> map = productService
                .selectAllByPage(paramMap);
        JSONObject getObj = new JSONObject();
        getObj.put("sEcho", sEcho);// 防止数据请求串线
        getObj.put("iTotalRecords", map.get(StringUtil.pageCount));// 实际的行数
        getObj.put("iTotalDisplayRecords", map.get(StringUtil.pageCount));//
        getObj.put("aaData", map.get(StringUtil.pageData));// 要以JSON格式返回
        return getObj.toString();
    }
	
	@RequestMapping(value = "/product/add")
	public String product_add(QtFinacialProduct qp, Model model) {
		 qp.setId(UUID.randomUUID().toString());
		 productService.addProduct(qp);
		 return null;
	}
	
}
