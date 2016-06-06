/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupuser.web;

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
import com.thinkgem.jeesite.modules.hmrtgroupuser.entity.HmrtGroupUser;
import com.thinkgem.jeesite.modules.hmrtgroupuser.service.HmrtGroupUserService;

/**
 * 分组用户Controller
 * @author 赵九扬
 * @version 2016-06-06
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtgroupuser/hmrtGroupUser")
public class HmrtGroupUserController extends BaseController {

	@Autowired
	private HmrtGroupUserService hmrtGroupUserService;
	
	@ModelAttribute
	public HmrtGroupUser get(@RequestParam(required=false) String id) {
		HmrtGroupUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtGroupUserService.get(id);
		}
		if (entity == null){
			entity = new HmrtGroupUser();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtgroupuser:hmrtGroupUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtGroupUser hmrtGroupUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtGroupUser> page = hmrtGroupUserService.findPage(new Page<HmrtGroupUser>(request, response), hmrtGroupUser); 
		model.addAttribute("page", page);
		return "modules/hmrtgroupuser/hmrtGroupUserList";
	}

	@RequiresPermissions("hmrtgroupuser:hmrtGroupUser:view")
	@RequestMapping(value = "form")
	public String form(HmrtGroupUser hmrtGroupUser, Model model) {
		model.addAttribute("hmrtGroupUser", hmrtGroupUser);
		return "modules/hmrtgroupuser/hmrtGroupUserForm";
	}

	@RequiresPermissions("hmrtgroupuser:hmrtGroupUser:edit")
	@RequestMapping(value = "save")
	public String save(HmrtGroupUser hmrtGroupUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtGroupUser)){
			return form(hmrtGroupUser, model);
		}
		hmrtGroupUserService.save(hmrtGroupUser);
		addMessage(redirectAttributes, "保存分组用户成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupuser/hmrtGroupUser/?repage";
	}
	
	@RequiresPermissions("hmrtgroupuser:hmrtGroupUser:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtGroupUser hmrtGroupUser, RedirectAttributes redirectAttributes) {
		hmrtGroupUserService.delete(hmrtGroupUser);
		addMessage(redirectAttributes, "删除分组用户成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupuser/hmrtGroupUser/?repage";
	}

}