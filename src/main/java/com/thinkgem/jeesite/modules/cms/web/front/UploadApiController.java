/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.utils.ConstantsConfig;
import com.thinkgem.jeesite.modules.cms.utils.JsonUtil;
import com.thinkgem.jeesite.modules.hmrtupload.entity.HmrtUpload;
import com.thinkgem.jeesite.modules.hmrtupload.service.HmrtUploadService;
import com.thoughtworks.xstream.core.ReferenceByIdMarshaller.IDGenerator;

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
	public void uploadImages(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			//获取存储路径  
			if (StringUtils.isEmpty(request.getParameter("caseid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,caseid不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("title"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,title不能为空！", "")));
				return ;
			}
			if (StringUtils.isEmpty(request.getParameter("type"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,type不能为空！", "")));
				return ;
			}
			String userid = request.getParameter("userid") ;// 
			String caseid = request.getParameter("caseid") ;// 
			String title = request.getParameter("title") ;// 
			String type = request.getParameter("type") ;// 010图片  020文字
			
			if("010".equals(type)){
				if (StringUtils.isEmpty(request.getParameter("imgNames"))) {
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,imgNames不能为空！", "")));
					return ;
				}
				if (StringUtils.isEmpty(request.getParameter("imgStrs"))) {
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,imgStrs不能为空！", "")));
					return ;
				}
				String imgNames = request.getParameter("imgNames") ;
				String imgStrs = request.getParameter("imgStrs") ;
				if(imgNames.split(",").length!=imgStrs.split(",").length){
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,图片名称和图片字符流个数不匹配不能为空！", "")));
					return ;
				}
				
				String[] imgName =imgNames.split(",");
				String groupid = IdGen.uuid();
				for(int i=0;i<imgName.length;i++){
					String projectPath = "upload";
				    String path = Global.getConfig("webroot.basedir") +File.separator+projectPath; 
				    System.out.println("upload>>>path"+path);
				    File file = new File(path);  
				    if(!file.exists()){  
				        file.mkdir();  
				    }  
				    String visitPath = Global.getConfig("image.project.url") 
				    		+ File.separator + projectPath + 
				    		File.separator + imgName[i];
				    String imgPath  = path + File.separator + imgName[i];  
				    System.out.println("imgPath"+imgPath);
				    System.out.println("visitPath"+visitPath);
				    String imgStr = imgStrs.split(",")[i];  
				    boolean flag = string2Image(imgStr, imgPath); 
				    HmrtUpload hmrtUpload = new HmrtUpload();
					hmrtUpload.setGroupid(groupid);
					hmrtUpload.setCreateDate(new Date());
					hmrtUpload.setUpdateDate(new Date());
					hmrtUpload.setUserid(userid);
					hmrtUpload.setCaseid(caseid);
					hmrtUpload.setTitle(title);
					hmrtUpload.setRemark("保存图片信息");
					hmrtUpload.setType(type);
					hmrtUpload.setStatus("010");
				    hmrtUpload.setPath(visitPath);
				    hmrtUploadService.save(hmrtUpload);
				}
				
				
			}if("020".equals(type)){
				if (StringUtils.isEmpty(request.getParameter("descText"))) {
					outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,descText不能为空！", "")));
					return ;
				}
				String  descText = request.getParameter("descText");
				HmrtUpload hmrtUpload = new HmrtUpload();
			    hmrtUpload.setUserid(userid);
			    hmrtUpload.setCaseid(caseid);
			    hmrtUpload.setGroupid(IdGen.uuid());
			    hmrtUpload.setTitle(title);
			    hmrtUpload.setDesctext(descText);
			    hmrtUpload.setRemark("保存文字信息");
			    hmrtUpload.setCreateDate(new Date());
			    hmrtUpload.setUpdateDate(new Date());
			    hmrtUpload.setType(type);
			    hmrtUpload.setStatus("010");
			    hmrtUploadService.save(hmrtUpload);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！", ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 查询用户病例资源图片接口
	 */
	@RequestMapping(value = "queryImagesByCaseId")
	public void queryImagesById(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("caseid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,caseid不能为空！", "")));
				return;
			}
			String caseid = StringUtils.toString(request.getParameter("caseid"));
			HmrtUpload hmrtUpload=new HmrtUpload();
			hmrtUpload.setCaseid(caseid);
			hmrtUpload.setStatus("010");//  状态010启用  020禁用
			List<HmrtUpload> list = hmrtUploadService.getResByCaseId(hmrtUpload);
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", list)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
			return;
		}
		
	}
	/**
	 * 
	 * 删除用户病例资源图片接口
	 */
	@RequestMapping(value = "deleteByGroupId")
	public void deleteByGroupId(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		try {
			if (!validate(request, response)) {
				return;
			}
			if (!validateToken(request, response)) {
				return;
			}
			if (StringUtils.isEmpty(request.getParameter("groupid"))) {
				outputJson(response, JsonUtil.beanToJson(putResponseData(401, "请求参数错误,groupid不能为空！", "")));
				return;
			}
			String groupid = StringUtils.toString(request.getParameter("groupid"));
			HmrtUpload hmrtUpload=new HmrtUpload();
			hmrtUpload.setGroupid(groupid);
			List<HmrtUpload> list = hmrtUploadService.findList(hmrtUpload);
			for(HmrtUpload upload : list){
				upload.setStatus("020");//  状态010启用  020禁用
				hmrtUploadService.save(upload);
			}
			outputJson(response, JsonUtil.beanToJson(putResponseData(200, "", ConstantsConfig.RESULT_SUCCESS)));
		} catch (Exception e) {
			e.printStackTrace();
			outputJson(response, JsonUtil.beanToJson(putResponseData(500, "服务器端错误！",  ConstantsConfig.RESULT_ERROR)));
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
