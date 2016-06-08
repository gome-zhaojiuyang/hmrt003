/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/activityApi")
public class activityApiController extends BaseController {
	@Autowired
	private ArticleService articleService;
	/**
	 * 
	 * 查询列表信息
	 */
	@RequestMapping(value = "queryActivityList")
	public void queryActivityList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			//病例表 Article
			Article caseinfo = new Article();
			caseinfo.setCategory(new Category("a1699b0aedce4cdb9c0551d4b36568b0"));
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
			//caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
			List<Article> list = articleService.findList(caseinfo);
			
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", list)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	/**
	 * 
	 * 查询详情信息
	 */
	@RequestMapping(value = "queryActivityById")
	public void queryActivityById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			String id = StringUtils.toString(request.getParameter("id"));

			// 病例表 Article
			Article caseinfo = new Article();
			caseinfo.setCategory(new Category("a1699b0aedce4cdb9c0551d4b36568b0"));
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
//			caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
			caseinfo.setId(id);
			List<Article> list = articleService.findList(caseinfo);
			if(list==null || list.size()==0){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+id+"]错误！", "")));
				return;
			}
			caseinfo = list.get(0);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", caseinfo)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	/**
	 * 
	 * 点击 点赞
	 */
	@RequestMapping(value = "activityHit")
	public void activityHit(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return;
			}
			String id = StringUtils.toString(request.getParameter("id"));
			// 文章阅读次数+1
			articleService.updateHitsAddOne(id);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", "")));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
}
