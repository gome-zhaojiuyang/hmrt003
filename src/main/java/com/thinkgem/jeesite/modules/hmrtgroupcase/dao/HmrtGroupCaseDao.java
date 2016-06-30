/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupcase.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtgroupcase.entity.HmrtGroupCase;

/**
 * 群聊对应病例DAO接口
 * @author zhuhb
 * @version 2016-06-30
 */
@MyBatisDao
public interface HmrtGroupCaseDao extends CrudDao<HmrtGroupCase> {
	
}