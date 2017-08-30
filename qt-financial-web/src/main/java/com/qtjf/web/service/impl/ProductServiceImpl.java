package com.qtjf.web.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialProductUserLevel;
import com.qtjf.common.bean.QtFinanicalBanner;
import com.qtjf.web.entity.QtFinancialProductInstalment;
import com.qtjf.web.entity.QtFinancialProductInstalmentPostpone;
import com.qtjf.web.mapper.QtFinacialProductMapper;
import com.qtjf.web.mapper.QtFinancialProductInstalmentMapper;
import com.qtjf.web.mapper.QtFinancialProductInstalmentPostponeMapper;
import com.qtjf.web.mapper.QtFinancialProductUserLevelMapper;
import com.qtjf.web.mapper.QtFinanicalBannerMapper;
import com.qtjf.web.service.ProductService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.util.ThreadUtil;
import com.qtjf.web.vo.QtFinacialProductVo;
import com.qtjf.web.vo.Test2Vo;
import com.qtjf.web.vo.TestVo;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private QtFinanicalBannerMapper qtFinanicalBannerMapper;

	@Autowired
	private QtFinacialProductMapper qtFinacialProductMapper;
	
	@Autowired
	private QtFinancialProductUserLevelMapper qtFinancialProductUserLevelMapper;

	@Autowired
	private QtFinancialProductInstalmentMapper qtFinancialProductInstalmentMapper;
	
	@Autowired
	private QtFinancialProductInstalmentPostponeMapper qtFinancialProductInstalmentPostponeMapper;
	
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
	public Map<String, Object> addProduct(QtFinacialProductVo qp ,String[] peoplegrade, String[] borrowgrade) {
		String id = UUID.randomUUID().toString();
		qp.setId(id);
		qtFinacialProductMapper.insert(qp);
		
		ThreadUtil.execute(new Runnable() {
			
			@Override
			public void run() {
				//  插入可借、可见记录
				for(String people:peoplegrade){
					QtFinancialProductUserLevel qpul = new QtFinancialProductUserLevel();
					qpul.setProductId(id);
					qpul.setUserLevelId(Integer.parseInt(people));
					qpul.setType(1);//可见
					qtFinancialProductUserLevelMapper.insert(qpul);
				}
				
				for(String people:borrowgrade){
					QtFinancialProductUserLevel qpul = new QtFinancialProductUserLevel();
					qpul.setProductId(id);//可借
					qpul.setUserLevelId(Integer.parseInt(people));
					qpul.setType(2);
					qtFinancialProductUserLevelMapper.insert(qpul);
				}
			}
		});

		
		// TODO 插入还款计划、延期计划
		ThreadUtil.execute(new Runnable() {
			
			@Override
			public void run() {
				TestVo[] plan = qp.getTest();
				for(TestVo p : plan){
					Test2Vo[] delay = p.getDelay();
					QtFinancialProductInstalment qpa = new QtFinancialProductInstalment();
					String qpaId = UUID.randomUUID().toString();
					qpa.setId(qpaId);
					qpa.setProductid(id);
					qpa.setDaynum(Integer.parseInt(p.getDay()));
					qpa.setAmount(new BigDecimal(p.getAmount()));
					qtFinancialProductInstalmentMapper.insert(qpa);
					for(Test2Vo d : delay){
						QtFinancialProductInstalmentPostpone qpi = new QtFinancialProductInstalmentPostpone();
						qpi.setId(UUID.randomUUID().toString());
						qpi.setInstalmentid(qpaId);
						qpi.setProductid(id);
						qpi.setAmount(new BigDecimal(d.getAmount()));
						qpi.setDaynum(d.getDay());
						qtFinancialProductInstalmentPostponeMapper.insert(qpi);
					}
					
				}
			}
		});
		
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

	@Override
	public Map<String, Object> getProductUserLevel(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialProductUserLevel> list = qtFinancialProductUserLevelMapper.selectByProductId(id);
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
