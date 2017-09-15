package com.qtjf.appserver.controller;

import com.qtjf.appserver.server.CouponServer;
import com.qtjf.appserver.server.ProductServer;
import com.qtjf.appserver.server.UserService;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialUser;
import com.qtjf.common.bean.QtFinancialUserCoupon;
import com.qtjf.common.vo.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * 优惠券Controller类
 *
 * @author 史贤杰 2017/07/01
 */
@RestController
@RequestMapping("/Coupons")
public class CouponController {

    @Autowired
    CouponServer couponServer;

    @Autowired
    UserService userService;

    @Autowired
    ProductServer productServer;

    /**
     * 获取优惠券
     *
     * @param usermobile
     * @return
     * @throws Exception
     */
    @RequestMapping("getCoupons")
    public ResultCode getCoupons(@NotNull String usermobile) throws Exception {

        QtFinancialUser user = userService.getUserInfoByMobile(usermobile);

        if (user == null) {
            return ResultCode.getFail("找不到用户");
        }

        QtFinancialUserCoupon uc = new QtFinancialUserCoupon();
        uc.setUserId(user.getId());
        uc.setStatus("未使用");

        List<Map<String, Object>> list = couponServer.getCoupons(uc);

        return ResultCode.getSuccess("获取用户优惠券", list);
    }


    /**
     * 获取优惠券
     *
     * @param usermobile
     * @return
     * @throws Exception
     */
    @RequestMapping("getProductCoupons")
    public ResultCode getProductCoupons(@NotNull String usermobile, String productId) throws Exception {

        QtFinancialUser user = userService.getUserInfoByMobile(usermobile);

        if (user == null) {
            return ResultCode.getFail("找不到用户");
        }

        QtFinacialProduct product = productServer.getProduct(productId);
        if (product == null) {
            return ResultCode.getFail("找不到此产品");
        }

        QtFinancialUserCoupon uc = new QtFinancialUserCoupon();
        uc.setUserId(user.getId());
        uc.setStatus("未使用");
        uc.setLimitUserLevel(user.getUserlevel());
        uc.setLimitAmount(product.getAmount());
        List<Map<String, Object>> list = couponServer.getCoupons(uc);

        return ResultCode.getSuccess("获取用户优惠券", list);
    }


}
