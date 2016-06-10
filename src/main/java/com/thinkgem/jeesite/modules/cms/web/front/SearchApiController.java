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
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/searchApi")
public class SearchApiController extends BaseController{
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	/**
	 * 
	 * 检索接口
	 */
	@RequestMapping(value="queryInfoByKeyWord")
	public void queryInfoByKeyWord(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			Article article = new Article();
			//可以考虑作为入参获取 分类信息下内容
			if (StringUtils.isEmpty(request.getParameter("keyword"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,keyword不能为空！", "")));
				return;
			}
			String keyword =StringUtils.replaceHtml( StringUtils.toString(request.getParameter("keyword") ));
			
			article.setTitle(keyword);
//			article.setCategory(new Category(categoryId));//引导页分类ID
			List<Article> list = articleService.findList(article);
			
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",ApiUtils.articleList2MapList(list, articleDataService))));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	
}
