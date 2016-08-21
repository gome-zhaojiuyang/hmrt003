/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtupload.entity.HmrtUpload;
import com.thinkgem.jeesite.modules.hmrtupload.service.HmrtUploadService;

/**
 * 网站Controller
 * 
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}/uploadApi")
public class UploadApiController extends BaseController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private HmrtUploadService hmrtUploadService;
	/**
	 * http://blog.csdn.net/h7870181/article/details/19971557
	 * 上传图片
	 */
	@RequestMapping(value = "uploadImages")
	public void queryActivityList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
//			//病例表 Article
//			Article caseinfo = new Article();
//			caseinfo.setCategory(new Category("a1699b0aedce4cdb9c0551d4b36568b0"));
//			caseinfo.setDelFlag(Article.DEL_FLAG_NORMAL);
//			//caseinfo.setIsarchive("1");//0普通病例 1归档病例 属于病例库
//			List<Article> list = articleService.findList(caseinfo);
			//获取存储路径  
//		    HttpServletRequest request = ServletActionContext.getRequest();  
			if (StringUtils.isEmpty(request.getParameter("caseid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,caseid不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("title"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,title不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("imgNames"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,imgNames不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("imgPaths"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,imgPaths不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("type"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,type不能为空！", "")));
				return ;
			}
			String type = request.getParameter("type") ;// 010图片  020文字
			String imgNames = request.getParameter("imgNames") ;
			String imgPaths = request.getParameter("imgPaths") ;
			if("010".equals(type)){
				if(imgNames.split(",").length!=imgPaths.split(",").length){
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,图片名称和路径个数不匹配不能为空！", "")));
					return ;
				}
			}if("020".equals(type)){
				if (StringUtils.isEmpty(request.getParameter("desc"))) {
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,desc不能为空！", "")));
					return ;
				}
			}
			
			
			String projectPath = "upload";
		    String path = Global.getConfig("webroot.basedir") +File.separator+projectPath; 
		    System.out.println("upload>>>path"+path);
		    File file = new File(path);  
		    if(!file.exists()){  
		        file.mkdir();  
		    }  
		    String visitPath = Global.getConfig("cas.project.url") + File.separator + projectPath + File.separator +request.getParameter("imgName");
		    String imgPath  = path + File.separator + request.getParameter("imgName");  
		    System.out.println("imgPath"+imgPath);
		    System.out.println("visitPath"+visitPath);
		    String imgStr = request.getParameter("imgStr");  
		    boolean flag = string2Image(imgStr, imgPath); 
		    HmrtUpload hmrtUpload = new HmrtUpload();
		    hmrtUpload.setUserid(request.getParameter("userid"));
		    hmrtUpload.setCaseid(request.getParameter("caseid"));
		    hmrtUpload.setPath(visitPath);
		    hmrtUpload.setRemark(request.getParameter("imgName"));
		    
		    hmrtUploadService.save(hmrtUpload);
//		    JacksonUtil.responseJSON(response, flag);  
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", hmrtUpload)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/** 
	 * 通过BASE64Decoder解码，并生成图片 
	 * @param imgStr 解码后的string 
	 */  
	public boolean string2Image(String imgStr, String imgFilePath) {  
	    // 对字节数组字符串进行Base64解码并生成图片  
	    if (imgStr == null)  
	        return false;  
	    try {  
	        // Base64解码  
	        byte[] b = new sun.misc.BASE64Decoder().decodeBuffer(imgStr);  
	        for (int i = 0; i < b.length; ++i) {  
	            if (b[i] < 0) {  
	                // 调整异常数据  
	                b[i] += 256;  
	            }  
	        }  
	        // 生成Jpeg图片  
	        OutputStream out = new FileOutputStream(imgFilePath);  
	        out.write(b);  
	        out.flush();  
	        out.close();  
	        return true;  
	    } catch (Exception e) {  
	        return false;  
	    }  
	}     

}
