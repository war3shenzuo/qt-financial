package com.qtjf.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialActivity;
import com.qtjf.common.bean.QtFinancialCoupon;
import com.qtjf.common.bean.QtFinancialCouponChild;
import com.qtjf.common.bean.QtFinancialInvite;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.web.mapper.QtFinancialActivityMapper;
import com.qtjf.web.mapper.QtFinancialCouponChildMapper;
import com.qtjf.web.mapper.QtFinancialCouponMapper;
import com.qtjf.web.mapper.QtFinancialInviteMapper;
import com.qtjf.web.service.ActivityService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.util.ThreadUtil;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private QtFinancialActivityMapper qtFinancialActivityMapper;

	@Autowired
	private QtFinancialInviteMapper qtFinancialInviteMapper;

	@Autowired
	private QtFinancialCouponMapper qtFinancialCouponMapper;

	@Autowired
	private QtFinancialCouponChildMapper qtFinancialCouponChildMapper;

	@Override
	public Map<String, Object> getActivities() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialActivity> list = qtFinancialActivityMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getActivity(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialActivity obj = qtFinancialActivityMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveActivity(QtFinancialActivity qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editActivity(QtFinancialActivity qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.updateByPrimaryKey(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteActivity(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialActivityMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getInvites() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialInvite> list = qtFinancialInviteMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getInvite(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialInvite obj = qtFinancialInviteMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveInvite(QtFinancialInvite qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialInviteMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editInvite(QtFinancialInvite qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialInviteMapper.updateByPrimaryKey(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteInvite(Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialInviteMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getCoupons() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialCoupon> list = qtFinancialCouponMapper.selectAll();
			map.put(StringUtil.responseObjList, list);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> getCoupon(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			QtFinancialCoupon obj = qtFinancialCouponMapper.selectByPrimaryKey(id);
			map.put(StringUtil.responseObj, obj);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> saveCoupon(QtFinancialCoupon qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String couponId = UUID.randomUUID().toString();
			qg.setId(couponId);
			qtFinancialCouponMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
			ThreadUtil.execute(new Runnable() {
				@Override
				public void run() {
					String code = qg.getCode();
					Long limit = qg.getLimitAmount();// 码体数量
					List<QtFinancialCouponChild> list = new ArrayList<QtFinancialCouponChild>();
					Set set = new HashSet();
					while (set.size() < limit) {
						set.add(StringUtil.getStringRandom(7));
					}
					Iterator<String> it = set.iterator();  
					while (it.hasNext()) { 
						String str = it.next(); 
						QtFinancialCouponChild qtcc = new QtFinancialCouponChild();
						qtcc.setCode(code+str);
						qtcc.setCouponId(couponId);
						qtcc.setState("未领取");//
						qtcc.setUserState("未使用");
						list.add(qtcc);
					} 
					qtFinancialCouponChildMapper.addBatch(list);
					
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> editCoupon(QtFinancialCoupon qg) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialCouponMapper.updateByPrimaryKey(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteCoupon(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			qtFinancialCouponMapper.deleteByPrimaryKey(id);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}
	
	@Override
	public Map<String, Object> selectCouponCodeAll(Map<String, Object> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<QtFinancialCouponChild> list = qtFinancialCouponChildMapper.selectAllByPage(paramMap);
			int count = qtFinancialCouponChildMapper.selectAllByPageCount(paramMap);
			map.put(StringUtil.pageData, list);
			map.put(StringUtil.pageCount, count);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
		} catch (Exception e) {
			e.printStackTrace();
			map.put(StringUtil.responseCode, StringUtil.resposeError);
		}
		return map;
	}

}
