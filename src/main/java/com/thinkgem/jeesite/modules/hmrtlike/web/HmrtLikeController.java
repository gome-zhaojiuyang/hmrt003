/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtlike.web;

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
import com.thinkgem.jeesite.modules.hmrtlike.entity.HmrtLike;
import com.thinkgem.jeesite.modules.hmrtlike.service.HmrtLikeService;

/**
 * 活动点赞Controller
 * @author 赵九扬
 * @version 2016-06-09
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtlike/hmrtLike")
public class HmrtLikeController extends BaseController {

	@Autowired
	private HmrtLikeService hmrtLikeService;
	
	@ModelAttribute
	public HmrtLike get(@RequestParam(required=false) String id) {
		HmrtLike entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtLikeService.get(id);
		}
		if (entity == null){
			entity = new HmrtLike();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtlike:hmrtLike:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtLike hmrtLike, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtLike> page = hmrtLikeService.findPage(new Page<HmrtLike>(request, response), hmrtLike); 
		model.addAttribute("page", page);
		return "modules/hmrtlike/hmrtLikeList";
	}

	@RequiresPermissions("hmrtlike:hmrtLike:view")
	@RequestMapping(value = "form")
	public String form(HmrtLike hmrtLike, Model model) {
		model.addAttribute("hmrtLike", hmrtLike);
		return "modules/hmrtlike/hmrtLikeForm";
	}

	@RequiresPermissions("hmrtlike:hmrtLike:edit")
	@RequestMapping(value = "save")
	public String save(HmrtLike hmrtLike, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtLike)){
			return form(hmrtLike, model);
		}
		hmrtLikeService.save(hmrtLike);
		addMessage(redirectAttributes, "保存活动点赞成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtlike/hmrtLike/?repage";
	}
	
	@RequiresPermissions("hmrtlike:hmrtLike:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtLike hmrtLike, RedirectAttributes redirectAttributes) {
		hmrtLikeService.delete(hmrtLike);
		addMessage(redirectAttributes, "删除活动点赞成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtlike/hmrtLike/?repage";
	}

}