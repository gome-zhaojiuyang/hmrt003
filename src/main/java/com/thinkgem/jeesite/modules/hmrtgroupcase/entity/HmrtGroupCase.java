/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupcase.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 群聊对应病例Entity
 * @author zhuhb
 * @version 2016-06-30
 */
public class HmrtGroupCase extends DataEntity<HmrtGroupCase> {
	
	private static final long serialVersionUID = 1L;
	private String groupId;		// group_id
	private String groupname;		// groupname
	private String description;		// description
	private String owner;		// owner
	private String caseId;		// case_id
	
	public HmrtGroupCase() {
		super();
	}

	public HmrtGroupCase(String id){
		super(id);
	}

	@Length(min=1, max=32, message="group_id长度必须介于 1 和 32 之间")
	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	
	@Length(min=0, max=200, message="groupname长度必须介于 0 和 200 之间")
	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	
	@Length(min=0, max=200, message="description长度必须介于 0 和 200 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=0, max=100, message="owner长度必须介于 0 和 100 之间")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=255, message="case_id长度必须介于 0 和 255 之间")
	public String getCaseId() {
		return caseId;
	}

	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}
	
}