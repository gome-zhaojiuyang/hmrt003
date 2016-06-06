/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtarticletags.web;

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
import com.thinkgem.jeesite.modules.hmrtarticletags.entity.HmrtArticleTags;
import com.thinkgem.jeesite.modules.hmrtarticletags.service.HmrtArticleTagsService;

/**
 * 病历标签关系Controller
 * @author 赵九扬
 * @version 2016-06-06
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtarticletags/hmrtArticleTags")
public class HmrtArticleTagsController extends BaseController {

	@Autowired
	private HmrtArticleTagsService hmrtArticleTagsService;
	
	@ModelAttribute
	public HmrtArticleTags get(@RequestParam(required=false) String id) {
		HmrtArticleTags entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtArticleTagsService.get(id);
		}
		if (entity == null){
			entity = new HmrtArticleTags();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtarticletags:hmrtArticleTags:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtArticleTags hmrtArticleTags, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtArticleTags> page = hmrtArticleTagsService.findPage(new Page<HmrtArticleTags>(request, response), hmrtArticleTags); 
		model.addAttribute("page", page);
		return "modules/hmrtarticletags/hmrtArticleTagsList";
	}

	@RequiresPermissions("hmrtarticletags:hmrtArticleTags:view")
	@RequestMapping(value = "form")
	public String form(HmrtArticleTags hmrtArticleTags, Model model) {
		model.addAttribute("hmrtArticleTags", hmrtArticleTags);
		return "modules/hmrtarticletags/hmrtArticleTagsForm";
	}

	@RequiresPermissions("hmrtarticletags:hmrtArticleTags:edit")
	@RequestMapping(value = "save")
	public String save(HmrtArticleTags hmrtArticleTags, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtArticleTags)){
			return form(hmrtArticleTags, model);
		}
		hmrtArticleTagsService.save(hmrtArticleTags);
		addMessage(redirectAttributes, "保存病历标签关系成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtarticletags/hmrtArticleTags/?repage";
	}
	
	@RequiresPermissions("hmrtarticletags:hmrtArticleTags:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtArticleTags hmrtArticleTags, RedirectAttributes redirectAttributes) {
		hmrtArticleTagsService.delete(hmrtArticleTags);
		addMessage(redirectAttributes, "删除病历标签关系成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtarticletags/hmrtArticleTags/?repage";
	}

}