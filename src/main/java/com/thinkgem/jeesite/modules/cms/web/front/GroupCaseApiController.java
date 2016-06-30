/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

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
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtgroupcase.entity.HmrtGroupCase;
import com.thinkgem.jeesite.modules.hmrtgroupcase.service.HmrtGroupCaseService;

/**
 * 群聊对应病例Controller
 * @author zhuhb
 * @version 2016-06-30
 */
@Controller
@RequestMapping(value = "${frontPath}/groupcaseApi")
public class GroupCaseApiController extends BaseController {

	@Autowired
	private HmrtGroupCaseService hmrtGroupCaseService;
	
	@RequestMapping(value = "save")
	public void save(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			
			String groupId = request.getParameter("groupId");
			String groupname = request.getParameter("groupname");
			String owner = request.getParameter("owner");
			String caseId = request.getParameter("caseId");
			String description = request.getParameter("description");
			
			if (StringUtils.isEmpty(groupId)) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,groupId不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(groupname)) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,groupname不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(owner)) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,owner不能为空！", "")));
				return;
			}
			if (StringUtils.isEmpty(caseId)) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,caseId不能为空！", "")));
				return;
			}
			
			HmrtGroupCase hmrtGroupCase = new HmrtGroupCase();
			hmrtGroupCase.setGroupId(groupId);
			hmrtGroupCase.setGroupname(groupname);
			hmrtGroupCase.setOwner(owner);
			hmrtGroupCase.setCaseId(caseId);
			hmrtGroupCase.setDescription(description);
			hmrtGroupCaseService.save(hmrtGroupCase);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "保存群聊对应病例操作成功", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
	}
	
	
	@RequestMapping(value = "get")
	public void get(@RequestParam(required=false) String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HmrtGroupCase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = hmrtGroupCaseService.get(id);
		}
		if (entity == null){
			entity = new HmrtGroupCase();
		}
		outputJson(response, JsonUtil.beanToJson(putResponseData(200, "获取成功", entity)));
	}
	
	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:view")
	@RequestMapping(value = {"list", ""})
	public String list(HmrtGroupCase hmrtGroupCase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HmrtGroupCase> page = hmrtGroupCaseService.findPage(new Page<HmrtGroupCase>(request, response), hmrtGroupCase); 
		model.addAttribute("page", page);
		return "modules/hmrtgroupcase/hmrtGroupCaseList";
	}

	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:view")
	@RequestMapping(value = "form")
	public String form(HmrtGroupCase hmrtGroupCase, Model model) {
		model.addAttribute("hmrtGroupCase", hmrtGroupCase);
		return "modules/hmrtgroupcase/hmrtGroupCaseForm";
	}

	@RequiresPermissions("hmrtgroupcase:hmrtGroupCase:edit")
	@RequestMapping(value = "delete")
	public String delete(HmrtGroupCase hmrtGroupCase, RedirectAttributes redirectAttributes) {
		hmrtGroupCaseService.delete(hmrtGroupCase);
		addMessage(redirectAttributes, "删除群聊对应病例操作成功");
		return "redirect:"+Global.getAdminPath()+"/hmrtgroupcase/hmrtGroupCase/?repage";
	}

}