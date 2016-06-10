package com.thinkgem.jeesite.modules.cms.utils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.google.common.collect.Maps;

public class Entity2Map<T> {
	public Map entity2map(T t){
		Map map = Maps.newHashMap();
		try {
			map  = BeanUtils.describe(t);
			map.remove("page");
			map.remove("class");
			map.remove("global");
			map.remove("dbName");
			map.remove("sqlMap");
			map.remove("roleIdList");
			map.remove("roleList");
			map.remove("role");
			map.remove("roleNames");
			map.remove("userType");
			map.remove("oldLoginDate");
			map.remove("currentUser");
			map.remove("company");
			map.remove("delFlag");
			map.remove("oldLoginName");
			map.remove("loginFlag");
			map.remove("oldLoginIp");
			map.remove("password");
			map.remove("updateBy");
			map.remove("isNewRecord");
			map.remove("createBy");
			map.remove("updateBy");
			map.remove("updateDate");
			map.remove("loginDate");
			map.remove("office");
			map.remove("loginIp");
			map.remove("admin");
			map.remove("createDate");
			map.remove("newPassword");
			
			map.remove("category");
			map.remove("posidList");
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		return map;
	}
}
