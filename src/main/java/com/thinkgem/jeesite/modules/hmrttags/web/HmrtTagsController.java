/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttags.web;

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
import com.thinkgem.jeesite.modules.hmrttags.entity.HmrtTags;
import com.thinkgem.jeesite.modules.hmrttags.service.HmrtTagsService;

/**
 * 病例标签Controller
 * @author 赵九扬
 * @version 2016-06-06
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrttags/hmrtTags")
public class HmrtTagsController extends BaseController {

	@Autowired
	private HmrtTagsService hmrtTagsService;
	
	@ModelAttribute
	public HmrtTags get(@RequestParam(required=false) String id) {
		HmrtTags entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtTagsService.get(id);
		}
		if (entity == null){
			entity = new HmrtTags();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrttags:hmrtTags:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtTags hmrtTags, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtTags> page = hmrtTagsService.findPage(new Page<HmrtTags>(request, response), hmrtTags); 
		model.addAttribute("page", page);
		return "modules/hmrttags/hmrtTagsList";
	}

	@RequiresPermissions("hmrttags:hmrtTags:view")
	@RequestMapping(value = "form")
	public String form(HmrtTags hmrtTags, Model model) {
		model.addAttribute("hmrtTags", hmrtTags);
		return "modules/hmrttags/hmrtTagsForm";
	}

	@RequiresPermissions("hmrttags:hmrtTags:edit")
	@RequestMapping(value = "save")
	public String save(HmrtTags hmrtTags, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtTags)){
			return form(hmrtTags, model);
		}
		hmrtTagsService.save(hmrtTags);
		addMessage(redirectAttributes, "保存病例标签成功");
		return "redirect:"+Global.getAdminPath()+"/hmrttags/hmrtTags/?repage";
	}
	
	@RequiresPermissions("hmrttags:hmrtTags:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtTags hmrtTags, RedirectAttributes redirectAttributes) {
		hmrtTagsService.delete(hmrtTags);
		addMessage(redirectAttributes, "删除病例标签成功");
		return "redirect:"+Global.getAdminPath()+"/hmrttags/hmrtTags/?repage";
	}

}