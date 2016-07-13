package com.thinkgem.jeesite.modules.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class BackupChatRecordTask {

	@Scheduled(cron="0 40/1 20/1 * * ?")
	public void backupGroupMessage(){
		System.out.println("----执行定时任务");
	}
}
