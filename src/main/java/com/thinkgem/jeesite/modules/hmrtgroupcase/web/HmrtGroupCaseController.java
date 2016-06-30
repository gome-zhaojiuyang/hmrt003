/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupcase.web;

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
import com.thinkgem.jeesite.modules.hmrtgroupcase.entity.HmrtGroupCase;
import com.thinkgem.jeesite.modules.hmrtgroupcase.service.HmrtGroupCaseService;

/**
 * 群聊对应病例Controller
 * @author zhuhb
 * @version 2016-06-30
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtgroupcase/hmrtGroupCase")
public class HmrtGroupCaseController extends BaseController {

	@Autowired
	private HmrtGroupCaseService hmrtGroupCaseService;
	
	@ModelAttribute
	public HmrtGroupCase get(@RequestParam(required=false) String id) {
		HmrtGroupCase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtGroupCaseService.get(id);
		}
		if (entity == null){
			entity = new HmrtGroupCase();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtGroupCase hmrtGroupCase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtGroupCase> page = hmrtGroupCaseService.findPage(new Page<HmrtGroupCase>(request, response), hmrtGroupCase); 
		model.addAttribute("page", page);
		return "modules/hmrtgroupcase/hmrtGroupCaseList";
	}

	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:view")
	@RequestMapping(value = "form")
	public String form(HmrtGroupCase hmrtGroupCase, Model model) {
		model.addAttribute("hmrtGroupCase", hmrtGroupCase);
		return "modules/hmrtgroupcase/hmrtGroupCaseForm";
	}

	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:edit")
	@RequestMapping(value = "save")
	public String save(HmrtGroupCase hmrtGroupCase, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtGroupCase)){
			return form(hmrtGroupCase, model);
		}
		hmrtGroupCaseService.save(hmrtGroupCase);
		addMessage(redirectAttributes, "保存群聊对应病例操作成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupcase/hmrtGroupCase/?repage";
	}
	
	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtGroupCase hmrtGroupCase, RedirectAttributes redirectAttributes) {
		hmrtGroupCaseService.delete(hmrtGroupCase);
		addMessage(redirectAttributes, "删除群聊对应病例操作成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupcase/hmrtGroupCase/?repage";
	}

}