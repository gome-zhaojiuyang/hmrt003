/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroup.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtgroup.entity.HmrtGroup;
import com.thinkgem.jeesite.modules.hmrtgroup.dao.HmrtGroupDao;

/**
 * 聊天分组Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtGroupService extends CrudService<HmrtGroupDao, HmrtGroup> {

	public HmrtGroup get(String id) {
		return super.get(id);
	}
	
	public List<HmrtGroup> findList(HmrtGroup hmrtGroup) {
		return super.findList(hmrtGroup);
	}
	
	public Page<HmrtGroup> findPage(Page<HmrtGroup> page, HmrtGroup hmrtGroup) {
		return super.findPage(page, hmrtGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtGroup hmrtGroup) {
		super.save(hmrtGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtGroup hmrtGroup) {
		super.delete(hmrtGroup);
	}
	
}