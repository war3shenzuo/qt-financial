package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.web.mapper.QtFinanicalBannerMapper;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.bean.QtFinanicalBanner;
import com.qtjf.web.mapper.QtFinacialProductMapper;
import com.qtjf.web.service.ProductService;
import com.qtjf.web.util.StringUtil;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private QtFinanicalBannerMapper qtFinanicalBannerMapper;

	@Autowired
	private QtFinacialProductMapper qtFinacialProductMapper;

	@Override
	public Map<String, Object> selectAllByPage(Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinacialProduct> list = qtFinacialProductMapper.selectAllByPage(paramMap);
			int count = qtFinacialProductMapper.selectAllByPageCount(paramMap);
			map.put(StringUtil.pageData, list);
			map.put(StringUtil.pageCount, count);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> addProduct(QtFinacialProduct qp) {
		qtFinacialProductMapper.insert(qp);
		return null;
	}

	@Override
	public Map<String, Object> getBanner() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinanicalBanner> list = qtFinanicalBannerMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> addBanner(QtFinanicalBanner qb) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalBannerMapper.insert(qb);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editBanner(QtFinanicalBanner qb) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalBannerMapper.updateByPrimaryKey(qb);
			map.put(StringUtil.responseCode, StringUtil.responseOk); 
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteBanner(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinanicalBannerMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editProduct(QtFinacialProduct qp) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinacialProductMapper.updateByPrimaryKey(qp);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override 
	public Map<String, Object> deleteProduct(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinacialProductMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getProduct(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinacialProduct obj = qtFinacialProductMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
