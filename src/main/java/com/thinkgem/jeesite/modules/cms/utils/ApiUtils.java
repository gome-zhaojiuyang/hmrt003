package com.thinkgem.jeesite.modules.cms.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;

public class ApiUtils {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public static List<Map<String,String>> articleList2MapList(List<Article> list,ArticleDataService articleDataService ){
		List<Map<String,String>> articleMapList = new ArrayList<Map<String,String>>();
		for(Article article: list){
			Map<String,String> articleMap = new HashMap<String,String>();
			articleMap.put("title", article.getTitle());
//			articleMap.put("image", article.getImage());
//			articleMap.put("imageSrc", article.getImageSrc());
			articleMap.put("content", articleDataService.get(article.getId()).getContent());
//			articleMap.setCategory(article.getCategory());
			articleMap.put("id", article.getId());
			articleMapList.add(articleMap);
		}
		
		return articleMapList ;
	}
	public static Map<String,String> article2Map(Article article,ArticleDataService articleDataService ){
		Map<String,String> articleMap = Maps.newHashMap();
		articleMap.put("title", article.getTitle());
		articleMap.put("content", articleDataService.get(article.getId()).getContent());
		articleMap.put("id", article.getId());
		return articleMap ;
	}

}
