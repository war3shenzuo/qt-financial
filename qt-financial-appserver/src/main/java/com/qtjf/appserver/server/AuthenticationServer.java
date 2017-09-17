package com.qtjf.appserver.server;

import java.util.List;

import com.qtjf.common.bean.QtFinacialAuthenticationBase;
import com.qtjf.common.bean.QtFinacialAuthenticationEmergencyContact;
import com.qtjf.common.bean.QtFinacialAuthenticationProfession;
import com.qtjf.common.bean.QtFinancialAuthentication;

public interface AuthenticationServer {

	void saveTaobaoQrMsg(String string, String userId);

	void saveTaobaoInfo(String token, String userId);

	String getTaobaoQRMsg(String userId);

    void insert(QtFinancialAuthentication record) throws Exception;


	void saveMobile(String userId)  throws Exception;
	
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
	/**
	 * 查询用户认证信息
	 * @param userId
	 * @return
	 */
	List<QtFinancialAuthentication> getAuthenticationList(String userId);
	
	/**
	 * 根据类型查询认证详细信息
	 * @param userId
	 * @return
	 */
	Object getAuthenticationInfoType(String id,String type);
	
	/**
	 * 学信认证
	 * @param chsiCode
	 * @param chsiPass
	 * @param userId
	 * @return
	 * @throws Exception 
	 */
	boolean sumbitChsi(String chsiCode, String chsiPass, String userId) throws Exception;
	
	/**
	 * 京东认证
	 * @param jdCode
	 * @param jdPass
	 * @param userId
	 * @return
	 * @throws Exception 
	 */
	boolean sumbitJd(String jdCode, String jdPass, String userId) throws Exception;

	void saveBankInfo(String bankName, String region, String bankCardNo, String mobile, String userMobile)throws Exception;
	


}
