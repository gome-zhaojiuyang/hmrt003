/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrttest.web.hmrttestchild;

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
import com.thinkgem.jeesite.modules.hmrttest.entity.hmrttestchild.HmrtTest;
import com.thinkgem.jeesite.modules.hmrttest.service.hmrttestchild.HmrtTestService;

/**
 * 测试生成功能描述Controller
 * @author 赵九扬
 * @version 2016-05-22
 */
@Controller
@RequestMapping(value = "${adminPath}/hmrttest/hmrttestchild/hmrtTest")
public class HmrtTestController extends BaseController {

	@Autowired
	private HmrtTestService hmrtTestService;
	
	@ModelAttribute
	public HmrtTest get(@RequestParam(required=false) String id) {
		HmrtTest entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtTestService.get(id);
		}
		if (entity == null){
			entity = new HmrtTest();
		}
		return entity;
	}
	
	@RequiresPermissions("hmrttest:hmrttestchild:hmrtTest:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtTest hmrtTest, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtTest> page = hmrtTestService.findPage(new Page<HmrtTest>(request, response), hmrtTest); 
		model.addAttribute("page", page);
		return "modules/hmrttest/hmrttestchild/hmrtTestList";
	}

	@RequiresPermissions("hmrttest:hmrttestchild:hmrtTest:view")
	@RequestMapping(value = "form")
	public String form(HmrtTest hmrtTest, Model model) {
		model.addAttribute("hmrtTest", hmrtTest);
		return "modules/hmrttest/hmrttestchild/hmrtTestForm";
	}

	@RequiresPermissions("hmrttest:hmrttestchild:hmrtTest:edit")
	@RequestMapping(value = "save")
	public String save(HmrtTest hmrtTest, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, hmrtTest)){
			return form(hmrtTest, model);
		}
		hmrtTestService.save(hmrtTest);
		addMessage(redirectAttributes, "保存测试模块成功");
		return "redirect:"+Global.getAdminPath()+"/hmrttest/hmrttestchild/hmrtTest/?repage";
	}
	
	@RequiresPermissions("hmrttest:hmrttestchild:hmrtTest:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtTest hmrtTest, RedirectAttributes redirectAttributes) {
		hmrtTestService.delete(hmrtTest);
		addMessage(redirectAttributes, "删除测试模块成功");
		return "redirect:"+Global.getAdminPath()+"/hmrttest/hmrttestchild/hmrtTest/?repage";
	}

}