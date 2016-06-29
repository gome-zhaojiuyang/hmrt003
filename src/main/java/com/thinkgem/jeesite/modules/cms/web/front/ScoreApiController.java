/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtscorelog.entity.HmrtScoreLog;
import com.thinkgem.jeesite.modules.hmrtscorelog.service.HmrtScoreLogService;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/scoreApi")
public class ScoreApiController extends BaseController{
	@Autowired
	private HmrtScoreLogService hmrtScoreLogService;
	/**
	 * 
	 * 根据用户id 获取积分日志 接口
	 */
	@RequestMapping(value="queryByUserid")
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
				return;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			HmrtScoreLog hmrtScoreLog = new HmrtScoreLog();
			hmrtScoreLog.setUserid(userid);
			Page<HmrtScoreLog> page = hmrtScoreLogService.findPage(new Page<HmrtScoreLog>(request,response), hmrtScoreLog);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",page)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", "")));
			return;
		}
		
	}
	
}