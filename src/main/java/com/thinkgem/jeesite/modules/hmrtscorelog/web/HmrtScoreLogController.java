/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtscorelog.web;

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
import com.thinkgem.jeesite.modules.hmrtscorelog.entity.HmrtScoreLog;
import com.thinkgem.jeesite.modules.hmrtscorelog.service.HmrtScoreLogService;

/**
 * 积分日志Controller
 * @author 赵九扬
 * @version 2016-06-25
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtscorelog/hmrtScoreLog")
public class HmrtScoreLogController extends BaseController {

	@Autowired
	private HmrtScoreLogService hmrtScoreLogService;
	
	@ModelAttribute
	public HmrtScoreLog get(@RequestParam(required=false) String id) {
		HmrtScoreLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtScoreLogService.get(id);
		}
		if (entity == null){
			entity = new HmrtScoreLog();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtscorelog:hmrtScoreLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtScoreLog hmrtScoreLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtScoreLog> page = hmrtScoreLogService.findPage(new Page<HmrtScoreLog>(request, response), hmrtScoreLog); 
		model.addAttribute("page", page);
		return "modules/hmrtscorelog/hmrtScoreLogList";
	}

	@RequiresPermissions("hmrtscorelog:hmrtScoreLog:view")
	@RequestMapping(value = "form")
	public String form(HmrtScoreLog hmrtScoreLog, Model model) {
		model.addAttribute("hmrtScoreLog", hmrtScoreLog);
		return "modules/hmrtscorelog/hmrtScoreLogForm";
	}

	@RequiresPermissions("hmrtscorelog:hmrtScoreLog:edit")
	@RequestMapping(value = "save")
	public String save(HmrtScoreLog hmrtScoreLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtScoreLog)){
			return form(hmrtScoreLog, model);
		}
		hmrtScoreLogService.save(hmrtScoreLog);
		addMessage(redirectAttributes, "保存积分日志成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtscorelog/hmrtScoreLog/?repage";
	}
	
	@RequiresPermissions("hmrtscorelog:hmrtScoreLog:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtScoreLog hmrtScoreLog, RedirectAttributes redirectAttributes) {
		hmrtScoreLogService.delete(hmrtScoreLog);
		addMessage(redirectAttributes, "删除积分日志成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtscorelog/hmrtScoreLog/?repage";
	}

}