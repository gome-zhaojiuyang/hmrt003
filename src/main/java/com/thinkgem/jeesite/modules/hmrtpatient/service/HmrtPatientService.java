/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtpatient.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.hmrtpatient.entity.HmrtPatient;
import com.thinkgem.jeesite.modules.hmrtpatient.dao.HmrtPatientDao;

/**
 * 患者信息维护Service
 * @author 赵九扬
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class HmrtPatientService extends CrudService<HmrtPatientDao, HmrtPatient> {

	public HmrtPatient get(String id) {
		return super.get(id);
	}
	
	public List<HmrtPatient> findList(HmrtPatient hmrtPatient) {
		return super.findList(hmrtPatient);
	}
	
	public Page<HmrtPatient> findPage(Page<HmrtPatient> page, HmrtPatient hmrtPatient) {
		return super.findPage(page, hmrtPatient);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtPatient hmrtPatient) {
		if (StringUtils.isBlank(hmrtPatient.getId())){
			hmrtPatient.preInsert();
			dao.insert(hmrtPatient);
		}else{
			hmrtPatient.preUpdate();
			dao.update(hmrtPatient);
		}
//		super.save(hmrtPatient);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtPatient hmrtPatient) {
		super.delete(hmrtPatient);
	}
	
}