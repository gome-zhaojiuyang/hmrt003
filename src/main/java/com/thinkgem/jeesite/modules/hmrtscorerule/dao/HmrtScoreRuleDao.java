/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorerule.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtscorerule.entity.HmrtScoreRule;

/**
 * 积分规则自动生成DAO接口
 * @author 赵九扬
 * @version 2016-06-25
 */
@MyBatisDao
public interface HmrtScoreRuleDao extends CrudDao<HmrtScoreRule> {
	
}