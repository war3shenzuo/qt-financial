package com.qtjf.appserver.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.BorrowMoneyServer;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialProductInstalmentPostpone;
import com.qtjf.common.emus.SysStatus;
import com.qtjf.common.vo.ResultCode;

/**
 * 消费产品Controller类
 * 
 * @author 史贤杰 2017/07/01
 */
@RestController
@RequestMapping("/borrowmoney")
public class BorrowMoneyController {

	@Autowired
	BorrowMoneyServer borrowMoneytserver;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 获取用户所有订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "getBorrowMoneys")
	public ResultCode getBorrowMoneys(String userId) {
		ResultCode result = null;
		try {
			List<QtFinancialBorrowMoney> list = borrowMoneytserver.getBorrowMoneys(userId);
			result = ResultCode.getSuccess("获取用户订单成功", list);
		} catch (Exception e) {
			logger.error("获取用户订单失败", e);
			result = ResultCode.getSuccess("获取用户订单失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取借款订单详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "getBorrowMoneysInfo")
	public ResultCode getBorrowMoneysInfo(String id) {
		ResultCode result = null;
		try {
			QtFinancialBorrowMoney bm = borrowMoneytserver.getBorrowMoneysInfo(id);
			result = ResultCode.getSuccess("获取借款订单详情成功", bm);
		} catch (Exception e) {
			logger.error("获取借款订单详情失败", e);
			result = ResultCode.getSuccess("获取借款订单详情失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 新增借款流程
	 * 
	 * @param bm
	 *            借款详情
	 * @return
	 */
	@RequestMapping(value = "/insetBorrowMoney")
	public ResultCode insetBorrowMoney(QtFinancialBorrowMoney bm) {
		ResultCode result = null;
		try {
			borrowMoneytserver.add(bm);
			result = ResultCode.getSuccess("产品购买成功");
		} catch (Exception e) {
			logger.error("产品购买失败", e);
			result = ResultCode.getFail("产品购买失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 取消订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "cancelBorrowMoney")
	public ResultCode cancelBorrowMoney(String id) {
		ResultCode result = null;
		try {
			borrowMoneytserver.cancelBorrowMoney(id);
			result = ResultCode.getSuccess("取消成功");
		} catch (Exception e) {
			logger.error("取消失败", e);
			result = ResultCode.getFail("取消失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 提前还款
	 * 
	 * @param id 借款流程Id
	 * @param instalmentId  计划id
	 * @param amount 金额
	 * @return
	 */
	@RequestMapping(value = "immediatelyBorrowMoney")
	public ResultCode immediatelyBorrowMoney(String id, String instalmentId, String amount) {
		ResultCode result = null;

		try {
			borrowMoneytserver.immediatelyBorrowMoney(id, instalmentId, amount);
			result = ResultCode.getSuccess("提前还款成功");
		} catch (Exception e) {
			logger.error("提前还款失败", e);
			result = ResultCode.getFail("提前还款失败");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 获取下一期延期信息
	 * 
	 * @param instalmentId
	 *            计划id
	 * @return
	 */
	@RequestMapping(value = "getApplyPostponeInfo")
	public ResultCode getApplyPostponeInfo(String instalmentId) {
		ResultCode result = null;

		try {
			QtFinancialProductInstalmentPostpone postpones = borrowMoneytserver.getApplyPostponeInfo(instalmentId);

			if (postpones != null) {
				result = ResultCode.getSuccess("获取下一期延期信息成功", postpones);
			} else {
				logger.error("延期期数已申请完");
				result = new ResultCode(SysStatus.NO_DATA.getStatus(), "找到不下一期延期数据");
			}
		} catch (Exception e) {
			logger.error("获取下一期延期信息失败", e);
			result = ResultCode.getFail("获取下一期延期信息败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 延期申请
	 * 
	 * @return
	 */
	@RequestMapping(value = "applePostpone")
	public ResultCode applePostpone(QtFinancialProductInstalmentPostpone postpone,String borrowmoneyId) {
		ResultCode result = null;

		try {
			borrowMoneytserver.applePostpone(postpone, borrowmoneyId);
			result = ResultCode.getSuccess("延期申请成功");
		} catch (Exception e) {
			logger.error("延期申请失败", e);
			result = ResultCode.getFail("延期申请失败");
			e.printStackTrace();
		}
		return result;
	}

}
