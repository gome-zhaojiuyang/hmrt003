/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtpatient.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 患者信息维护Entity
 * @author 赵九扬
 * @version 2016-06-18
 */
public class HmrtPatient extends DataEntity<HmrtPatient> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户ID
	private String name;		// 姓名
	private String sex;		// 性别
	private Date birthday;		// 生日
	private String age;		// 年龄
	private String mobile;		// 手机号
	private String idNumber;		// 身份证号
	private Date visitDt;		// 就诊日期
	private String department;		// 部门
	private String snType1;		// 编号类型1
	private String snNo1;		// 编号1
	private String snType2;		// 编号类型2
	private String snNo2;		// 编号2
	private String phone;		// 固定电话
	private String email;		// 邮箱
	private String address;		// 患者地址
	private String profession;		// 患者职业
	private String contact;		// 患者联系人
	private String introduce;		// 介绍人
	private String remark;		// 备注
	private Date createDt;		// 创建日期
	
	public HmrtPatient() {
		super();
	}

	public HmrtPatient(String id){
		super(id);
	}

	@Length(min=0, max=64, message="用户ID长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=128, message="姓名长度必须介于 0 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=11, message="年龄长度必须介于 0 和 11 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(min=0, max=32, message="手机号长度必须介于 0 和 32 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=32, message="身份证号长度必须介于 0 和 32 之间")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getVisitDt() {
		return visitDt;
	}

	public void setVisitDt(Date visitDt) {
		this.visitDt = visitDt;
	}
	
	@Length(min=0, max=128, message="部门长度必须介于 0 和 128 之间")
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	@Length(min=0, max=64, message="编号类型1长度必须介于 0 和 64 之间")
	public String getSnType1() {
		return snType1;
	}

	public void setSnType1(String snType1) {
		this.snType1 = snType1;
	}
	
	@Length(min=0, max=64, message="编号1长度必须介于 0 和 64 之间")
	public String getSnNo1() {
		return snNo1;
	}

	public void setSnNo1(String snNo1) {
		this.snNo1 = snNo1;
	}
	
	@Length(min=0, max=64, message="编号类型2长度必须介于 0 和 64 之间")
	public String getSnType2() {
		return snType2;
	}

	public void setSnType2(String snType2) {
		this.snType2 = snType2;
	}
	
	@Length(min=0, max=64, message="编号2长度必须介于 0 和 64 之间")
	public String getSnNo2() {
		return snNo2;
	}

	public void setSnNo2(String snNo2) {
		this.snNo2 = snNo2;
	}
	
	@Length(min=0, max=64, message="固定电话长度必须介于 0 和 64 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=128, message="邮箱长度必须介于 0 和 128 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=512, message="患者地址长度必须介于 0 和 512 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=64, message="患者职业长度必须介于 0 和 64 之间")
	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}
	
	@Length(min=0, max=64, message="患者联系人长度必须介于 0 和 64 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=64, message="介绍人长度必须介于 0 和 64 之间")
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	@Length(min=0, max=512, message="备注长度必须介于 0 和 512 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}
	
}