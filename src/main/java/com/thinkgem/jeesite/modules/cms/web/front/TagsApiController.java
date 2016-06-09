/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrttags.entity.HmrtTags;
import com.thinkgem.jeesite.modules.hmrttags.service.HmrtTagsService;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/tagsApi")
public class TagsApiController extends BaseController{
	@Autowired
	private HmrtTagsService hmrtTagsService;

	/**
	 * 
	 * 轮播图引导图 接口
	 */
	@RequestMapping(value="save")
	public void scrollImages(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("name"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,name不能为空！", "")));
				return ;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			String name = StringUtils.toString(request.getParameter("name"));
			HmrtTags hmrtTags = new HmrtTags();
			hmrtTags.setUserid(userid);
			hmrtTags.setName(name);
			hmrtTags.setCreateDate(new Date());
			hmrtTagsService.save(hmrtTags);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	/**
	 * 
	 * 查询用户所有病例标签接口
	 */
	@RequestMapping(value="queryUserTags")
	public void queryUserTags(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return ;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			HmrtTags hmrtTags = new HmrtTags();
			hmrtTags.setUserid(userid);
			hmrtTagsService.findList(hmrtTags);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 删除用户病例标签接口
	 */
	@RequestMapping(value="deleteUserTag")
	public void deleteUserTag(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return ;
			}
			String id = StringUtils.toString(request.getParameter("id"));
			
			HmrtTags hmrtTags = new HmrtTags();
			hmrtTags.setId(id);
			hmrtTagsService.delete(hmrtTags);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
}
