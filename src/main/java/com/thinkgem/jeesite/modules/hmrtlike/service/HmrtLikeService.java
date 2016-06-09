/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtlike.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtlike.entity.HmrtLike;
import com.thinkgem.jeesite.modules.hmrtlike.dao.HmrtLikeDao;

/**
 * 活动点赞Service
 * @author 赵九扬
 * @version 2016-06-09
 */
@Service
@Transactional(readOnly = true)
public class HmrtLikeService extends CrudService<HmrtLikeDao, HmrtLike> {

	public HmrtLike get(String id) {
		return super.get(id);
	}
	
	public List<HmrtLike> findList(HmrtLike hmrtLike) {
		return super.findList(hmrtLike);
	}
	
	public Page<HmrtLike> findPage(Page<HmrtLike> page, HmrtLike hmrtLike) {
		return super.findPage(page, hmrtLike);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtLike hmrtLike) {
		super.save(hmrtLike);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtLike hmrtLike) {
		super.delete(hmrtLike);
	}
	@Transactional(readOnly = false)
	public void deleteConditon(HmrtLike hmrtLike) {
		dao.deleteConditon(hmrtLike);
	}
	
}