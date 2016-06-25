/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorelog.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtscorelog.entity.HmrtScoreLog;

/**
 * 积分日志DAO接口
 * @author 赵九扬
 * @version 2016-06-25
 */
@MyBatisDao
public interface HmrtScoreLogDao extends CrudDao<HmrtScoreLog> {
	
}