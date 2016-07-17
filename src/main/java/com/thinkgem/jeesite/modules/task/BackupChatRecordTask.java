package com.thinkgem.jeesite.modules.task;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.NameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.thinkgem.jeesite.common.utils.SystemPath;
import com.thinkgem.jeesite.modules.cms.service.HuanXinService;
import com.thinkgem.jeesite.modules.cms.utils.huanxin.HTTPClientUtils;
import com.thinkgem.jeesite.modules.hmrtgroupcase.entity.HmrtGroupCase;
import com.thinkgem.jeesite.modules.hmrtgroupcase.service.HmrtGroupCaseService;
import com.thinkgem.jeesite.modules.hmrtgroupchat.entity.HmrtGroupChat;
import com.thinkgem.jeesite.modules.hmrtgroupchat.service.HmrtGroupChatService;

@Service @Lazy(false)
public class BackupChatRecordTask {

	private static final JsonNodeFactory factory = new JsonNodeFactory(false);
	private static final Logger LOGGER = LoggerFactory.getLogger(BackupChatRecordTask.class);
	
	@Autowired
	private HmrtGroupCaseService hmrtGroupCaseService;
	@Autowired
	private HmrtGroupChatService hmrtGroupChatService;
	
	@Scheduled(cron="0 0/2 1/1 * * ?")
	public void backupGroupMessage(){
		System.out.println("----执行定时任务");
		HmrtGroupCase hmrtGroupCase = new HmrtGroupCase();
		//List<HmrtGroupCase> list= hmrtGroupCaseService.findList(hmrtGroupCase);
//		for(HmrtGroupCase hGroupCase:list){
//			
//		}
		ObjectNode queryStrNode = factory.objectNode();
        //queryStrNode.put("ql", "select+*+where+from='fumk'");
		 //queryStrNode.put("ql", "select+*+where+chat_type='groupchat'+and+timestamp>'"+tm2+"'+and+timestamp<'"+tm+"'"); 不好使
		Long tm = new Date().getTime();
		Long tm2 = tm-(5*60*1000);
		queryStrNode.put("ql", "select+*+where+timestamp>"+tm2+"");
        queryStrNode.put("limit", "1000");
        queryStrNode.put("chat_type", "groupchat");
        ObjectNode messages = HuanXinService.getChatMessages(queryStrNode);
        LOGGER.info("备份聊天记录："+messages);
        String filestr=SystemPath.getSysPath();
        try {
			insertDataBase(messages,filestr);
		} catch (Exception e) {
			LOGGER.info("解析聊天记录异常"+e.toString());
			e.printStackTrace();
		}
	}
	
	
	private void insertDataBase(ObjectNode messages,String filestr) throws Exception{
		JsonNode jnote = messages.get("entities");
		if (jnote.isArray()) {
			for (JsonNode objNode : jnote) {
				List<NameValuePair> headers = new ArrayList<NameValuePair>();
				JsonNode uuid=objNode.get("uuid");
				JsonNode type=objNode.get("type");
				JsonNode created=objNode.get("created");
				JsonNode timestamp=objNode.get("timestamp");
				JsonNode from=objNode.get("from");
				JsonNode msg_id=objNode.get("msg_id");
				JsonNode to=objNode.get("to");
				JsonNode groupId=objNode.get("groupId");
				JsonNode chat_type=objNode.get("chat_type");
				JsonNode payload=objNode.get("payload");
				JsonNode bodies=payload.get("bodies");
				JsonNode b=bodies.get(0);
				HmrtGroupChat hmrt = new HmrtGroupChat();
				hmrt.setIsNewRecord(true);
				hmrt.setId(uuid.asText());
				hmrt.setTto(to.asText());
				hmrt.setTfrom(from.asText());
				hmrt.setTchattype(chat_type.asText());

				hmrt.setTtimestamp(timestamp.asLong());
				String messtype=b.get("type").asText();
				hmrt.setTtype(messtype);
				switch(messtype){
				case "txt":
					hmrt.setTmsg(b.get("msg").asText().replace("\n", ""));
					//hmrt.setTlength("0");
					hmrtGroupChatService.save(hmrt);
					continue;
				case "img":
					String imgurl = b.get("url").asText();
					String imgfilename = b.get("filename").asText();
					String imgsecret = b.get("secret").asText();
					//hmrt.setTurl(imgurl);
					hmrt.setTfilename(imgfilename);
					hmrt.setTsecret(imgsecret);
					URL huanxinimgurl = new URL(imgurl);
					String imglocalurl = filestr+"/images/"+imgfilename;
					HTTPClientUtils.downLoadFile(huanxinimgurl, null, headers, new File(imglocalurl));
					hmrt.setTurl("/images/"+imgfilename);
					hmrtGroupChatService.save(hmrt);
					continue;
				case "audio":
					String audiourl = b.get("url").asText();
					String audiofilename = b.get("filename").asText();
					String audiolength = b.get("length").asText();
					String audiosecret = b.get("secret").asText();
					//hmrt.setTurl(audiourl);
					hmrt.setTfilename(audiofilename);
					hmrt.setTsecret(audiosecret);
					hmrt.setTlength(audiolength);
					URL huanxinaudiourl = new URL(audiourl);
					String audiolocalurl = filestr+"/audio/"+audiofilename;
					HTTPClientUtils.downLoadFile(huanxinaudiourl, null, headers, new File(audiolocalurl));
					hmrt.setTurl("/audio/"+audiofilename);
					hmrtGroupChatService.save(hmrt);
					continue;
				case "video":
					String videourl = b.get("url").asText();
					String videofilename = b.get("filename").asText();
					String videolength = b.get("length").asText();
					String videosecret = b.get("secret").asText();
					//hmrt.setTurl(videourl);
					hmrt.setTfilename(videofilename);
					hmrt.setTsecret(videosecret);
					hmrt.setTlength(videolength);
					URL huanxinvideourl = new URL(videourl);
					String videolocalurl = filestr+"/video/"+videofilename;
					HTTPClientUtils.downLoadFile(huanxinvideourl, null, headers, new File(videolocalurl));
					hmrt.setTurl("/video/"+videofilename);
					hmrtGroupChatService.save(hmrt);
					continue;
				case "loc":
					String addr = b.get("addr").asText();
					String lat = b.get("lat").asText();
					String lng = b.get("lng").asText();
					hmrt.setTaddr(addr);
					hmrt.setTlat(lat);
					hmrt.setTlng(lng);
					hmrtGroupChatService.save(hmrt);
					continue;
				}
			}
		}
	}
}
