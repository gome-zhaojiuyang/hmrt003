/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.cms.utils.Md5;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/userApi")
public class UserApiController extends BaseController{
	/**
	 * 注册接口
	 */
	@RequestMapping(value="reg")
	public void reg(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("loginName"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,loginName不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("password"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,password不能为空！", "")));
			
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("name"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,name不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("level"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,level不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("hospital"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,hospital不能为空！", "")));
				return ;
			}
			
			String loginName 	= StringUtils.toString(request.getParameter("loginName"));
			String password 	= StringUtils.toString(request.getParameter("password"));
			String name 		= StringUtils.toString(request.getParameter("name"));
			String level 		= StringUtils.toString(request.getParameter("level"));
			String hospital 	= StringUtils.toString(request.getParameter("hospital"));
			
			String 	token 	= String.valueOf(Math.abs((int)new Date().getTime()));
			
			User user = new User();
			user.setLoginName(loginName);
			
			//判断是否已经注册过
			if(!systemService.validateUser(user)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,此用户已经被注册！", "")));
				return ;
			}
			
			password = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(password));
			
			// 角色数据有效性验证，过滤不在授权内的角色
			List<Role> roleList = Lists.newArrayList();
			Role role = new Role("6");
			roleList.add(role);
			user.setRoleList(roleList);
			
			
			user.setPassword(password);
			user.setName(name);
			user.setLevel(level);
			user.setHospital(hospital);
			user.setToken(token);
			user.setCreateDate(new Date());
			systemService.saveUser(user);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("token", token);
			map.put("easemobId", Md5.encrypt(loginName));
			map.put("easemobPassword", Md5.encrypt(password));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",map)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}

	/**
	 * 登录
	 */
	@RequestMapping(value="login")
	public void login(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("loginName"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,loginName不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("password"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,password不能为空！", "")));
				return ;
			}
			
			Date 	date 	= new Date(); 
			String 	token 	= String.valueOf(Math.abs((int)date.getTime()));
			String loginName 	= StringUtils.toString(request.getParameter("loginName"));
			String password 	= StringUtils.toString(request.getParameter("password"));
			password = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(password));
			
			
			User user = new User();
			user.setLoginName(loginName);
			user.setPassword(password);
			//验证用户名密码
			if(systemService.validateUser(user)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,此用户已经被注册！", "")));
				return ;
			}
//			List<User> userList = systemService.findUser(user);
//			if(userList ==null || userList.size()==0 || userList.size()>1){
//				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户名或者密码错误，请重新输入！", "")));
//				return ;
//			}
			
			User user_update = systemService.getUserByLoginName(loginName);
//			user_update.setId(userList.get(0).getId());
			user_update.setToken(token);
			systemService.updateUserInfo(user_update);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", user.getId());
			map.put("token", token);
			map.put("easemobId", Md5.encrypt(loginName));
			map.put("easemobPassword", Md5.encrypt(password));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",map)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	/**
	 * queryUserInfo
	 */
	@RequestMapping(value="queryUserInfo")
	public void queryUserInfo(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			 
			String token = StringUtils.toString(request.getParameter("token"));
			String loginName = StringUtils.toString(request.getParameter("loginName"));
			String password = StringUtils.toString(request.getParameter("password"));
			
			User user = new User();
			user.setToken(token);
			user.setLoginName(loginName);
			user.setPassword(password);
			List<User> userList = systemService.findUser(user);
			if(userList ==null || userList.size()==0 || userList.size()>1){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户名或者密码错误，请重新输入！", "")));
				return ;
			}
			user = userList.get(0);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",user)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	/**
	 * resetPwd
	 */
	@RequestMapping(value="resetPwd")
	public void resetPwd(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
//			String token = StringUtils.toString(request.getParameter("token"));
			String loginName = StringUtils.toString(request.getParameter("loginName"));
			String password = StringUtils.toString(request.getParameter("password"));
			password = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(password));
			
			String userid = StringUtils.toString(request.getParameter("userid"));
			if(StringUtils.isEmpty(request.getParameter("userid"))){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "userid不能为空！", "")));
				return ;
			}
			if(StringUtils.isEmpty(request.getParameter("passwordNew"))){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "新密码不能为空！", "")));
				return ;
			}
			String passwordNew = StringUtils.toString(request.getParameter("passwordNew"));
			passwordNew = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(passwordNew));
			String 	tokenNew	= String.valueOf(Math.abs((int)new Date().getTime()));
			
			User userUpdate = new User();
			userUpdate.setId(userid);
			userUpdate.setPassword(passwordNew);
			userUpdate.setToken(tokenNew);
			systemService.updateUserInfo(userUpdate);
			//更新环信密码
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", userid);
			map.put("token", tokenNew);
			map.put("easemobId", Md5.encrypt(loginName));
			map.put("easemobPassword", Md5.encrypt(passwordNew));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",map)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	/**
	 * updateUserInfo
	 */
	@RequestMapping(value="updateUserInfo")
	public void updateUserInfo(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			String userid = StringUtils.toString(request.getParameter("userid"));
			if(StringUtils.isEmpty(request.getParameter("userid"))){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "userid不能为空！", "")));
				return ;
			}
			String hospital = StringUtils.toString(request.getParameter("hospital"));
			String score = StringUtils.toString(request.getParameter("score"));
			String isturn = StringUtils.toString(request.getParameter("isturn"));
			String income = StringUtils.toString(request.getParameter("income"));
			 
			User user = new User();
			user.setId(userid);
			if(StringUtils.isNotEmpty(hospital)){
				user.setHospital(hospital);
			}
			if(StringUtils.isNotEmpty(score)){
				user.setScore(score);
			}
			if(StringUtils.isNotEmpty(isturn)){
				user.setIsturn(isturn);
			}
			if(StringUtils.isNotEmpty(income)){
				user.setIncome(income);
			}
			systemService.updateUserInfo(user);
			
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	/**
	 * 查找目标医生   = 专家级别的医生 level=E 
	 * level=C普通医生
	 * queryTargetDoctor
	 */
	@RequestMapping(value="queryTargetDoctor")
	public void queryTargetDoctor(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			User user = new User();
			user.setLevel("E");
			List<User> userList = systemService.findUser(user);
			List<Map<String,String>> userMapList = new ArrayList<Map<String,String>>();
			for(User u : userList){
				Map<String,String> userMap = new HashMap<String,String>();
				userMap.put("hospital", u.getHospital());
				userMap.put("name", u.getName());
				userMap.put("id", u.getId());
				userMapList.add(userMap);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",userMapList)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	
}
