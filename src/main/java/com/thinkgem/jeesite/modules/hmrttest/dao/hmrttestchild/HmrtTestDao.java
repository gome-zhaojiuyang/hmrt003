/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttest.dao.hmrttestchild;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrttest.entity.hmrttestchild.HmrtTest;

/**
 * 测试生成功能描述DAO接口
 * @author 赵九扬
 * @version 2016-05-22
 */
@MyBatisDao
public interface HmrtTestDao extends CrudDao<HmrtTest> {
	
}