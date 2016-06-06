/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttags.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrttags.entity.HmrtTags;

/**
 * 病例标签DAO接口
 * @author 赵九扬
 * @version 2016-06-06
 */
@MyBatisDao
public interface HmrtTagsDao extends CrudDao<HmrtTags> {
	
}