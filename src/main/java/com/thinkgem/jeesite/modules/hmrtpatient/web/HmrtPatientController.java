/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtpatient.web;

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
import com.thinkgem.jeesite.modules.hmrtpatient.entity.HmrtPatient;
import com.thinkgem.jeesite.modules.hmrtpatient.service.HmrtPatientService;

/**
 * 患者信息维护Controller
 * @author 赵九扬
 * @version 2016-06-18
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtpatient/hmrtPatient")
public class HmrtPatientController extends BaseController {

	@Autowired
	private HmrtPatientService hmrtPatientService;
	
	@ModelAttribute
	public HmrtPatient get(@RequestParam(required=false) String id) {
		HmrtPatient entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtPatientService.get(id);
		}
		if (entity == null){
			entity = new HmrtPatient();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtpatient:hmrtPatient:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtPatient hmrtPatient, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtPatient> page = hmrtPatientService.findPage(new Page<HmrtPatient>(request, response), hmrtPatient); 
		model.addAttribute("page", page);
		return "modules/hmrtpatient/hmrtPatientList";
	}

	@RequiresPermissions("hmrtpatient:hmrtPatient:view")
	@RequestMapping(value = "form")
	public String form(HmrtPatient hmrtPatient, Model model) {
		model.addAttribute("hmrtPatient", hmrtPatient);
		return "modules/hmrtpatient/hmrtPatientForm";
	}

	@RequiresPermissions("hmrtpatient:hmrtPatient:edit")
	@RequestMapping(value = "save")
	public String save(HmrtPatient hmrtPatient, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtPatient)){
			return form(hmrtPatient, model);
		}
		hmrtPatientService.save(hmrtPatient);
		addMessage(redirectAttributes, "保存患者信息成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtpatient/hmrtPatient/?repage";
	}
	
	@RequiresPermissions("hmrtpatient:hmrtPatient:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtPatient hmrtPatient, RedirectAttributes redirectAttributes) {
		hmrtPatientService.delete(hmrtPatient);
		addMessage(redirectAttributes, "删除患者信息成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtpatient/hmrtPatient/?repage";
	}

}