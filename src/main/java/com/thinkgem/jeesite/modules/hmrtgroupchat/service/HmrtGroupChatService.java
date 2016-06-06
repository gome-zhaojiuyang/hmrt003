/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.hmrtgroupchat.entity.HmrtGroupChat;
import com.thinkgem.jeesite.modules.hmrtgroupchat.dao.HmrtGroupChatDao;

/**
 * 分组聊天Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtGroupChatService extends CrudService<HmrtGroupChatDao, HmrtGroupChat> {

	public HmrtGroupChat get(String id) {
		return super.get(id);
	}
	
	public List<HmrtGroupChat> findList(HmrtGroupChat hmrtGroupChat) {
		return super.findList(hmrtGroupChat);
	}
	
	public Page<HmrtGroupChat> findPage(Page<HmrtGroupChat> page, HmrtGroupChat hmrtGroupChat) {
		return super.findPage(page, hmrtGroupChat);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtGroupChat hmrtGroupChat) {
		if (StringUtils.isBlank(hmrtGroupChat.getId())){
			hmrtGroupChat.preInsert();
			dao.insert(hmrtGroupChat);
		}else{
			hmrtGroupChat.preUpdate();
			dao.update(hmrtGroupChat);
		}
//		super.save(hmrtGroupChat);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtGroupChat hmrtGroupChat) {
		super.delete(hmrtGroupChat);
	}
	
}