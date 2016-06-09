/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtlike.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtlike.entity.HmrtLike;

/**
 * 活动点赞DAO接口
 * @author 赵九扬
 * @version 2016-06-09
 */
@MyBatisDao
public interface HmrtLikeDao extends CrudDao<HmrtLike> {

	public void deleteConditon(HmrtLike hmrtLike);
	
}