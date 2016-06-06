/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtgroupuser.entity.HmrtGroupUser;
import com.thinkgem.jeesite.modules.hmrtgroupuser.dao.HmrtGroupUserDao;

/**
 * 分组用户Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtGroupUserService extends CrudService<HmrtGroupUserDao, HmrtGroupUser> {

	public HmrtGroupUser get(String id) {
		return super.get(id);
	}
	
	public List<HmrtGroupUser> findList(HmrtGroupUser hmrtGroupUser) {
		return super.findList(hmrtGroupUser);
	}
	
	public Page<HmrtGroupUser> findPage(Page<HmrtGroupUser> page, HmrtGroupUser hmrtGroupUser) {
		return super.findPage(page, hmrtGroupUser);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtGroupUser hmrtGroupUser) {
		super.save(hmrtGroupUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtGroupUser hmrtGroupUser) {
		super.delete(hmrtGroupUser);
	}
	
}