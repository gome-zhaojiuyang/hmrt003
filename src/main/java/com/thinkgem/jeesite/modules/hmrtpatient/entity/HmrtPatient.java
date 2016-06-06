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
 * @version 2016-06-06
 */
public class HmrtPatient extends DataEntity<HmrtPatient> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// userid
	private String name;		// name
	private String sex;		// sex
	private Date birthday;		// birthday
	private String age;		// age
	private String mobile;		// mobile
	private String idNumber;		// id_number
	private Date visitDt;		// visit_dt
	private String department;		// department
	private String snType1;		// sn_type1
	private String snNo1;		// sn_no1
	private String snType2;		// sn_type2
	private String snNo2;		// sn_no2
	private String phone;		// phone
	private String email;		// email
	private String address;		// address
	private String profession;		// profession
	private String contact;		// contact
	private String introduce;		// introduce
	private String remark;		// remark
	private Date createDt;		// create_dt
	
	public HmrtPatient() {
		super();
	}

	public HmrtPatient(String id){
		super(id);
	}

	@Length(min=0, max=64, message="userid长度必须介于 0 和 64 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=0, max=128, message="name长度必须介于 0 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="sex长度必须介于 0 和 1 之间")
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
	
	@Length(min=0, max=11, message="age长度必须介于 0 和 11 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(min=0, max=32, message="mobile长度必须介于 0 和 32 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=32, message="id_number长度必须介于 0 和 32 之间")
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
	
	@Length(min=0, max=128, message="department长度必须介于 0 和 128 之间")
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	@Length(min=0, max=64, message="sn_type1长度必须介于 0 和 64 之间")
	public String getSnType1() {
		return snType1;
	}

	public void setSnType1(String snType1) {
		this.snType1 = snType1;
	}
	
	@Length(min=0, max=64, message="sn_no1长度必须介于 0 和 64 之间")
	public String getSnNo1() {
		return snNo1;
	}

	public void setSnNo1(String snNo1) {
		this.snNo1 = snNo1;
	}
	
	@Length(min=0, max=64, message="sn_type2长度必须介于 0 和 64 之间")
	public String getSnType2() {
		return snType2;
	}

	public void setSnType2(String snType2) {
		this.snType2 = snType2;
	}
	
	@Length(min=0, max=64, message="sn_no2长度必须介于 0 和 64 之间")
	public String getSnNo2() {
		return snNo2;
	}

	public void setSnNo2(String snNo2) {
		this.snNo2 = snNo2;
	}
	
	@Length(min=0, max=64, message="phone长度必须介于 0 和 64 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=128, message="email长度必须介于 0 和 128 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=512, message="address长度必须介于 0 和 512 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=64, message="profession长度必须介于 0 和 64 之间")
	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}
	
	@Length(min=0, max=64, message="contact长度必须介于 0 和 64 之间")
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Length(min=0, max=64, message="introduce长度必须介于 0 和 64 之间")
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	@Length(min=0, max=512, message="remark长度必须介于 0 和 512 之间")
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