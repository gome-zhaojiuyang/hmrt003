/*
 * Created on 2012-05-04 19:39:00
 *
 */
package com.thinkgem.jeesite.modules.cms.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.map.type.TypeFactory;



/**
 * @author Liyiwei
 * 
 */
public class JsonUtil {
	private static final ObjectMapper objectMapper = new ObjectMapper();

	public static <T> T jsonToBean(String json, Class<T> beanClass) throws Exception {
		return objectMapper.readValue(json, beanClass);
	}

	public static String beanToJson(Object object) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Inclusion.NON_EMPTY);  
		return mapper.writeValueAsString(object);
//		return objectMapper.writeValueAsString(object);

	}

	@SuppressWarnings("deprecation")
	public static <T> List<T> jsonToListBean(String json, Class<T> beanClass) throws Exception {
		return objectMapper.readValue(json, TypeFactory.collectionType(ArrayList.class, beanClass));
	}

	public static String toJson(String key, boolean value) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(key, value);
			return beanToJson(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public static String toJson(String key, String value) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put(key, value);
			return beanToJson(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public static String toJson(String key1, boolean value1, String key2, String value2) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(key1, value1);
			map.put(key2, value2);
			return beanToJson(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	public static String toJson(String key1, String value1, String key2, String value2) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(key1, value1);
			map.put(key2, value2);
			return beanToJson(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}