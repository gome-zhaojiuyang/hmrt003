/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtarticletags.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.hmrtarticletags.entity.HmrtArticleTags;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.hmrtarticletags.dao.HmrtArticleTagsDao;

/**
 * 病历标签关系Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtArticleTagsService extends CrudService<HmrtArticleTagsDao, HmrtArticleTags> {

	public HmrtArticleTags get(String id) {
		return super.get(id);
	}
	
	public List<HmrtArticleTags> findList(HmrtArticleTags hmrtArticleTags) {
		return super.findList(hmrtArticleTags);
	}
	
	public Page<HmrtArticleTags> findPage(Page<HmrtArticleTags> page, HmrtArticleTags hmrtArticleTags) {
		return super.findPage(page, hmrtArticleTags);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtArticleTags hmrtArticleTags) {
		if (StringUtils.isBlank(hmrtArticleTags.getId())){
			hmrtArticleTags.preInsert();
			dao.insert(hmrtArticleTags);
		}else{
			hmrtArticleTags.preUpdate();
			dao.update(hmrtArticleTags);
		}
//		super.save(hmrtArticleTags);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtArticleTags hmrtArticleTags) {
		super.delete(hmrtArticleTags);
	}
	@Transactional(readOnly = false)
	public void deleteByArticleId(String articleid) {
		dao.deleteByArticleId(articleid);
	}
	
}