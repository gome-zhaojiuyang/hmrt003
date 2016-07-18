package com.thinkgem.jeesite.modules.cms.utils;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.DateUtils;

public class Entity2Map<T> {
	public Map entity2map(T t){
		Map newMap = Maps.newHashMap();
		Map map = Maps.newHashMap();
		try {
			map  = BeanUtils.describe(t);
			
			if(map.get("url")!=null&&!"null".equals(map.get("url"))&&!"".equals(map.get("url"))){
				String url = "http://120.26.241.215:8181"+(String)map.get("url");
				map.put("url", url);
			}
			if(map.get("imageSrc")!=null&&!"null".equals(map.get("imageSrc"))&&!"".equals(map.get("imageSrc"))){
				String imageSrc = "http://120.26.241.215:8181"+(String)map.get("imageSrc");
				map.put("imageSrc", imageSrc);
			}
			if(map.get("createDate")!=null&&!"null".equals(map.get("createDate"))&&!"".equals(map.get("createDate"))){
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK);
				Date createDate = new Date();
				try {
					createDate = sdf.parse((String) map.get("createDate"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				Date createDate = DateUtils.parseDate(map.get("createDate"));
				String createDate1= DateUtils.formatDate(createDate, "yyyy-MM-dd");
				String createDate2= DateUtils.formatDate(createDate, "HH:mm");
				String createDate3= DateUtils.formatDate(createDate, "yyyy-MM-dd HH:mm:ss");
				map.put("createDate1", createDate1);
				map.put("createDate2", createDate2);
				map.put("createDate3", createDate3);
				map.remove("createDate");
				map.remove("url");
			}
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
//			map.remove("createDate");
			map.remove("newPassword");
			
			map.remove("category");
			map.remove("posidList");
			map.remove("posid");
			map.remove("keywords");
			map.remove("image");
			Iterator it = map.keySet().iterator();
			while(it.hasNext()){
				Object key = (Object)it.next();
				Object value = map.get(key);
				if(value!=null&&!"".equals(String.valueOf(value))){
					newMap.put(key, value);
				}
			}
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
		
		return newMap;
	}
}
