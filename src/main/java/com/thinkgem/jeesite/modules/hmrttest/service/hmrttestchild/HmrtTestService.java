/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttest.service.hmrttestchild;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrttest.entity.hmrttestchild.HmrtTest;
import com.thinkgem.jeesite.modules.hmrttest.dao.hmrttestchild.HmrtTestDao;

/**
 * 测试生成功能描述Service
 * @author 赵九扬
 * @version 2016-05-22
 */
@Service
@Transactional(readOnly = true)
public class HmrtTestService extends CrudService<HmrtTestDao, HmrtTest> {

	public HmrtTest get(String id) {
		return super.get(id);
	}
	
	public List<HmrtTest> findList(HmrtTest hmrtTest) {
		return super.findList(hmrtTest);
	}
	
	public Page<HmrtTest> findPage(Page<HmrtTest> page, HmrtTest hmrtTest) {
		return super.findPage(page, hmrtTest);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtTest hmrtTest) {
		super.save(hmrtTest);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtTest hmrtTest) {
		super.delete(hmrtTest);
	}
	
}