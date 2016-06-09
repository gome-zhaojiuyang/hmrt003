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

import com.thinkgem.jeesite.common.utils.ApiUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/infoRepoApi")
public class InfoRepoApiController extends BaseController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	/**
	 * 
	 * 查询资料库列表信息
	 */
	@RequestMapping(value = "queryInfoRepoList")
	public void queryInfoRepoList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
			//病例表 Article
			Article caseinfo = new Article();
			caseinfo.setCategory(new Category("fab0ae2c1c0c4aa7ac1d9d60f6f8973b"));
			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
			//caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
			List<Article> list = articleService.findList(caseinfo);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.articleList2MapList(list, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	/**
	 * 
	 * 查询资料库详情信息
	 */
	@RequestMapping(value = "queryInfoRepoById")
	public void queryInfoRepoById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
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

			//Article
//			Article caseinfo = new Article();
//			caseinfo.setCategory(new Category("fab0ae2c1c0c4aa7ac1d9d60f6f8973b"));
//			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
//			caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
//			caseinfo.setId(id);
			Article caseinfo = articleService.get(id);
			if(caseinfo==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id["+id+"]错误！", "")));
				return;
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ApiUtils.article2Map(caseinfo, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
}
