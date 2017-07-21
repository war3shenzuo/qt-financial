package com.qtjf.appserver.server;

import java.util.List;


import com.qtjf.common.bean.QtFinanicalBanner;

public interface BannerServer {
	
	/**
	 * 获取所有banner
	 * @return
	 */
	public List<QtFinanicalBanner> getBanner();

}
