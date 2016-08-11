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

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.service.HuanXinService;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.Entity2Map;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.cms.utils.Md5;
import com.thinkgem.jeesite.modules.cms.utils.RandomNum;
import com.thinkgem.jeesite.modules.cms.utils.huanxin.Constants;
import com.thinkgem.jeesite.modules.cms.utils.yunzhixun.SmsTemplat;
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
			
			String loginName 	= StringUtils.toString(request.getParameter("loginName"));
			String password 	= StringUtils.toString(request.getParameter("password"));
			String name = StringUtils.toString(request.getParameter("name"));
			String vcode = StringUtils.toString(request.getParameter("vcode"));
			//这是邀请码  备用
			String inviteCode = StringUtils.toString(request.getParameter("inviteCode")); 
			String cacheCode = RandomNum.USERMAP.get(loginName);
			if(cacheCode!=null){
				String [] code = cacheCode.split("_");
				if(!vcode.equals(code[0])){
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "验证码错误,请重新输入！", "")));
					return ;
				}
			}
			
			
			String 	token 	= String.valueOf(Math.abs((int)new Date().getTime()));
			User user = new User();
			user.setLoginName(loginName);
			
			//判断是否已经注册过
			if(!systemService.validateUser(user)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,此用户已经被注册！", "")));
				return ;
			}
			
			ObjectNode datanode = JsonNodeFactory.instance.objectNode();
		    datanode.put("username",loginName);
		    datanode.put("password", password);
		    datanode.put("nickname", name);
		    ObjectNode createNewIMUserSingleNode = HuanXinService.createNewIMUserSingle(datanode);
		    if (null != createNewIMUserSingleNode) {
		    	logger.info("注册IM用户[单个]: " + createNewIMUserSingleNode.toString());
		    	if(createNewIMUserSingleNode.get("statusCode").toString().equals("200")){
		    		logger.info("用户名："+loginName+" 注册成功");
		    		JsonNode jsonnode=createNewIMUserSingleNode.get("entities");
		    		JsonNode json=jsonnode.get(0).get("uuid");
		    		user.setOpenid(json.asText());
			    }else{
			    	outputJson(response, JsonUtil.beanToJson(putResponseData(401, "注册失败！请重新注册", "")));
			    	return;
			    }
		    }
			
			password = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(password));
			
			// 角色数据有效性验证，过滤不在授权内的角色
			List<Role> roleList = Lists.newArrayList();
			Role role = new Role("6");
			roleList.add(role);
			user.setRoleList(roleList);
			user.setPassword(password);
			user.setName(name);
			user.setToken(token);
			user.setCreateDate(new Date());
			systemService.saveUser(user);
			
			scoreRuleTrigger(user,request);
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("token", token);
//			map.put("easemobId", Md5.encrypt(loginName));
//			map.put("easemobPassword", Md5.encrypt(password));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",user)));
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
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户不存在，账号密码错误！", "")));
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
			
			
//			request.setAttribute("userid", user.getId());
			scoreRuleTrigger(user_update,request);
