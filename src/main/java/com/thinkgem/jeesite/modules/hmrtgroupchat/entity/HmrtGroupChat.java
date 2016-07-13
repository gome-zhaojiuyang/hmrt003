/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.hmrtgroupchat.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 讨论聊天内容备份Entity
 * @author zhuhb
 * @version 2016-07-12
 */
public class HmrtGroupChat extends DataEntity<HmrtGroupChat> {
	
	private static final long serialVersionUID = 1L;
	private String to;		// 讨论组
	private String from;		// 来自
	private String chattype;		// 类型
	private String msg;		// 消息内容
	private String type;		// 消息类型
	private String length;		// 消息长度
	private String url;		// url
	private String filename;		// 文件名字
	private String secret;		// secret
	private String lat;		// 纬度
	private String lng;		// 精度
	private String addr;		// 地址
	private Long timestamp;		// timestamp
	
	public HmrtGroupChat() {
		super();
	}

	public HmrtGroupChat(String id){
		super(id);
	}

	@Length(min=0, max=32, message="讨论组长度必须介于 0 和 32 之间")
	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
	
	@Length(min=0, max=32, message="来自长度必须介于 0 和 32 之间")
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}
	
	@Length(min=0, max=10, message="类型长度必须介于 0 和 10 之间")
	public String getChattype() {
		return chattype;
	}

	public void setChattype(String chattype) {
		this.chattype = chattype;
	}
	
	@Length(min=0, max=2000, message="消息内容长度必须介于 0 和 2000 之间")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@Length(min=0, max=10, message="消息类型长度必须介于 0 和 10 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="消息长度长度必须介于 0 和 100 之间")
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}
	
	@Length(min=0, max=200, message="url长度必须介于 0 和 200 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=50, message="文件名字长度必须介于 0 和 50 之间")
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Length(min=0, max=200, message="secret长度必须介于 0 和 200 之间")
	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}
	
	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
	
	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public Long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}
	
}