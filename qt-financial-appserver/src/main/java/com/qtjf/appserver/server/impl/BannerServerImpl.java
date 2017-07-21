package com.qtjf.appserver.server.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinanicalBannerMapper;
import com.qtjf.appserver.server.BannerServer;
import com.qtjf.common.bean.QtFinanicalBanner;

@Service
public class BannerServerImpl implements BannerServer {
	
	@Autowired
	QtFinanicalBannerMapper bannerDao;
	
	@Override
	public List<QtFinanicalBanner> getBanner() {
		return bannerDao.selectAll();
	}

}
