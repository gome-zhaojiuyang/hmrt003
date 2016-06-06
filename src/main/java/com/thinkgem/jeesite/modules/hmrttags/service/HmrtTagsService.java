/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttags.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrttags.entity.HmrtTags;
import com.thinkgem.jeesite.modules.hmrttags.dao.HmrtTagsDao;

/**
 * 病例标签Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtTagsService extends CrudService<HmrtTagsDao, HmrtTags> {

	public HmrtTags get(String id) {
		return super.get(id);
	}
	
	public List<HmrtTags> findList(HmrtTags hmrtTags) {
		return super.findList(hmrtTags);
	}
	
	public Page<HmrtTags> findPage(Page<HmrtTags> page, HmrtTags hmrtTags) {
		return super.findPage(page, hmrtTags);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtTags hmrtTags) {
		super.save(hmrtTags);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtTags hmrtTags) {
		super.delete(hmrtTags);
	}
	
}