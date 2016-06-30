/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupcase.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtgroupcase.entity.HmrtGroupCase;
import com.thinkgem.jeesite.modules.hmrtgroupcase.dao.HmrtGroupCaseDao;

/**
 * 群聊对应病例Service
 * @author zhuhb
 * @version 2016-06-30
 */
@Service
@Transactional(readOnly = true)
public class HmrtGroupCaseService extends CrudService<HmrtGroupCaseDao, HmrtGroupCase> {

	public HmrtGroupCase get(String id) {
		return super.get(id);
	}
	
	public List<HmrtGroupCase> findList(HmrtGroupCase hmrtGroupCase) {
		return super.findList(hmrtGroupCase);
	}
	
	public Page<HmrtGroupCase> findPage(Page<HmrtGroupCase> page, HmrtGroupCase hmrtGroupCase) {
		return super.findPage(page, hmrtGroupCase);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtGroupCase hmrtGroupCase) {
		super.save(hmrtGroupCase);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtGroupCase hmrtGroupCase) {
		super.delete(hmrtGroupCase);
	}
	
}