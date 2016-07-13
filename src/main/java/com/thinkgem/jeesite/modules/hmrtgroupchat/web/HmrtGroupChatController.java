/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.web;

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
import com.thinkgem.jeesite.modules.hmrtgroupchat.entity.HmrtGroupChat;
import com.thinkgem.jeesite.modules.hmrtgroupchat.service.HmrtGroupChatService;

/**
 * 讨论聊天内容备份Controller
 * @author zhuhb
 * @version 2016-07-12
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtgroupchat/hmrtGroupChat")
public class HmrtGroupChatController extends BaseController {

	@Autowired
	private HmrtGroupChatService hmrtGroupChatService;
	
	@ModelAttribute
	public HmrtGroupChat get(@RequestParam(required=false) String id) {
		HmrtGroupChat entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtGroupChatService.get(id);
		}
		if (entity == null){
			entity = new HmrtGroupChat();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtgroupchat:hmrtGroupChat:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtGroupChat hmrtGroupChat, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtGroupChat> page = hmrtGroupChatService.findPage(new Page<HmrtGroupChat>(request, response), hmrtGroupChat); 
		model.addAttribute("page", page);
		return "modules/hmrtgroupchat/hmrtGroupChatList";
	}

	@RequiresPermissions("hmrtgroupchat:hmrtGroupChat:view")
	@RequestMapping(value = "form")
	public String form(HmrtGroupChat hmrtGroupChat, Model model) {
		model.addAttribute("hmrtGroupChat", hmrtGroupChat);
		return "modules/hmrtgroupchat/hmrtGroupChatForm";
	}

	@RequiresPermissions("hmrtgroupchat:hmrtGroupChat:edit")
	@RequestMapping(value = "save")
	public String save(HmrtGroupChat hmrtGroupChat, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtGroupChat)){
			return form(hmrtGroupChat, model);
		}
		hmrtGroupChatService.save(hmrtGroupChat);
		addMessage(redirectAttributes, "保存讨论聊天内容备份成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupchat/hmrtGroupChat/?repage";
	}
	
	@RequiresPermissions("hmrtgroupchat:hmrtGroupChat:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtGroupChat hmrtGroupChat, RedirectAttributes redirectAttributes) {
		hmrtGroupChatService.delete(hmrtGroupChat);
		addMessage(redirectAttributes, "删除讨论聊天内容备份成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupchat/hmrtGroupChat/?repage";
	}

}