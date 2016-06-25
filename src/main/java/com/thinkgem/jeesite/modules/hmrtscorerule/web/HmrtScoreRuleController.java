/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorerule.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.hmrtscorerule.entity.HmrtScoreRule;
import com.thinkgem.jeesite.modules.hmrtscorerule.service.HmrtScoreRuleService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 积分规则自动生成Controller
 * @author 赵九扬
 * @version 2016-06-25
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtscorerule/hmrtScoreRule")
public class HmrtScoreRuleController extends BaseController {

	@Autowired
	private HmrtScoreRuleService hmrtScoreRuleService;
	
	@ModelAttribute
	public HmrtScoreRule get(@RequestParam(required=false) String id) {
		HmrtScoreRule entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtScoreRuleService.get(id);
		}
		if (entity == null){
			entity = new HmrtScoreRule();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtscorerule:hmrtScoreRule:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtScoreRule hmrtScoreRule, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtScoreRule> page = hmrtScoreRuleService.findPage(new Page<HmrtScoreRule>(request, response), hmrtScoreRule); 
		model.addAttribute("page", page);
		return "modules/hmrtscorerule/hmrtScoreRuleList";
	}

	@RequiresPermissions("hmrtscorerule:hmrtScoreRule:view")
	@RequestMapping(value = "form")
	public String form(HmrtScoreRule hmrtScoreRule, Model model) {
		model.addAttribute("hmrtScoreRule", hmrtScoreRule);
		return "modules/hmrtscorerule/hmrtScoreRuleForm";
	}

	@RequiresPermissions("hmrtscorerule:hmrtScoreRule:edit")
	@RequestMapping(value = "save")
	public String save(HmrtScoreRule hmrtScoreRule, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtScoreRule)){
			return form(hmrtScoreRule, model);
		}
		hmrtScoreRule.setUserid(UserUtils.getUser().getId());
		hmrtScoreRuleService.save(hmrtScoreRule);
		addMessage(redirectAttributes, "保存积分规则成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtscorerule/hmrtScoreRule/?repage";
	}
	
	@RequiresPermissions("hmrtscorerule:hmrtScoreRule:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtScoreRule hmrtScoreRule, RedirectAttributes redirectAttributes) {
		hmrtScoreRuleService.delete(hmrtScoreRule);
		addMessage(redirectAttributes, "删除积分规则成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtscorerule/hmrtScoreRule/?repage";
	}

}