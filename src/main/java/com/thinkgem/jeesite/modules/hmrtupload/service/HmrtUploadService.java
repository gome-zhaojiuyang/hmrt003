/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtupload.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtupload.entity.HmrtUpload;
import com.thinkgem.jeesite.modules.hmrtupload.dao.HmrtUploadDao;

/**
 * 资源上传Service
 * @author 赵九扬
 * @version 2016-08-21
 */
@Service
@Transactional(readOnly = true)
public class HmrtUploadService extends CrudService<HmrtUploadDao, HmrtUpload> {

	public List<HmrtUpload> getResByCaseId(HmrtUpload hmrtUpload) {
		return dao.getResByCaseId(hmrtUpload);
	}
	public HmrtUpload get(String id) {
		return super.get(id);
	}
	
	public List<HmrtUpload> findList(HmrtUpload hmrtUpload) {
		return super.findList(hmrtUpload);
	}
	
	public Page<HmrtUpload> findPage(Page<HmrtUpload> page, HmrtUpload hmrtUpload) {
		return super.findPage(page, hmrtUpload);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtUpload hmrtUpload) {
		super.save(hmrtUpload);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtUpload hmrtUpload) {
		super.delete(hmrtUpload);
	}
	
}