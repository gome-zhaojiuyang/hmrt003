/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtarticletags.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtarticletags.entity.HmrtArticleTags;

/**
 * 病历标签关系DAO接口
 * @author 赵九扬
 * @version 2016-06-06
 */
@MyBatisDao
public interface HmrtArticleTagsDao extends CrudDao<HmrtArticleTags> {
	/**
	 * 删除数据  根据病例ID 删除病例标签
	 * @param entity
	 * @return
	 */
	public int deleteByArticleId(String articleid);
}