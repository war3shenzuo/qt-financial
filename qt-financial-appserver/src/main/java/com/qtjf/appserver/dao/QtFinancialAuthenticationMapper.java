package com.qtjf.appserver.dao;

import java.util.List;
import java.util.Map;

import com.qtjf.common.bean.QtFinancialAuthentication;

public interface QtFinancialAuthenticationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialAuthentication record);

    QtFinancialAuthentication selectByPrimaryKey(Integer id);

    List<QtFinancialAuthentication> selectAll();

    int updateByPrimaryKey(QtFinancialAuthentication record);
    
    /**
     * 保存淘宝二维码
     * @param string
     * @param userId
     */
	void saveTaobaoQrMsg(Map<String, Object> map);
	/**
	 * 删除二维码
	 * @param userId
	 */
	void deleteTaobaoQrMsgByUserId(String userId);
	
	/**
	 * 根据用户ID获取QR信息
	 * @param userId
	 * @return
	 */
	Map<String, Object> getQRMsg(String userId);
}