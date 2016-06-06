/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroup.web;

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
import com.thinkgem.jeesite.modules.hmrtgroup.entity.HmrtGroup;
import com.thinkgem.jeesite.modules.hmrtgroup.service.HmrtGroupService;

/**
 * 聊天分组Controller
 * @author 赵九扬
 * @version 2016-06-06
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtgroup/hmrtGroup")
public class HmrtGroupController extends BaseController {

	@Autowired
	private HmrtGroupService hmrtGroupService;
	
	@ModelAttribute
	public HmrtGroup get(@RequestParam(required=false) String id) {
		HmrtGroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtGroupService.get(id);
		}
		if (entity == null){
			entity = new HmrtGroup();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtgroup:hmrtGroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtGroup hmrtGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtGroup> page = hmrtGroupService.findPage(new Page<HmrtGroup>(request, response), hmrtGroup); 
		model.addAttribute("page", page);
		return "modules/hmrtgroup/hmrtGroupList";
	}

	@RequiresPermissions("hmrtgroup:hmrtGroup:view")
	@RequestMapping(value = "form")
	public String form(HmrtGroup hmrtGroup, Model model) {
		model.addAttribute("hmrtGroup", hmrtGroup);
		return "modules/hmrtgroup/hmrtGroupForm";
	}

	@RequiresPermissions("hmrtgroup:hmrtGroup:edit")
	@RequestMapping(value = "save")
	public String save(HmrtGroup hmrtGroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtGroup)){
			return form(hmrtGroup, model);
		}
		hmrtGroupService.save(hmrtGroup);
		addMessage(redirectAttributes, "保存聊天分组成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroup/hmrtGroup/?repage";
	}
	
	@RequiresPermissions("hmrtgroup:hmrtGroup:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtGroup hmrtGroup, RedirectAttributes redirectAttributes) {
		hmrtGroupService.delete(hmrtGroup);
		addMessage(redirectAttributes, "删除聊天分组成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroup/hmrtGroup/?repage";
	}

}