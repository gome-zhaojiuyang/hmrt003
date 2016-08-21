/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtpatient.entity.HmrtPatient;
import com.thinkgem.jeesite.modules.hmrtpatient.service.HmrtPatientService;
import com.thinkgem.jeesite.modules.sys.entity.User;

import jersey.repackaged.com.google.common.collect.Maps;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/patientApi")
public class PatientApiController extends BaseController{
	@Autowired
	private HmrtPatientService hmrtPatientService;
	/**
	 * 
	 * 保存患者信息
	 */
	@RequestMapping(value="save")
	public void save(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("userid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,userid不能为空！", "")));
				return ;
			}
			String id = StringUtils.toString(request.getParameter("id"));
			String userid = StringUtils.toString(request.getParameter("userid"));
			String name = StringUtils.toString(request.getParameter("name"));
			String sex = StringUtils.toString(request.getParameter("sex"));
			String birthday = StringUtils.toString(request.getParameter("birthday"));
			String age = StringUtils.toString(request.getParameter("age"));
			String mobile = StringUtils.toString(request.getParameter("mobile"));
			String idNumber = StringUtils.toString(request.getParameter("idNumber"));
			String visitDt = StringUtils.toString(request.getParameter("visitDt"));
			String department = StringUtils.toString(request.getParameter("department"));
			String snType1 = StringUtils.toString(request.getParameter("snType1"));
			String snNo1 = StringUtils.toString(request.getParameter("snNo1"));
			String snType2 = StringUtils.toString(request.getParameter("snType2"));
			String snNo2 = StringUtils.toString(request.getParameter("snNo2"));
			String phone = StringUtils.toString(request.getParameter("phone"));
			String email = StringUtils.toString(request.getParameter("email"));
			String address = StringUtils.toString(request.getParameter("address"));
			String profession = StringUtils.toString(request.getParameter("profession"));
			String contact = StringUtils.toString(request.getParameter("contact"));
			String introduce = StringUtils.toString(request.getParameter("introduce"));
			String remark = StringUtils.toString(request.getParameter("remark"));
			
			
			User user = (User)request.getAttribute("user");
			
			//保存 
			HmrtPatient hmrtPatient = new HmrtPatient() ;
			if(!"".equals(id)){
				hmrtPatient.setId(id);
			}
			hmrtPatient.setUserid(userid);
			hmrtPatient.setAddress(address);
			hmrtPatient.setAge(age);
			hmrtPatient.setBirthday(DateUtils.parseDate(birthday));
			hmrtPatient.setContact(contact);
			hmrtPatient.setCreateDate(new Date());
			hmrtPatient.setCreateDt(new Date());
			hmrtPatient.setCurrentUser(user);
			hmrtPatient.setDepartment(department);
			hmrtPatient.setEmail(email);
			hmrtPatient.setIdNumber(idNumber);
			hmrtPatient.setIntroduce(introduce);
			hmrtPatient.setMobile(mobile);
			hmrtPatient.setName(name);
			hmrtPatient.setPhone(phone);
			hmrtPatient.setProfession(profession);
			hmrtPatient.setRemark(remark);
			hmrtPatient.setSex(sex);
			hmrtPatient.setVisitDt(DateUtils.parseDate(visitDt));
			hmrtPatient.setSnType1(snType1);
			hmrtPatient.setSnNo1(snNo1);
			hmrtPatient.setSnType2(snType2);
			hmrtPatient.setSnNo2(snNo2);
			hmrtPatientService.save(hmrtPatient);
			Map map = Maps.newHashMap();
			map.put("id", hmrtPatient.getId());
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",map)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 查询患者信息
	 */
	@RequestMapping(value="queryById")
	public void queryById(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("id"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,id不能为空！", "")));
				return ;
			}
			String id = StringUtils.toString(request.getParameter("id"));
			HmrtPatient hmrtPatient = new HmrtPatient() ;
			hmrtPatient.setId(id);
			List<HmrtPatient> list = hmrtPatientService.findList(hmrtPatient);
			if(list!=null && list.size()==1){
				hmrtPatient = list.get(0);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200,"",hmrtPatient)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	
}
