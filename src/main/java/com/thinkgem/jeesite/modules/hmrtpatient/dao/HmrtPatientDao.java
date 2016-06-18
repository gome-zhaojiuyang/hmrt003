/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtpatient.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtpatient.entity.HmrtPatient;

/**
 * 患者信息维护DAO接口
 * @author 赵九扬
 * @version 2016-06-18
 */
@MyBatisDao
public interface HmrtPatientDao extends CrudDao<HmrtPatient> {
	
}