/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtupload.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtupload.entity.HmrtUpload;

/**
 * 资源上传DAO接口
 * @author 赵九扬
 * @version 2016-08-21
 */
@MyBatisDao
public interface HmrtUploadDao extends CrudDao<HmrtUpload> {
	
}