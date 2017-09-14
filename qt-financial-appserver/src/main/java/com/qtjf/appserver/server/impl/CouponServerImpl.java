package com.qtjf.appserver.server.impl;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinancialUserCouponMapper;
import com.qtjf.appserver.server.CouponServer;
import com.qtjf.common.bean.QtFinancialUserCoupon;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CouponServerImpl implements CouponServer {

	@Autowired
	QtFinancialUserCouponMapper qtFinancialUserCouponMapper;


    @Override
    public List<Map<String, Object>> getCoupons(QtFinancialUserCoupon userCoupon) {
        return qtFinancialUserCouponMapper.selectAllAndCouponInfo(userCoupon);
    }
}
