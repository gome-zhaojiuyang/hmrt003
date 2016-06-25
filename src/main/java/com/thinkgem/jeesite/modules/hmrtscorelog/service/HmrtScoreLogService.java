/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorelog.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtscorelog.entity.HmrtScoreLog;
import com.thinkgem.jeesite.modules.hmrtscorelog.dao.HmrtScoreLogDao;

/**
 * 积分日志Service
 * @author 赵九扬
 * @version 2016-06-25
 */
@Service
@Transactional(readOnly = true)
public class HmrtScoreLogService extends CrudService<HmrtScoreLogDao, HmrtScoreLog> {

	public HmrtScoreLog get(String id) {
		return super.get(id);
	}
	
	public List<HmrtScoreLog> findList(HmrtScoreLog hmrtScoreLog) {
		return super.findList(hmrtScoreLog);
	}
	
	public Page<HmrtScoreLog> findPage(Page<HmrtScoreLog> page, HmrtScoreLog hmrtScoreLog) {
		return super.findPage(page, hmrtScoreLog);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtScoreLog hmrtScoreLog) {
		super.save(hmrtScoreLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtScoreLog hmrtScoreLog) {
		super.delete(hmrtScoreLog);
	}
	
}