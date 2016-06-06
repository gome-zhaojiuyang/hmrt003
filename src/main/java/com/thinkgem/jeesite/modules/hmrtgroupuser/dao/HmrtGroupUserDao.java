/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupuser.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtgroupuser.entity.HmrtGroupUser;

/**
 * 分组用户DAO接口
 * @author 赵九扬
 * @version 2016-06-06
 */
@MyBatisDao
public interface HmrtGroupUserDao extends CrudDao<HmrtGroupUser> {
	
}