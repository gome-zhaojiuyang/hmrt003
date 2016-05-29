/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/api")
public class FrontApiController extends BaseController{
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	/**
	 * 默认测试
	 */
	@RequestMapping
	public void main(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", "测试数据接口OK")));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		 
	}
	
	/**
	 * 根据分类ID 获取 文章。后台可以配置内容
	 */
	@RequestMapping(value="getArticleByCategoryId")
	public void getArticleByCategoryId(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
//			if (!validate(request, response)) {
//				return;
//			}
			Article article = new Article();
			//可以考虑作为入参获取 分类信息下内容
			//引导页   3c8e7b39855649ff8d12da0f5e304f4b
			if (StringUtils.isEmpty(request.getParameter("categoryId"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,categoryId不能为空！", "")));
				return;
			}
			String categoryId = request.getParameter("categoryId") ;
			article.setCategory(new Category(categoryId));//引导页分类ID
			//article.setTitle("测试测试测试测试测试测试测试测试"+article.getCategory().getId());
//			article.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			Page<Article> page = articleService.findPage(new Page<Article>(request, response), article, true); 
//            System.out.println("indexlist>>>"+page.getList());
//			if (StringUtils.isEmpty(request.getParameter("cityId"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,cityId不能为空！", "")));
//				return;
//			}
			List<Article> list = articleService.findList(article);
			List<Map<String,String>> newList = new ArrayList<Map<String,String>>();
			for(Article a: list){
				Map<String,String> anew = new HashMap<String,String>();
				anew.put("title", a.getTitle());
//				anew.put("image", a.getImage());
//				anew.put("imageSrc", a.getImageSrc());
//				
				anew.put("content", articleDataService.get(a.getId()).getContent());
//				anew.setCategory(a.getCategory());
				newList.add(anew);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",newList)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		 
	}
	 
	
}
