/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.hmrtgroupchat.entity.HmrtGroupChat;

/**
 * 分组聊天DAO接口
 * @author 赵九扬
 * @version 2016-06-18
 */
@MyBatisDao
public interface HmrtGroupChatDao extends CrudDao<HmrtGroupChat> {
	
}