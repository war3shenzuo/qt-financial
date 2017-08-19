package com.qtjf.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.common.bean.QtFinancialActivity;
import com.qtjf.common.bean.QtFinancialCoupon;
import com.qtjf.common.bean.QtFinancialInvite;
import com.qtjf.web.mapper.QtFinancialActivityMapper;
import com.qtjf.web.mapper.QtFinancialCouponMapper;
import com.qtjf.web.mapper.QtFinancialInviteMapper;
import com.qtjf.web.service.ActivityService;
import com.qtjf.web.util.StringUtil;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private QtFinancialActivityMapper qtFinancialActivityMapper;

	@Autowired
	private QtFinancialInviteMapper qtFinancialInviteMapper;
	
	@Autowired
	private QtFinancialCouponMapper qtFinancialCouponMapper;
	
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
			qtFinancialCouponMapper.insert(qg);
			map.put(StringUtil.responseCode, StringUtil.responseOk);
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

}
