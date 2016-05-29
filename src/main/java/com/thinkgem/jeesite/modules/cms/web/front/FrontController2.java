/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/apitest")
public class FrontController2 extends BaseController{
	 
	
	/**
	 * 网站首页
	 */
	@RequestMapping
	public void index(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (StringUtils.isEmpty(request.getParameter("cityId"))) {
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,cityId不能为空！", "")));
//				return;
//			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", "测试数据OK")));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		 
	}
	 
	
}
