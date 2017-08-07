package com.qtjf.appserver.server;

import com.qtjf.common.bean.QtFinacialAuthenticationBase;
import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;
import com.qtjf.common.bean.QtFinacialAuthenticationProfession;
import com.qtjf.common.bean.QtFinancialAuthentication;

public interface AuthenticationServer {

	void saveTaobaoQrMsg(String string, String userId);

	void saveTaobaoInfo(String token, String userId);

	String getTaobaoQRMsg(String userId);

    void insert(QtFinancialAuthentication record) throws Exception;

	void saveBankInfo(String bankCardNo, String name, String identityNo, String mobile, String userId) throws Exception;

	void saveMobile(String userId, String mobile, String password)  throws Exception;
	
	/**
	 * 上传用户基本信息
	 * @param userBase
	 * @return
	 * @throws Exception
	 */
	void submitUserBase(QtFinacialAuthenticationBase userBase, String userId) throws Exception;
	/**
	 * 上传用户单位信息
	 * @param userBase
	 */
	void submitProfession(QtFinacialAuthenticationProfession profeesion, String userId) throws Exception;
	
	/**
	 * 上传紧急联系人
	 * @param emergencyContact
	 * @param userId
	 * @throws Exception
	 */
	void submitEmergencyContract(QtFinacialAuthenticationEmergencyContact emergencyContact, String userId)throws Exception;



}