//			user.setToken(token);
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("userid", user.getId());
//			map.put("token", token);
//			map.put("easemobId", Md5.encrypt(loginName));
//			map.put("easemobPassword", Md5.encrypt(password));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",user_update)));
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
			 
			String targetUserid = StringUtils.toString(request.getParameter("targetUserid"));
			User user = systemService.getUser(targetUserid);
			if(user ==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户名或者密码错误，请重新输入！", "")));
				return ;
			}
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
			String huanxinnewpassword =  StringUtils.toString(request.getParameter("passwordNew"));
			passwordNew = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(passwordNew));
			String 	tokenNew	= String.valueOf(Math.abs((int)new Date().getTime()));
			
			User userUpdate = new User();
			userUpdate.setId(userid);
			userUpdate.setPassword(passwordNew);
			userUpdate.setToken(tokenNew);
			//更新环信密码
		     ObjectNode json2 = JsonNodeFactory.instance.objectNode();
		     json2.put("newpassword", huanxinnewpassword);
		     ObjectNode modifyIMUserPasswordWithAdminTokenNode = HuanXinService.modifyIMUserPasswordWithAdminToken(loginName, json2);
		     if (null != modifyIMUserPasswordWithAdminTokenNode&&modifyIMUserPasswordWithAdminTokenNode.get("statusCode").toString().equals("200")) {
		    	 logger.info("重置IM用户密码成功 " + modifyIMUserPasswordWithAdminTokenNode.toString());
		     }else{
		    	 outputJson(response, JsonUtil.beanToJson(putResponseData(401, "重置密码失败，请重新操作！", "")));
		    	 return;
		     }
			systemService.updateUserInfo(userUpdate);
			
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("userid", userid);
//			map.put("token", tokenNew);
//			map.put("easemobId", Md5.encrypt(loginName));
//			map.put("easemobPassword", Md5.encrypt(passwordNew));
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",userUpdate)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	
	/**
	 * findPwd
	 */
	@RequestMapping(value="findPwd")
	public void findPwd(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
//			if (!validateToken(request, response)) {
//				return;
//			}
//			String token = StringUtils.toString(request.getParameter("token"));
			String loginName = StringUtils.toString(request.getParameter("loginName"));
			String passwordNew = StringUtils.toString(request.getParameter("passwordNew"));
			String vcode = StringUtils.toString(request.getParameter("vcode"));
			
			if(StringUtils.isEmpty(loginName)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "登录账号不能为空！", "")));
				return ;
			}
			if(StringUtils.isEmpty(passwordNew)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "新密码不能为空！", "")));
				return ;
			}
			String cacheCode = RandomNum.USERMAP.get(loginName);
			if(StringUtils.isEmpty(cacheCode)){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请先发送手机验证码", "")));
				return ;
			}
			String [] code = cacheCode.split("_");
			if(!vcode.equals(code[0])){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "验证码错误,请重新输入！", "")));
				return ;
			}
			
			String huanxinnewpassword =  StringUtils.toString(request.getParameter("passwordNew"));
			passwordNew = Md5.encrypt(ConstantsConfig.USER_SALT+Md5.encrypt(passwordNew));
			String 	tokenNew	= String.valueOf(Math.abs((int)new Date().getTime()));
			
			User userUpdate = systemService.getUserByLoginName(loginName);
			if(userUpdate==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户不存在,请输入正确手机号！", "")));
				return ;
			}
			userUpdate.setPassword(passwordNew);
			userUpdate.setToken(tokenNew);
			//更新环信密码
		     ObjectNode json2 = JsonNodeFactory.instance.objectNode();
		     json2.put("newpassword", huanxinnewpassword);
		     ObjectNode modifyIMUserPasswordWithAdminTokenNode = HuanXinService.modifyIMUserPasswordWithAdminToken(loginName, json2);
		     if (null != modifyIMUserPasswordWithAdminTokenNode&&modifyIMUserPasswordWithAdminTokenNode.get("statusCode").toString().equals("200")) {
		    	 logger.info("重置IM用户密码成功 " + modifyIMUserPasswordWithAdminTokenNode.toString());
		     }else{
		    	 outputJson(response, JsonUtil.beanToJson(putResponseData(401, "修改密码失败，请重新操作！", "")));
		    	 return;
		     }
			systemService.updatePasswordById(userUpdate.getId(), userUpdate.getLoginName(), passwordNew);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",userUpdate)));
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
			String dept = StringUtils.toString(request.getParameter("dept"));
			String cert = StringUtils.toString(request.getParameter("cert"));
			String prof = StringUtils.toString(request.getParameter("prof"));
			String name = StringUtils.toString(request.getParameter("name"));
			 
			User user =(User) request.getAttribute("user");
			if(user==null){
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户信息异常！", "")));
				return ;
			}
			user.setId(userid);
			if(StringUtils.isNotEmpty(hospital)){
				user.setHospital(hospital);
			}
			if(StringUtils.isNotEmpty(hospital)){
				user.setName(name);
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
			if(StringUtils.isNotEmpty(dept)){
				user.setDept(dept);
			}
			if(StringUtils.isNotEmpty(cert)){
				user.setCert(cert);
			}
			if(StringUtils.isNotEmpty(prof)){
				user.setProf(prof);
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
			String name = StringUtils.toString(request.getParameter("name"));
			User user = new User();
			user.setLevel("E");
			if(StringUtils.isNotEmpty(name)){
				user.setName(name);
			}
			List<User> userList = systemService.findUser(user);
//			List<Map<String,String>> userMapList = new ArrayList<Map<String,String>>();
//			for(User u : userList){
//				Map<String,String> userMap = new HashMap<String,String>();
//				userMap.put("hospital", u.getHospital());
//				userMap.put("name", u.getName());
//				userMap.put("id", u.getId());
//				userMapList.add(userMap);
//			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",userList)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	
	/**
	 * code
	 */
	@RequestMapping(value="getCode")
	public void getCode(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			String loginName = StringUtils.toString(request.getParameter("loginName"));
			String flag = StringUtils.toString(request.getParameter("flag"));
			
			User user = new User();
			user.setLoginName(loginName);
			if("1".equals(flag)){
				//注册判断是否已经注册过
				if(!systemService.validateUser(user)){
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "此用户已经被注册！", "")));
					return ;
				}
			}else{
				//找回密码判断是否已经注册过
				if(systemService.validateUser(user)){
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "用户不存在！", "")));
					return ;
				}
			}
			
			
			//Map map = new HashMap();
			if(RandomNum.USERMAP.get(loginName) == null||"".equals(RandomNum.USERMAP.get(loginName))){
				String code = RandomNum.NextInt(100000,999999)+"";
				String cacheCode = code+"_"+new Date().getTime();
				//map.put("code", code);
				//map.put("message", "请把验证码填到验证码框内");
				RandomNum.USERMAP.put(loginName, cacheCode);
				System.out.println("手机验证码："+code);
				if("1".equals(flag)||"2".equals(flag)){
					SmsTemplat.templateSMS("25808", loginName, code);
				}
			}else{
				//map.put("code", RandomNum.USERMAP.get(loginName));
				//map.put("message", "请把验证码填到验证码框内");
				String cacheCode = RandomNum.USERMAP.get(loginName);
				String [] code = cacheCode.split("_");
				System.out.println("手机验证码："+code[0]);
				if("1".equals(flag)||"2".equals(flag)){
					SmsTemplat.templateSMS("25808", loginName, code[0]);
				}
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"")));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		 
	}
	
}
