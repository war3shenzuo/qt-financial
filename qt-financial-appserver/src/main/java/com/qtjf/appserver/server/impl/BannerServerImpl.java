package com.qtjf.appserver.server.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.qtjf.appserver.dao.QtFinanicalBannerMapper;
import com.qtjf.appserver.server.BannerServer;
import com.qtjf.common.bean.QtFinanicalBanner;

@Service
public class BannerServerImpl implements BannerServer {
	
	@Autowired
	QtFinanicalBannerMapper bannerDao;
	
	@Value(value = "picHost")
	private String picHost;
	
	@Override
	public List<QtFinanicalBanner> getBanner() {
		
		List<QtFinanicalBanner> list = bannerDao.selectAll();
		for(QtFinanicalBanner b :list){
			b.setPic(picHost+b.getPic());
		}
		return list;
	}

}
