package com.qtjf.common.emus;

public enum borrowStatus {
	
	/** 借款状态 */
	//提交申请
	BORROW_APPLY("1r","请等待客服人员进行审核"),
	//审核员审核情况
	BORROW_CHECK("2r","审核员审核情况"),
	//审核经理审核情况
	BORROW_CHECK_M("3r","审核经理审核情况"),
	//打款情况
	BORROW_PAY("4r","打款情况"),
	//用户取消
	BORROW_CANCEL("1e","用户已取消申请"),
	//审核员审核未通过
	BORROW_NOCHECK("2e","审核员审核未通过"),
	//审核经理审核未通过
	BORROW_NOCHECK_M("3e","审核经理审核未通过"),
	//打款未通过
	BORROW_NOPAY("4e","打款未通过"),
	//还款成功
	BORROW_FINISH("5e","还款成功"),
	
	/** 分期计划状态*/
	INSTALMENT_RUN("1r","进行中"),
	INSTALMENT_EXP("2r","到期提醒"),
	INSTALMENT_REPAY("3r","还款期限"),
	INSTALMENT_OVERDUE("4r","逾期提醒"),
	INSTALMENT_POSTPONE("5r","延期成功"),
	//提前还款
	INSTALMENT_AHEAD("1e","你已经还款%s元,还款时间%date"),
	INSTALMENT_CLOSE("2e","正常还款成功");
	
	
	
	/** 返回状态码*/
	private String status ;
	
	/** 返回消息*/
	private String msg ;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	private borrowStatus(String status,String msg){
		this.status = status ;
		this.msg = msg ;
	}
	
	
}
