/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.web;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.validation.Validator;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.cms.utils.Md5;
import com.thinkgem.jeesite.modules.cms.utils.ResponseData;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 控制器支持类
 * @author ThinkGem
 * @version 2013-3-23
 */
public abstract class BaseController {
	@Autowired
	protected SystemService systemService;

	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 管理基础路径
	 */
	@Value("${adminPath}")
	protected String adminPath;
	
	/**
	 * 前端基础路径
	 */
	@Value("${frontPath}")
	protected String frontPath;
	
	/**
	 * 前端URL后缀
	 */
	@Value("${urlSuffix}")
	protected String urlSuffix;
	
	/**
	 * 验证Bean实例对象
	 */
	@Autowired
	protected Validator validator;

	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 message 中
	 */
	protected boolean beanValidator(Model model, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(model, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 flash message 中
	 */
	protected boolean beanValidator(RedirectAttributes redirectAttributes, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(redirectAttributes, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组，不传入此参数时，同@Valid注解验证
	 * @return 验证成功：继续执行；验证失败：抛出异常跳转400页面。
	 */
	protected void beanValidator(Object object, Class<?>... groups) {
		BeanValidators.validateWithException(validator, object, groups);
	}
	
	/**
	 * 添加Model消息
	 * @param message
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		model.addAttribute("message", sb.toString());
	}
	
	/**
	 * 添加Flash消息
	 * @param message
	 */
	protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}
	
	/**
	 * 客户端返回JSON字符串
	 * @param response
	 * @param object
	 * @return
	 */
	protected String renderString(HttpServletResponse response, Object object) {
		return renderString(response, JsonMapper.toJsonString(object), "application/json");
	}
	
	/**
	 * 客户端返回字符串
	 * @param response
	 * @param string
	 * @return
	 */
	protected String renderString(HttpServletResponse response, String string, String type) {
		try {
			response.reset();
	        response.setContentType(type);
	        response.setCharacterEncoding("utf-8");
			response.getWriter().print(string);
			return null;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * 参数绑定异常
	 */
	@ExceptionHandler({BindException.class, ConstraintViolationException.class, ValidationException.class})
    public String bindException() {  
        return "error/400";
    }
	
	/**
	 * 授权登录异常
	 */
	@ExceptionHandler({AuthenticationException.class})
    public String authenticationException() {  
        return "error/403";
    }
	
	/**
	 * 初始化数据绑定
	 * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
	 * 2. 将字段中Date类型转换为String类型
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? DateUtils.formatDateTime((Date)value) : "";
//			}
		});
	}
	
	
	protected void outputJson(HttpServletResponse response, String result) throws Exception {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
	}

	protected boolean validate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(true){
			return true;
		}
		int code = validate(request);
		if (code == -1) {
			outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求的公共参数不能为空！")));
			return false;
		} else if (code == 0) {
			outputJson(response, JsonUtil.beanToJson(putResponseData(400, "请求非法！")));
			return false;
		}

		return true;
	}
	protected boolean validateToken(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(true){
			return true;
		}
		if (StringUtils.isEmpty(request.getParameter("loginName"))) {
			outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,loginName不能为空！", "")));
			return false;
		}
		if (StringUtils.isEmpty(request.getParameter("token"))) {
			outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,token不能为空！", "")));
			return false;
		}
		String token = StringUtils.toString(request.getParameter("token"));
		String loginName = StringUtils.toString(request.getParameter("loginName"));
		
		User user = new User();
		user.setToken(token);
		user.setLoginName(loginName);
		List<User> userList = systemService.findUser(user);
		if(userList==null ||  userList.size()==0){
			outputJson(response, JsonUtil.beanToJson(putResponseData(401, "token错误，请重新登录！")));
			return false;
		}
		return true;
	}

	protected int validate(HttpServletRequest request) throws Exception {
		if (StringUtils.isEmpty(request.getParameter("key")) || StringUtils.isEmpty(request.getParameter("sign")) || StringUtils.isEmpty(request.getParameter("t"))) {
			return -1;
		}
		String key = StringUtils.toString(request.getParameter("key"));
		String sign = StringUtils.toString(request.getParameter("sign"));
		String t = StringUtils.toString(request.getParameter("t"));
		String md5 = Md5.encrypt(key + t + ConstantsConfig.SECRET_KEY);
		if (!md5.equals(sign)) {
			return 0;
		}

		return 1;
	}
	
	protected ResponseData putResponseData(int code, String msg, Object object) throws Exception {
		SerializeConfig mapping = new SerializeConfig(); 
        mapping.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd")); 
        System.out.println("object>>>>"+object); 
        //DisableCircularReferenceDetect来禁止循环引用检测：
        SerializerFeature feature = SerializerFeature.DisableCircularReferenceDetect;  
        String strObj =  JSON.toJSONString(object, mapping,feature); 
        
//        String strObj = JSON.toJSONString(object, mapping,SerializerFeature.DisableCircularReferenceDetect); 
        System.out.println("strObj>>>>"+strObj); 
		ResponseData responseData = new ResponseData();
		responseData.setCode(code);
		responseData.setMsg(msg);
		responseData.setData(strObj);
		return responseData;
	}
	protected ResponseData putResponseData(int code, String msg) throws Exception {
		ResponseData responseData = new ResponseData();
		responseData.setCode(code);
		responseData.setMsg(msg);
//		responseData.setData(object);
		return responseData;
	}
	
}
