/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtupload.web;

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
import com.thinkgem.jeesite.modules.hmrtupload.entity.HmrtUpload;
import com.thinkgem.jeesite.modules.hmrtupload.service.HmrtUploadService;

/**
 * 资源上传Controller
 * @author 赵九扬
 * @version 2016-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrtupload/hmrtUpload")
public class HmrtUploadController extends BaseController {

	@Autowired
	private HmrtUploadService hmrtUploadService;
	
	@ModelAttribute
	public HmrtUpload get(@RequestParam(required=false) String id) {
		HmrtUpload entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtUploadService.get(id);
		}
		if (entity == null){
			entity = new HmrtUpload();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrtupload:hmrtUpload:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtUpload hmrtUpload, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtUpload> page = hmrtUploadService.findPage(new Page<HmrtUpload>(request, response), hmrtUpload); 
		model.addAttribute("page", page);
		return "modules/hmrtupload/hmrtUploadList";
	}

	@RequiresPermissions("hmrtupload:hmrtUpload:view")
	@RequestMapping(value = "form")
	public String form(HmrtUpload hmrtUpload, Model model) {
		model.addAttribute("hmrtUpload", hmrtUpload);
		return "modules/hmrtupload/hmrtUploadForm";
	}

	@RequiresPermissions("hmrtupload:hmrtUpload:edit")
	@RequestMapping(value = "save")
	public String save(HmrtUpload hmrtUpload, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtUpload)){
			return form(hmrtUpload, model);
		}
		hmrtUploadService.save(hmrtUpload);
		addMessage(redirectAttributes, "保存资源上传成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtupload/hmrtUpload/?repage";
	}
	
	@RequiresPermissions("hmrtupload:hmrtUpload:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtUpload hmrtUpload, RedirectAttributes redirectAttributes) {
		hmrtUploadService.delete(hmrtUpload);
		addMessage(redirectAttributes, "删除资源上传成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtupload/hmrtUpload/?repage";
	}

}