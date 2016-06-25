/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorerule.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.hmrtscorerule.entity.HmrtScoreRule;
import com.thinkgem.jeesite.modules.hmrtscorerule.dao.HmrtScoreRuleDao;

/**
 * 积分规则自动生成Service
 * @author 赵九扬
 * @version 2016-06-25
 */
@Service
@Transactional(readOnly = true)
public class HmrtScoreRuleService extends CrudService<HmrtScoreRuleDao, HmrtScoreRule> {

	public HmrtScoreRule get(String id) {
		return super.get(id);
	}
	
	public List<HmrtScoreRule> findList(HmrtScoreRule hmrtScoreRule) {
		return super.findList(hmrtScoreRule);
	}
	
	public Page<HmrtScoreRule> findPage(Page<HmrtScoreRule> page, HmrtScoreRule hmrtScoreRule) {
		return super.findPage(page, hmrtScoreRule);
	}
	
	@Transactional(readOnly = false)
	public void save(HmrtScoreRule hmrtScoreRule) {
		super.save(hmrtScoreRule);
	}
	
	@Transactional(readOnly = false)
	public void delete(HmrtScoreRule hmrtScoreRule) {
		super.delete(hmrtScoreRule);
	}
	
}