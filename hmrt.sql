/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.34 : Database - hmrt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hmrt` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hmrt`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('4cfe7db398a64a1e8ddce7a80068acd1',1,'test_audit.bpmn20.xml','cbeb5a435f3f48e6b3330a03f0713801','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('8b8427e9604045cb9afeec657ceedc74',1,'test_audit.png','cbeb5a435f3f48e6b3330a03f0713801','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F�����8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i���|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh����W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h��iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r�	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5��V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh���@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c����̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m���1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai��)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK����`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�����������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1',1),('schema.history','create(5.15.1)',1),('schema.version','5.15.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('cbeb5a435f3f48e6b3330a03f0713801','SpringAutoDeployment',NULL,'','2016-11-22 11:57:26');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('test_audit:1:8e1421317887474fb32ac79a40374b68',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'cbeb5a435f3f48e6b3330a03f0713801','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `patientid` varchar(64) DEFAULT NULL,
  `diagnose_info` varchar(512) DEFAULT NULL,
  `condition_info` varchar(512) DEFAULT NULL,
  `isarchive` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`patientid`,`diagnose_info`,`condition_info`,`isarchive`) values ('1','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('19b4b79f041249838f54737140c1164a','fab0ae2c1c0c4aa7ac1d9d60f6f8973b','测试资料库','','','','测试资料库','测试资料库',0,NULL,4,',null,','','','1','2016-11-22 23:02:22','1','2016-11-22 23:02:26',NULL,'0','','','','1'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('50874236e45b420d978c52bcf7b479ca','7d15c72b33594cf0bdb5b1e7c0ad251e','测试病例库','','','','测试病例库','测试病例库测试病例库测试病例库测试病例库',0,NULL,0,',null,','','','1','2016-11-22 23:01:04','1','2016-11-22 23:01:23',NULL,'0','','','','1'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL),('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL);

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','文章内容内容内容内容','来源','1,2,3','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('19b4b79f041249838f54737140c1164a','<p>\r\n	测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库</p>','','','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('50874236e45b420d978c52bcf7b479ca','<p>\r\n	测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库</p>','','','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','1','3','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7d15c72b33594cf0bdb5b1e7c0ad251e','1','0,1,','1','1','article','病例库','','','','','',30,'0','0','0','0','0','','','','1','2016-11-22 22:53:04','1','2016-11-22 23:00:12',NULL,'0'),('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('fab0ae2c1c0c4aa7ac1d9d60f6f8973b','1','0,1,','1','1','article','资料库','','','','','',30,'0','0','0','0','0','','','','1','2016-11-22 22:52:48','1','2016-11-22 23:00:20',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test',NULL,'树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','test',NULL,'单表生成','单表','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

/*Data for the table `gen_template` */

/*Table structure for table `hmrt_article_tags` */

DROP TABLE IF EXISTS `hmrt_article_tags`;

CREATE TABLE `hmrt_article_tags` (
  `id` varchar(64) DEFAULT NULL,
  `articleid` varchar(64) DEFAULT NULL,
  `tagsid` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_article_tags` */

/*Table structure for table `hmrt_group` */

DROP TABLE IF EXISTS `hmrt_group`;

CREATE TABLE `hmrt_group` (
  `id` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `dismiss_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_group` */

/*Table structure for table `hmrt_group_chat` */

DROP TABLE IF EXISTS `hmrt_group_chat`;

CREATE TABLE `hmrt_group_chat` (
  `id` varchar(64) DEFAULT NULL,
  `groupid` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `articleid` varchar(64) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `t_from` varchar(128) DEFAULT NULL,
  `t_chattype` varchar(128) DEFAULT NULL,
  `t_msg` varchar(128) DEFAULT NULL,
  `t_type` varchar(128) DEFAULT NULL,
  `t_length` varchar(128) DEFAULT NULL,
  `t_url` varchar(128) DEFAULT NULL,
  `t_filename` varchar(128) DEFAULT NULL,
  `t_secret` varchar(128) DEFAULT NULL,
  `t_lat` varchar(128) DEFAULT NULL,
  `t_lng` varchar(128) DEFAULT NULL,
  `t_addr` varchar(128) DEFAULT NULL,
  `t_timestamp` varchar(128) DEFAULT NULL,
  `t_to` varchar(128) DEFAULT NULL,
  `t_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_group_chat` */

/*Table structure for table `hmrt_group_user` */

DROP TABLE IF EXISTS `hmrt_group_user`;

CREATE TABLE `hmrt_group_user` (
  `id` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `groupid` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_group_user` */

/*Table structure for table `hmrt_like` */

DROP TABLE IF EXISTS `hmrt_like`;

CREATE TABLE `hmrt_like` (
  `id` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `articleid` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_like` */

/*Table structure for table `hmrt_patient` */

DROP TABLE IF EXISTS `hmrt_patient`;

CREATE TABLE `hmrt_patient` (
  `id` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `id_number` varchar(32) DEFAULT NULL,
  `visit_dt` datetime DEFAULT NULL,
  `department` varchar(128) DEFAULT NULL,
  `sn_type1` varchar(64) DEFAULT NULL,
  `sn_no1` varchar(64) DEFAULT NULL,
  `sn_type2` varchar(64) DEFAULT NULL,
  `sn_no2` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `profession` varchar(64) DEFAULT NULL,
  `contact` varchar(64) DEFAULT NULL,
  `introduce` varchar(64) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_patient` */

insert  into `hmrt_patient`(`id`,`userid`,`name`,`sex`,`birthday`,`age`,`mobile`,`id_number`,`visit_dt`,`department`,`sn_type1`,`sn_no1`,`sn_type2`,`sn_no2`,`phone`,`email`,`address`,`profession`,`contact`,`introduce`,`remark`,`create_dt`) values ('fcc35fabc3bd4dd2a3bfc1bd3f459c61','1','1','1','2016-11-22 17:45:03',1,'1','1','2016-11-22 17:45:06','1','1','1','1','1','1','1','1','1','1','1','1','2016-11-22 17:45:14');

/*Table structure for table `hmrt_score_log` */

DROP TABLE IF EXISTS `hmrt_score_log`;

CREATE TABLE `hmrt_score_log` (
  `id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ruleid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `score` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `userid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `hmrt_score_log` */

/*Table structure for table `hmrt_score_rule` */

DROP TABLE IF EXISTS `hmrt_score_rule`;

CREATE TABLE `hmrt_score_rule` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `userid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `score` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `hmrt_score_rule` */

/*Table structure for table `hmrt_tags` */

DROP TABLE IF EXISTS `hmrt_tags`;

CREATE TABLE `hmrt_tags` (
  `id` varchar(64) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hmrt_tags` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

/*Data for the table `oa_notify` */

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','山东省','20','110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','济南市','30','110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','0,1,2,3,','历城区','40','110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','0,1,2,3,','历下区','50','110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','0,1,2,3,','高新区','60','110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','正常','del_flag','删除标记','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','黄色','color','颜色值','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Java类型\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Java类型\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','草稿','oa_notify_status','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','发布','oa_notify_status','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','橙色','color','颜色值','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','未读','oa_notify_read','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','已读','oa_notify_read','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','默认主题','theme','主题方案','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','天蓝主题','theme','主题方案','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','橙色主题','theme','主题方案','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','红色主题','theme','主题方案','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flat主题','theme','主题方案','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','国家','sys_area_type','区域类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','省份、直辖市','sys_area_type','区域类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','3','地市','sys_area_type','区域类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','删除','del_flag','删除标记','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','区县','sys_area_type','区域类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','公司','sys_office_type','机构类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','部门','sys_office_type','机构类型','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','小组','sys_office_type','机构类型','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','其它','sys_office_type','机构类型','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','综合部','sys_office_common','快捷通用部门','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','开发部','sys_office_common','快捷通用部门','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','人力部','sys_office_common','快捷通用部门','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','一级','sys_office_grade','机构等级','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','二级','sys_office_grade','机构等级','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','显示','show_hide','显示/隐藏','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','三级','sys_office_grade','机构等级','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','四级','sys_office_grade','机构等级','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','所有数据','sys_data_scope','数据范围','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','所在公司数据','sys_data_scope','数据范围','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','所在部门数据','sys_data_scope','数据范围','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','仅本人数据','sys_data_scope','数据范围','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','按明细设置','sys_data_scope','数据范围','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','系统管理','sys_user_type','用户类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','隐藏','show_hide','显示/隐藏','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','部门经理','sys_user_type','用户类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','普通用户','sys_user_type','用户类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','基础主题','cms_theme','站点主题','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','蓝色主题','cms_theme','站点主题','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','红色主题','cms_theme','站点主题','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','文章模型','cms_module','栏目模型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','图片模型','cms_module','栏目模型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','下载模型','cms_module','栏目模型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','链接模型','cms_module','栏目模型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','专题模型','cms_module','栏目模型','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','是','yes_no','是/否','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','默认展现方式','cms_show_modes','展现方式','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','首栏目内容列表','cms_show_modes','展现方式','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','栏目第一条内容','cms_show_modes','展现方式','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','发布','cms_del_flag','内容状态','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','删除','cms_del_flag','内容状态','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','审核','cms_del_flag','内容状态','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','首页焦点图','cms_posid','推荐位','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','栏目页文章推荐','cms_posid','推荐位','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','咨询','cms_guestbook','留言板分类','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','建议','cms_guestbook','留言板分类','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','否','yes_no','是/否','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','投诉','cms_guestbook','留言板分类','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','其它','cms_guestbook','留言板分类','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','公休','oa_leave_type','请假类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','病假','oa_leave_type','请假类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','事假','oa_leave_type','请假类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','调休','oa_leave_type','请假类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','婚假','oa_leave_type','请假类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','接入日志','sys_log_type','日志类型','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','异常日志','sys_log_type','日志类型','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','请假流程','act_type','流程类型','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','红色','color','颜色值','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','审批测试流程','act_type','流程类型','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','分类1','act_category','流程分类','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('72','2','分类2','act_category','流程分类','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('73','crud','增删改查','gen_category','代码生成分类','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','树结构','gen_category','代码生成分类','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','查询方式','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','查询方式','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','查询方式','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','查询方式','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','绿色','color','颜色值','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','查询方式','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','查询方式','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','查询方式','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','查询方式','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','文本框','gen_show_type','字段生成方案','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','文本域','gen_show_type','字段生成方案','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','下拉框','gen_show_type','字段生成方案','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','复选框','gen_show_type','字段生成方案','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','单选框','gen_show_type','字段生成方案','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','日期选择','gen_show_type','字段生成方案','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','蓝色','color','颜色值','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','人员选择\0','gen_show_type','字段生成方案','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','部门选择','gen_show_type','字段生成方案','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','区域选择','gen_show_type','字段生成方案','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Java类型','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Java类型','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','男','sex','性别','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','女','sex','性别','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Java类型\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Java类型\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values ('00d62aaf879e44d9990ed681af171c46','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:56:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=41cd215a548a428c8b111c173428222b&icon=&sort=90&parent.id=6cf938a30faf4758a85f1167eff0000b&name=讨论组聊天记录&target=&permission=hmrtgroupchat:hmrtGroupChat:view,hmrtgroupchat:hmrtGroupChat:edit&remarks=&href=/hmrtgroupchat/hmrtGroupChat&parent.name=聊天管理&isShow=0',''),('012ff5abb55544b2bb143c39b86e5c88','1','内容管理-栏目设置-切换站点','1','2016-11-22 22:47:00','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/site/select','GET','tabPageId=jerichotabiframe_13',''),('01d9512f21d3497aacb12eb758d78385','1','哈特-患者管理-患者管理','1','2016-11-22 22:59:21','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_3',''),('05bd832db7844b1799958b6c16783b32','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:51:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=6cf938a30faf4758a85f1167eff0000b',''),('07ba77fd1a5b4180ba9cc205910d8e9c','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:04:03','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=test',''),('0841102586ad4d118cc7adff4670aeda','1','系统设置-机构用户-用户管理','1','2016-11-22 17:43:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_3',''),('09777a2daf854261aeda9ebece6fa398','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:03:46','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/checkLoginName','GET','oldLoginName=sd_admin&loginName=sd_admin',''),('09acedc032ab4634b817f4d7cfd47e12','1','系统登录','1','2016-11-22 00:23:29','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a','GET','login=',''),('0a5fe3f2fa2d4e8c8d0ee287c2626953','1','我的面板-个人信息-修改密码','1','2016-11-22 23:04:53','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/modifyPwd','GET','',''),('0c6c6f5525324dce9a5f4108ef27796f','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:52:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('0ce06330cf0b4a6bacec01510fe121a7','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:48:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=75e1c27ff0144cf297d6b56bd3353a51',''),('0cf23f601ff843849aea4c58690d8c67','1','我的面板-个人信息-个人信息','1','2016-11-22 17:52:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('0d98fe6323cf4ed68db09a45acc69802','1','在线办公-通知通告-我的通告','1','2016-11-22 22:59:17','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/oa/oaNotify/self','GET','tabPageId=jerichotabiframe_1',''),('0db92266f4b0442dbc99ead3d8e77eea','1','内容管理-内容管理-内容发布','1','2016-11-22 22:59:54','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_2',''),('0e22f37a069f4ea48dbf25dbfef7b19d','1','我的面板-个人信息-个人信息','1','2016-11-22 23:05:50','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/info','GET','',''),('0ebfc91f0ce8476899e9a77fd5dbe2ff','1','我的面板-个人信息-个人信息','1','2016-11-22 22:59:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('0f495719b4094321918bbb504474be69','1','哈特-聊天管理-分组用户','1','2016-11-22 22:42:52','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtgroupuser/hmrtGroupUser','GET','tabPageId=jerichotabiframe_8',''),('10172bc009b8458b9d6c3979582c55c5','1','内容管理-内容管理','1','2016-11-22 22:59:18','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none/','GET','category.id=2f928d8a6121497ba87d5b967341d9cf',''),('11975c15fef94d0e840efff1a62819ae','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:51:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('13840764d00140e0bcb708c1a71f507d','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:46:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=0c6ba2d1dd634a3186c908a8dfa52318',''),('15a71a0bf5c745109923cc73ee2fdf6d','1','哈特-聊天管理-群聊对应病例','1','2016-11-22 17:52:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroupcase/hmrtGroupCase','GET','tabPageId=jerichotabiframe_3',''),('183bdc2c3c4849bdadb9433e0dd6832a','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:57:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=026124ad397c4337ad6fc0e386aae56a&icon=&sort=60&parent.id=6cf938a30faf4758a85f1167eff0000b&name=群聊对应病例&target=&permission=hmrtgroupcase:hmrtGroupCase:view,hmrtgroupcase:hmrtGroupCase:edit&remarks=&href=/hmrtgroupcase/hmrtGroupCase&parent.name=聊天管理&isShow=0',''),('185d437ac1e44a8db3bc5c17c1e63d68','1','哈特-病例标签-病例标签','1','2016-11-22 17:59:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrttags/hmrtTags','GET','tabPageId=jerichotabiframe_3',''),('1873baa8007e46caa0d134e09dab3b7a','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:46:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5090&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=活动点赞&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('1a607d9a9ad44663a5842b94bf5041cc','1','在线办公-通知通告-我的通告','1','2016-11-22 23:12:53','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/oa/oaNotify/self','GET','tabPageId=jerichotabiframe_12',''),('1c20e5f184204276b91adf63a190a689','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:05:39','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/save','POST','id=&photo=&no=0000&name=d&oldLoginName=&loginName=123&newPassword=&confirmNewPassword=&email=&phone=&mobile=&loginFlag=1&userType=&roleIdList=2&_roleIdList=on&remarks=&level=&hospital=&isturn=&score=0&income=',''),('1d44a26aba364c1c8b3f806266fbd0bf','1','内容管理-内容管理','1','2016-11-22 22:59:54','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/tree','GET','',''),('1dae6bb33101445daab04375d234761a','1','我的面板-个人信息-个人信息','1','2016-11-22 17:40:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('1dc5226f46be49059b82dec3c9c82903','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 14:42:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_2',''),('1e21056aab4e48bd921874f3bf77914c','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:56:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_14',''),('1e3bae9f2d254374bf249ab94f407272','1','????-????-????','1','2016-11-22 00:37:24','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_2',''),('217496e2bc4e4d938a65bf7623c179cb','1','内容管理-内容管理','1','2016-11-22 22:51:23','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none','GET','',''),('237b96b9e3bb4fbd84c475e007b8b496','1','哈特-病例标签-病例标签','1','2016-11-22 23:04:58','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrttags/hmrtTags','GET','tabPageId=jerichotabiframe_14',''),('23982ce8daaa4ff4b17c29b8e498ca8e','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:50:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('242429bf0c514f7f9f14a759d4ca14c3','1','在线办公-通知通告-通告管理','1','2016-11-22 23:12:55','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/oa/oaNotify','GET','tabPageId=jerichotabiframe_13',''),('2455d7ab4f674d3aadc48b4d77329df6','1','内容管理-栏目设置-栏目管理','1','2016-11-22 23:00:12','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','',''),('248454706a5248739c80f82ded671e09','1','内容管理-内容管理-内容发布','1','2016-11-22 17:37:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_1',''),('25d0bd024e7f42cea87d21558fa555bf','1','系统登录','1','2016-11-22 22:59:10','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_23',''),('25d4964a26344d28bef591b49d2e99b0','1','内容管理-内容管理-内容发布','1','2016-11-22 14:42:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_1',''),('25f6022ad6e443219a6920c4644e5710','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:05:17','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('2635c6422dc145b78846038d17cc93af','1','内容管理-内容管理-内容发布-文章模型-查看','1','2016-11-22 23:00:38','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/form','GET','category.name=病例库&id=&category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('2670af28608145898faad713e3436de0','1','系统登录','1','2016-11-22 17:44:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a','GET','login=',''),('2723e7e83730438b824b3ba8a08b7e64','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:50:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=60&parent.id=75e1c27ff0144cf297d6b56bd3353a51&name=病历标签关系&target=&permission=hmrtarticletags:hmrtArticleTags:view,hmrtarticletags:hmrtArticleTags:edit&remarks=&href=/hmrtarticletags/hmrtArticleTags&parent.name=病例标签&isShow=1',''),('27b194d9d6b74f968201d3a7d2986f96','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:46:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_3',''),('284081d5864b4000899b47cc7fd8c8e2','1','系统设置-机构用户-用户管理','1','2016-11-22 17:46:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_2',''),('285f6af8111341ebb7995b07311a378f','1','哈特-积分规则-积分规则','1','2016-11-22 22:42:43','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtscorerule/hmrtScoreRule','GET','tabPageId=jerichotabiframe_3',''),('28c0860bc17a4933beda1646f6ec63af','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:57:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','id=026124ad397c4337ad6fc0e386aae56a',''),('28c71aedee19465292e235de0f8fb4e0','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:38:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('28e2aa9e6afe4fbda1823db1b449453d','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:52:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=90&parent.id=6cf938a30faf4758a85f1167eff0000b&name=讨论组聊天记录&target=&permission=hmrtgroupchat:hmrtGroupChat:view,hmrtgroupchat:hmrtGroupChat:edit&remarks=&href=/hmrtgroupchat/hmrtGroupChat&parent.name=聊天管理&isShow=1',''),('29df37509f4c486ba039fa241b9e0127','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:47:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5120&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=积分规则&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('2a37b1d5e5a14738a371bd7b9404a819','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:47:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('2a71468464ab45349fc9863c415b39c8','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:39:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','',''),('2d45ba6b7392426788f8a63a63260b60','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:49:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('2ec1054caa7f4b37b375fc1ca7da3df5','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:43:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_4',''),('334a01f16462491e964df8a622f71277','1','内容管理-栏目设置-栏目管理-查看','1','2016-11-22 23:00:04','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/form','GET','id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('343764b568ac4f93b11758cfc7daca1c','1','内容管理-内容管理','1','2016-11-22 23:05:15','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/cms/tree','GET','',''),('3465544c1df64ef39bf0223a60e9bff7','1','哈特-积分日志-积分日志','1','2016-11-22 17:59:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtscorelog/hmrtScoreLog','GET','tabPageId=jerichotabiframe_2',''),('346807722fe24378b9a52b2a5d66c3bc','1','????-????-????','1','2016-11-22 00:23:59','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_3',''),('350234239b1a432095b1a2cafd881830','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:40:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('38cf81856f1448d2802bb3c8f2e734cb','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:03:55','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/list','GET','',''),('391133175ac642268b1f6faebb41163a','1','哈特-积分日志-积分日志','1','2016-11-22 17:57:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtscorelog/hmrtScoreLog','GET','tabPageId=jerichotabiframe_2',''),('3abe865a5a434786826f10e084a4950f','1','内容管理-栏目设置-栏目管理-修改','1','2016-11-22 23:00:12','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/save','POST','id=7d15c72b33594cf0bdb5b1e7c0ad251e&office.id=1&office.name=山东省总公司&parent.id=1&parent.name=顶级栏目&module=article&name=病例库&image=&href=&target=&description=&keywords=&sort=30&inMenu=0&inList=0&showModes=0&allowComment=0&isAudit=0&customListView=&customContentView=&viewConfig=',''),('3adda6a259934df484487ec92a841fa0','1','????-????','1','2016-11-22 00:24:00','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/cms/tree','GET','',''),('3afbd91df8ce4ea79177baf2d8d80670','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:03:02','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/form','GET','id=2',''),('3b9e87b377f64ca9b31f2d3ef2732c0d','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:48:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('3bb0909ec2ce43c285474a08b869dd82','1','内容管理-栏目设置-栏目管理','1','2016-11-22 22:52:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','',''),('3bb290c966c242ffa5883bbb673e4649','1','内容管理-栏目设置-栏目管理','1','2016-11-22 23:00:21','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','',''),('3beef38d28f840c892fa1b24998e1bf4','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 17:37:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_2',''),('3bf0cf7b82204d4fb054f9db8557cd28','1','我的面板-个人信息-修改密码','1','2016-11-22 23:05:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/modifyPwd','GET','',''),('3db88d87c4484df69de78460eeb69407','1','内容管理-栏目设置-栏目管理','1','2016-11-22 22:53:04','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','',''),('3e80a9afc6484f6ea0bc55184917e8b5','1','我的面板-个人信息-个人信息','1','2016-11-22 17:59:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('3fb94bf326f84fc7b0924621102eaf6c','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:06:46','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/save','POST','id=&photo=&no=0000&name=王医生&oldLoginName=&loginName=test&newPassword=&confirmNewPassword=&email=&phone=&mobile=&loginFlag=1&userType=3&roleIdList=2&_roleIdList=on&remarks=test test test test&level=C&hospital=北京协和医院&isturn=1&score=0&income=100',''),('417f895a7df84416ac6b181d76331349','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 23:01:24','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','repage=&category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('43b39610dfaa451e80d7507e1b693b2f','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:52:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('4446c31ffb964b7bb1c98eeddb2e906c','1','代码生成-代码生成-业务表配置','1','2016-11-22 17:43:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/gen/genTable','GET','tabPageId=jerichotabiframe_2',''),('461ad62e5a894b2791b4c3d36802d074','1','内容管理-内容管理','1','2016-11-22 23:05:15','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/cms/none','GET','',''),('4664f52234934504980fe370a1cfe3c1','1','系统设置-机构用户-用户管理','1','2016-11-22 23:05:17','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_17',''),('4871e6392b9d4c3fa134489f1af20f76','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:48:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('48e10e3d1a17490e831f20fb5422f1d2','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 23:02:26','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','repage=&category.id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b',''),('49001d3ca5f7469ca66402ec93a2e4af','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:48:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('4911bd12a75f4eb0927e64534edcac29','1','系统登录','1','2016-11-22 22:59:14','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a','GET','',''),('4933faacdad949b29f3d75fc44e32a6d','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:42:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=d9a42152d22b4159a02d9794c180675d&icon=&sort=5060&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=患者管理&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('4b5760ae0301427bbb3675fbb9fdf96a','1','系统登录','1','2016-11-22 17:52:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a','GET','login=',''),('4b8bbb9c5d10499a8c7402c6129ac532','1','内容管理-内容管理','1','2016-11-22 22:51:23','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/tree','GET','',''),('4c1af0bd52ea4f8e8196a8885636ce9d','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:40:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('4c38803f3016451c936b2c86c8309964','1','内容管理-统计分析-信息量统计','1','2016-11-22 17:38:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/stats/article','GET','tabPageId=jerichotabiframe_5',''),('4cf3737823f446b8a114fa2f124bfcc1','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:51:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=6cf938a30faf4758a85f1167eff0000b',''),('4d7d8d9d59b24624838ebe418cd5a556','1','哈特-积分日志-积分日志','1','2016-11-22 23:04:56','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtscorelog/hmrtScoreLog','GET','tabPageId=jerichotabiframe_13',''),('4dc85599679643a38ae5764d7a229cb9','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:48:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('503ef66819c245dfbe9be2585c31ad92','2','哈特-聊天管理-讨论组聊天记录','1','2016-11-22 17:56:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroupchat/hmrtGroupChat','GET','tabPageId=jerichotabiframe_6','org.apache.jasper.JasperException: /WEB-INF/views/modules/hmrtgroupchat/hmrtGroupChatList.jsp(6,0) PWC6038: \"${pageContext.request.getScheme()}://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.getContextPath()}/\" contains invalid expression(s): javax.el.ELException: Error Parsing: ${pageContext.request.getScheme()}://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.getContextPath()}/\r\n	at org.apache.jasper.compiler.DefaultErrorHandler.jspError(DefaultErrorHandler.java:78)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.dispatch(ErrorDispatcher.java:373)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.jspError(ErrorDispatcher.java:185)\r\n	at org.apache.jasper.compiler.JspUtil.validateExpressions(JspUtil.java:655)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.getJspAttribute(Validator.java:1363)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.checkXmlAttributes(Validator.java:1139)\r\n	at org.apache.jasper.compiler.Validator$ValidateVisitor.visit(Validator.java:856)\r\n	at org.apache.jasper.compiler.Node$CustomTag.accept(Node.java:1501)\r\n	at org.apache.jasper.compiler.Node$Nodes.visit(Node.java:2302)\r\n	at org.apache.jasper.compiler.Node$Visitor.visitBody(Node.java:2352)\r\n	at org.apache.jasper.compiler.Node$Visitor.visit(Node.java:2358)\r\n	at org.apache.jasper.compiler.Node$Root.accept(Node.java:498)\r\n	at org.apache.jasper.compiler.Node$Nodes.visit(Node.java:2302)\r\n	at org.apache.jasper.compiler.Validator.validate(Validator.java:1878)\r\n	at org.apache.jasper.compiler.Compiler.generateJava(Compiler.java:215)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:431)\r\n	at org.apache.jasper.JspCompilationContext.compile(JspCompilationContext.java:608)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:374)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:476)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:366)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:820)\r\n	at org.eclipse.jetty.servlet.ServletHolder.handle(ServletHolder.java:652)\r\n	at org.eclipse.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:445)\r\n	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:137)\r\n	at org.eclipse.jetty.security.SecurityHandler.handle(SecurityHandler.java:574)\r\n	at org.eclipse.jetty.server.session.SessionHandler.doHandle(SessionHandler.java:227)\r\n	at org.eclipse.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1044)\r\n	at org.eclipse.jetty.servlet.ServletHandler.doScope(ServletHandler.java:372)\r\n	at org.eclipse.jetty.server.session.SessionHandler.doScope(SessionHandler.java:189)\r\n	at org.eclipse.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:978)\r\n	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:135)\r\n	at org.eclipse.jetty.server.Dispatcher.forward(Dispatcher.java:293)\r\n	at org.eclipse.jetty.server.Dispatcher.forward(Dispatcher.java:120)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:707)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:820)\r\n	at org.eclipse.jetty.servlet.ServletHolder.handle(ServletHolder.java:652)\r\n	at org.eclipse.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1317)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.eclipse.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1288)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.eclipse.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1288)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.eclipse.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1288)\r\n	at org.eclipse.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:443)\r\n	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:137)\r\n	at org.eclipse.jetty.security.SecurityHandler.handle(SecurityHandler.java:556)\r\n	at org.eclipse.jetty.server.session.SessionHandler.doHandle(SessionHandler.java:227)\r\n	at org.eclipse.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1044)\r\n	at org.eclipse.jetty.servlet.ServletHandler.doScope(ServletHandler.java:372)\r\n	at org.eclipse.jetty.server.session.SessionHandler.doScope(SessionHandler.java:189)\r\n	at org.eclipse.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:978)\r\n	at org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:135)\r\n	at org.eclipse.jetty.server.handler.ContextHandlerCollection.handle(ContextHandlerCollection.java:255)\r\n	at org.eclipse.jetty.server.handler.HandlerCollection.handle(HandlerCollection.java:154)\r\n	at org.eclipse.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:116)\r\n	at org.eclipse.jetty.server.Server.handle(Server.java:369)\r\n	at org.eclipse.jetty.server.AbstractHttpConnection.handleRequest(AbstractHttpConnection.java:486)\r\n	at org.eclipse.jetty.server.AbstractHttpConnection.headerComplete(AbstractHttpConnection.java:933)\r\n	at org.eclipse.jetty.server.AbstractHttpConnection$RequestHandler.headerComplete(AbstractHttpConnection.java:995)\r\n	at org.eclipse.jetty.http.HttpParser.parseNext(HttpParser.java:644)\r\n	at org.eclipse.jetty.http.HttpParser.parseAvailable(HttpParser.java:235)\r\n	at org.eclipse.jetty.server.AsyncHttpConnection.handle(AsyncHttpConnection.java:82)\r\n	at org.eclipse.jetty.io.nio.SelectChannelEndPoint.handle(SelectChannelEndPoint.java:667)\r\n	at org.eclipse.jetty.io.nio.SelectChannelEndPoint$1.run(SelectChannelEndPoint.java:52)\r\n	at org.eclipse.jetty.util.thread.QueuedThreadPool.runJob(QueuedThreadPool.java:608)\r\n	at org.eclipse.jetty.util.thread.QueuedThreadPool$3.run(QueuedThreadPool.java:543)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n'),('52064aab61ba4a77a087b533f0f5c4d8','1','内容管理-栏目设置-栏目管理','1','2016-11-22 22:51:27','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','tabPageId=jerichotabiframe_21',''),('52b385ee6aba4f10a39a5c2eece4c31e','1','????-????-????','1','2016-11-22 00:37:32','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/area/','GET','tabPageId=jerichotabiframe_4',''),('52cc2df1a90c4641949b16f8f9343c85','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:05:53','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/form','GET','',''),('53d51e9e86454bf3a7e996d449566adc','1','内容管理-栏目设置-栏目管理-查看','1','2016-11-22 22:52:57','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/form','GET','',''),('54d6ebd30b2648a786501858f69aad87','1','哈特-聊天管理-讨论组聊天记录','1','2016-11-22 17:53:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroupchat/hmrtGroupChat','GET','tabPageId=jerichotabiframe_4',''),('556a62c1114d40f38d182e439f905723','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:50:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('556f9b2169254d20af4277927d54cfef','1','????-????-????','1','2016-11-22 00:23:31','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('55d1ef51e3ba4d2fb7d412fdf264bbf2','1','内容管理-内容管理','1','2016-11-22 23:00:28','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none/','GET','category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('55dfb9a4b70c41e881dc5739d4ea0709','1','????-????-??????','1','2016-11-22 00:33:05','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/gen/genScheme','GET','tabPageId=jerichotabiframe_6',''),('576a6e6ade564189831cb4f5dd2c1625','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:39:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/updateSort','POST','sorts=100&ids=27',''),('583f972d2f6948ce9ccc266ec86980c2','1','内容管理-栏目设置-栏目管理-查看','1','2016-11-22 23:00:16','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/form','GET','id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b',''),('5a6dd8e3f32349b39a70f16df9fb5100','1','????-????-?????','1','2016-11-22 00:37:21','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/gen/genTable','GET','tabPageId=jerichotabiframe_1',''),('5b12b3a64f3d4966a786fc6257c02c95','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:40:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5030&parent.id=1&name=哈特&target=&permission=&remarks=&href=&parent.name=功能菜单&isShow=1',''),('5b3d56ee6c5b48e0a844bf7b47f38327','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:39:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('5b6d8d8d08b14842a297cf680cb05bfc','1','内容管理-内容管理-内容发布-文章模型-修改','1','2016-11-22 23:02:26','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/save','POST','id=&category.id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b&category.name=资料库&title=测试资料库&color=&link=&keywords=测试资料库&weight=0&weightDate=&description=测试资料库&image=&articleData.content=\r\n	测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试资料库测试...&articleData.copyfrom=&articleData.relation=&articleData.allowComment=1&_posidList=on&createDate=2016-11-22 23:02:22&patientid=&diagnoseInfo=&conditionInfo=&isarchive=1&delFlag=0&customContentView=&viewConfig=',''),('5cf3770394fe4a838bbaa2a99f58bdbd','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:51:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=6cf938a30faf4758a85f1167eff0000b&name=聊天分组&target=&permission=hmrtgroup:hmrtGroup:view,hmrtgroup:hmrtGroup:edit&remarks=&href=/hmrtgroup/hmrtGroup&parent.name=聊天管理&isShow=1',''),('6317220b658c42cfbe65151974bd3b7f','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 17:38:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_3',''),('63f11731992a462f953b34598aee52c8','1','内容管理-内容管理','1','2016-11-22 17:37:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/tree','GET','',''),('6442f34194ae425587eaebedb23f2d96','1','我的面板-个人信息-个人信息','1','2016-11-22 17:44:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('64cd7ccb27d2441fb10e94309a842cf4','1','内容管理-内容管理-内容发布-文章模型-查看','1','2016-11-22 23:00:38','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/form','GET','category.name=病例库&id=&category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('6542917312b849a3bc696f41b1d0c1b5','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:05:40','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/list','GET','repage=',''),('65e7cf69490c4eb487c4d80447f3fd6b','1','????-????-????','1','2016-11-22 00:38:06','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/dict/','GET','tabPageId=jerichotabiframe_7',''),('67839cb2984245cda9fbb2471892bf4d','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:48:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5150&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=病例标签&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('68a9d65f934e48859ac2ec255133ec52','1','哈特-聊天管理-聊天分组','1','2016-11-22 17:52:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroup/hmrtGroup','GET','tabPageId=jerichotabiframe_2',''),('68b2a1f1254f499d858eaa7977a9e4c3','1','内容管理-内容管理-内容发布','1','2016-11-22 23:05:15','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_16',''),('699214f01583446284033291565c226b','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:06:05','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=test',''),('699f7dabb67243c5b09b23bfc95e3a32','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:49:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('69b9c97f8fcb46e283defd4242acf49c','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 23:01:58','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','category.id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b',''),('6ab9778ebaf84cc888a552c0b9d051c4','1','系统登录','1','2016-11-22 22:52:47','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/save','POST','id=&office.id=1&office.name=山东省总公司&parent.id=1&parent.name=顶级栏目&module=&name=资料库&image=&href=&target=&description=&keywords=&sort=30&inMenu=0&inList=1&showModes=0&allowComment=0&isAudit=0&customListView=&customContentView=&viewConfig=',''),('6cc05518ebff495ca80cd8bbb841f90c','1','系统设置-机构用户-用户管理','1','2016-11-22 17:41:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_1',''),('6def2347c87047c8b38a898cf752af0f','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:48:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=75e1c27ff0144cf297d6b56bd3353a51&name=病例标签&target=&permission=hmrttags:hmrtTags:view,hmrttags:hmrtTags:edit&remarks=&href=/hmrttags/hmrtTags&parent.name=病例标签&isShow=1',''),('6e64634905d541cc8dd66947f498027a','1','内容管理-内容管理-公共留言-查看','1','2016-11-22 17:38:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/guestbook/','GET','status=2&tabPageId=jerichotabiframe_4',''),('6fae5ca0904b4a91bdd64b41d244e976','1','内容管理-内容管理-内容发布','1','2016-11-22 22:46:45','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_9',''),('6fd3aeedcd2b4236864296a170066b04','1','内容管理-内容管理-内容发布-文章模型-查看','1','2016-11-22 23:02:00','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/findByIds','GET','ids=',''),('723a73e2810f460a9cf15082b20c8a5e','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:46:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('744794c3b2534decbc5d2a2a92228fa2','1','内容管理-内容管理','1','2016-11-22 17:37:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/none','GET','',''),('751b096c35504ec19745aacd173cdb88','1','内容管理-内容管理','1','2016-11-22 22:59:58','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none/','GET','category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('790ece879b2f4de5bd812c9a7139351d','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:43:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=d9a42152d22b4159a02d9794c180675d&name=患者管理&target=&permission=hmrtpatient:hmrtPatient:view,hmrtpatient:hmrtPatient:edit&remarks=&href=/hmrtpatient/hmrtPatient&parent.name=患者管理&isShow=1',''),('7a9aafef094a4743851dece5fcc8bc21','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:41:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','',''),('7c8d3e61238440f6afafcf70b0c7a1bd','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:49:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=33ca702e9b734f2795d82524dde9b3aa&name=积分日志&target=&permission=hmrtscorelog:hmrtScoreLog:view,hmrtscorelog:hmrtScoreLog:edit&remarks=&href=/hmrtscorelog/hmrtScoreLog&parent.name=积分日志&isShow=1',''),('7e0c66681f65404798eea3c9c853712c','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:56:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('7fb66ec7309c49f1b587c8aca28d9efa','1','内容管理-栏目设置-栏目管理-修改','1','2016-11-22 22:52:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/save','POST','id=&office.id=1&office.name=山东省总公司&parent.id=1&parent.name=顶级栏目&module=&name=资料库&image=&href=&target=&description=&keywords=&sort=30&inMenu=0&inList=1&showModes=0&allowComment=0&isAudit=0&customListView=&customContentView=&viewConfig=',''),('831ca1f0193c4f69941bcfe2ec746893','1','我的面板-个人信息-个人信息','1','2016-11-22 22:42:35','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('8377977021534deea4b3f8dc2be4fea2','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:05:30','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=123',''),('8394adb6ec484bfe87d77b5bc70361d5','1','????-????-????','1','2016-11-22 00:33:37','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('85f49c09ce654aa580d336202faba585','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:52:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=120&parent.id=6cf938a30faf4758a85f1167eff0000b&name=分组用户&target=&permission=hmrtgroupuser:hmrtGroupUser:view,hmrtgroupuser:hmrtGroupUser:edit&remarks=&href=/hmrtgroupuser/hmrtGroupUser&parent.name=聊天管理&isShow=1',''),('8782216f41514077aea7a389b542739c','1','哈特-聊天管理-聊天分组','1','2016-11-22 22:42:51','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtgroup/hmrtGroup','GET','tabPageId=jerichotabiframe_7',''),('87aa580840df4e99bec05096d8751d12','1','哈特-聊天管理-分组用户','1','2016-11-22 17:56:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroupuser/hmrtGroupUser','GET','tabPageId=jerichotabiframe_7',''),('880b298fdd744e04b1d78d2579727aa2','1','哈特-患者管理-患者管理','1','2016-11-22 17:52:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('8917a035796b43bf93877f87dddba6af','1','系统设置-机构用户-用户管理','1','2016-11-22 17:38:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_8',''),('899a80ffed6d4a80b86508ae4f7d5012','1','内容管理-内容管理-内容发布','1','2016-11-22 23:00:32','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_5',''),('8c2a9872f15d4943aa251960bfad3aad','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:47:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=b79bc81107a44c2bb1ee0f4c6021ba1a&name=积分规则&target=&permission=hmrtscorerule:hmrtScoreRule:view,hmrtscorerule:hmrtScoreRule:edit&remarks=&href=/hmrtscorerule/hmrtScoreRule&parent.name=积分规则&isShow=1',''),('8c3876a50f534578a90c0ee836aba716','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:48:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('8ca3333ebfce447ba7ac5ac690d9aa38','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 22:59:26','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','category.id=9',''),('8d51c223695d4ea08f471952c1939d33','1','哈特-患者管理-患者管理','1','2016-11-22 23:06:08','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_19',''),('8e3048d7ff564ab7a72de202e8e17a3f','1','哈特-活动点赞-活动点赞','1','2016-11-22 22:42:40','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtlike/hmrtLike','GET','tabPageId=jerichotabiframe_2',''),('8e4e7f80b6064c27a84e8bc91e63cc46','1','内容管理-内容管理','1','2016-11-22 23:00:32','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none','GET','',''),('8e90235b50b64ea194b3fa8b6f616b47','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:39:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_9',''),('8eea029f1c134d85b3396afc2762b283','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:03:56','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/form','GET','',''),('8fca26642d574bd182a53678457349d7','1','哈特-聊天管理-聊天分组','1','2016-11-22 23:04:41','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtgroup/hmrtGroup','GET','tabPageId=jerichotabiframe_10',''),('91b39de0374f456389fd57ee315a98c4','1','内容管理-内容管理','1','2016-11-22 22:59:23','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none/','GET','category.id=a9e3d6015d2c42409ac4831a53013333',''),('921d4128e1a64b739124baea15a0056e','1','????-????-?????','1','2016-11-22 00:24:09','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/gen/genTable','GET','tabPageId=jerichotabiframe_5',''),('9269fbeffb764cf0ba2f3c9e424eb53f','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:41:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5060&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=患者管理&target=&permission=&remarks=&href=/hmrtpatient/hmrtPatient&parent.name=哈特&isShow=1',''),('93a31ff0fff343d388793e3fed6e777e','1','内容管理-内容管理-内容发布-文章模型-修改','1','2016-11-22 23:01:23','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/save','POST','id=&category.id=7d15c72b33594cf0bdb5b1e7c0ad251e&category.name=病例库&title=测试病例库&color=&link=&keywords=测试病例库&weight=0&weightDate=&description=测试病例库测试病例库测试病例库测试病例库&image=&articleData.content=\r\n	测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试病例库测试...&articleData.copyfrom=&articleData.relation=&articleData.allowComment=1&_posidList=on&createDate=2016-11-22 23:01:04&patientid=&diagnoseInfo=&conditionInfo=&isarchive=1&delFlag=0&customContentView=&viewConfig=',''),('94ad9957b3564ed0865fddf72d531038','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:48:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5180&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=积分日志&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('95214a7ce5c34794be89061240d7b16e','1','我的面板-个人信息-个人信息','1','2016-11-22 14:42:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('96e03e90c9fe4901abf9e6d010e6deac','1','内容管理-内容管理','1','2016-11-22 22:59:54','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none','GET','',''),('97f0aa07ad054b62a91fd8a1a2ea953a','1','哈特-积分规则-积分规则','1','2016-11-22 18:01:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtscorerule/hmrtScoreRule','GET','tabPageId=jerichotabiframe_6',''),('985122f2eadb4134be05b12e75f087ae','1','哈特-积分规则-积分规则','1','2016-11-22 23:05:00','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtscorerule/hmrtScoreRule','GET','tabPageId=jerichotabiframe_15',''),('99b7c2fd600543829fc75901ebf9b91f','1','内容管理-内容管理-内容发布-文章模型-查看','1','2016-11-22 23:00:41','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/findByIds','GET','ids=',''),('99ca4c9c51cc44d69ed6e40c6c70f44c','1','系统登录','1','2016-11-22 23:12:53','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/menu/tree','GET','parentId=62',''),('9a28baeaf4f74ae48a9f3a1b41fd3c81','1','内容管理-内容管理-内容发布-文章模型-查看','1','2016-11-22 23:02:00','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/form','GET','category.name=资料库&id=&category.id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b',''),('9ace4ef6a0c74d6480f86cbe89fcd4b9','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:41:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('9b897c915ad04c9d9ee7a577fc47c9ec','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 22:59:50','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/list','GET','',''),('9c08fd47944e48c2a8807a70f398072f','1','????-????-????-??','1','2016-11-22 00:24:05','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('9ce587df20d44aa39c84f94560f0c88c','1','内容管理-栏目设置-栏目管理','1','2016-11-22 22:46:55','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','tabPageId=jerichotabiframe_11',''),('9cf694d8304442d6a6b5cc707d2fda7a','1','哈特-积分日志-积分日志','1','2016-11-22 22:42:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtscorelog/hmrtScoreLog','GET','tabPageId=jerichotabiframe_6',''),('9d02fba544ae44149108e371d8e8ec34','1','系统设置-机构用户-用户管理','1','2016-11-22 17:40:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_1',''),('9dc9924c2dff4343b4a6778247e4445a','1','内容管理-栏目设置-栏目管理-查看','1','2016-11-22 22:59:39','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/form','GET','id=2f928d8a6121497ba87d5b967341d9cf',''),('9e027b4965bb49158228770516115554','1','????-????-????-??','1','2016-11-22 00:37:26','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('9e2c960bd2d34da18d0b4eab26fb071a','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:49:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('9ee42f102205437b9dd3e4f5613183c8','1','系统设置-机构用户-用户管理','1','2016-11-22 17:56:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_13',''),('9fc308c4edeb49c48331815ceb051cf1','1','????-????-????','1','2016-11-22 00:23:42','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('a02a796566b84ad883aa36c3b57e55bd','1','哈特-聊天管理-分组用户','1','2016-11-22 23:04:40','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtgroupuser/hmrtGroupUser','GET','tabPageId=jerichotabiframe_9',''),('a1b1a827d65640d69fe89afb09f5b8e8','1','我的面板-个人信息-个人信息','1','2016-11-22 23:04:54','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/info','GET','',''),('a30606aeae6d4cf4959e5ea3f854642d','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:05:22','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/form','GET','',''),('a66d95be4620487494b8abd62d295d06','1','内容管理-统计分析-信息量统计','1','2016-11-22 22:46:53','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/stats/article','GET','tabPageId=jerichotabiframe_10',''),('a8301c2bf4704753b1b61adf899492ba','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:06:47','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/list','GET','repage=',''),('a9d958fe499c46408fbd99b6291967a5','1','我的面板-个人信息-个人信息','1','2016-11-22 17:37:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('aabbf2138075431bbdd255e70a5254e7','1','内容管理-内容管理','1','2016-11-22 14:42:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/none','GET','',''),('acc6ce752ed54a13bcb15660f98df13b','1','哈特-患者管理-患者管理','1','2016-11-22 17:43:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('b02082d6662e4a09aa474262d549f479','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:49:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=75e1c27ff0144cf297d6b56bd3353a51',''),('b379cb9b9b9147ffbb60975c9929ff33','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:57:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('b449aca82bb9457ab07230d8025b95a4','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:50:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=5210&parent.id=ccc626c15e1a4cec9261a273871d5e1f&name=聊天管理&target=&permission=&remarks=&href=&parent.name=哈特&isShow=1',''),('b589007cbb4f4832b8e639225d3c1a46','1','系统登录','1','2016-11-22 22:42:32','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a','GET','login=',''),('b5b4a1ced33d410ba1a1b5f10a632854','1','哈特-患者管理-患者管理','1','2016-11-22 17:57:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('b6529caa71174a92a4742a7abbd07dff','1','我的面板-个人信息-个人信息','1','2016-11-22 22:59:15','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('ba3f5711dd6b4f509b07b367b38a7159','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:42:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('bc00961967834d82b694f2dc6727cb5b','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:47:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('bd8a593edefa47e381aa06018b7adc85','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:50:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('bd9a9fbe774f400da833acc6eeccafef','1','哈特-患者管理-患者管理','1','2016-11-22 17:59:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('bdb28de70e6d4a28a1d76f3c07decc40','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:52:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=6cf938a30faf4758a85f1167eff0000b',''),('bdf3dcacdaf644a4985aff24bfd58dba','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 22:47:17','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_16',''),('bdf68d8f7b4349a1b3549cfa3337baea','1','内容管理-栏目设置-栏目管理-查看','1','2016-11-22 22:51:51','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/form','GET','',''),('beef072c9c534869bda9a0fa8c4e0cc4','1','我的面板-个人信息-个人信息','1','2016-11-22 22:42:35','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('bf13981bedcb480388811ee72792701f','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:41:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_2',''),('bf74e51a60f8479a929979397199af93','1','系统设置-机构用户-用户管理-修改','1','2016-11-22 23:04:29','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/save','POST','id=&photo=&no=0000&name=test&oldLoginName=&loginName=test&newPassword=&confirmNewPassword=&email=&phone=&mobile=&loginFlag=1&userType=&roleIdList=2&_roleIdList=on&remarks=&level=C&hospital=&isturn=1&score=0&income=100',''),('c008e62e51794daa8e23157c7b502450','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 23:00:34','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','category.id=7d15c72b33594cf0bdb5b1e7c0ad251e',''),('c0347cb23d9547b69220075a19ae37ad','1','内容管理-栏目设置-栏目管理','1','2016-11-22 22:59:33','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','tabPageId=jerichotabiframe_24',''),('c0783e29387a4247883774d3a5633c7d','1','哈特-病例标签-病例标签','1','2016-11-22 23:04:37','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrttags/hmrtTags','GET','tabPageId=jerichotabiframe_6',''),('c093df6e8c1e4e0aac0342d7fcaa751f','1','????-????-????','1','2016-11-22 00:23:51','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/oa/oaNotify/self','GET','tabPageId=jerichotabiframe_2',''),('c123978b3643404eb1018d56c888ae50','1','内容管理-栏目设置-栏目管理','1','2016-11-22 23:00:00','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/','GET','tabPageId=jerichotabiframe_3',''),('c13aa62c31c5449bb496aed58b82e8ec','1','系统登录','1','2016-11-22 00:33:04','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/gen/genScheme','GET','tabPageId=jerichotabiframe_6',''),('c173bb132bcb44f2af9ce2592a05dee7','1','????-????-????','1','2016-11-22 00:24:03','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_4',''),('c3485b78237d426e913f089f9377d10c','1','内容管理-栏目设置-栏目管理','1','2016-11-22 17:38:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/category/','GET','tabPageId=jerichotabiframe_6',''),('c3be12b32b2f4bdeacc84d477877e116','1','系统登录','1','2016-11-22 22:59:48','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a','GET','login=',''),('c41d056d45f44cb3a397bf314ac184b2','1','哈特-病例标签-病历标签关系','1','2016-11-22 23:04:38','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtarticletags/hmrtArticleTags','GET','tabPageId=jerichotabiframe_8',''),('c542359a806743d4ab964cf64b820af5','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:43:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('c563ce7d6c4e48eabebbb6f473a9883f','1','代码生成-代码生成-业务表配置','1','2016-11-22 23:06:07','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/gen/genTable','GET','tabPageId=jerichotabiframe_18',''),('c5d35265bedd4005903de1fe499777aa','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:46:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('c6153b00e5404257a8b7ad9fa997f4dd','1','系统设置-机构用户-用户管理','1','2016-11-22 22:59:49','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_1',''),('c63d59d48d8a4b7084cf17119be74ad0','1','内容管理-栏目设置-站点设置','1','2016-11-22 22:46:57','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/site/','GET','tabPageId=jerichotabiframe_12',''),('c713c62172414ffe810ea7f43766f325','1','在线办公-通知通告-我的通告','1','2016-11-22 22:51:13','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/oa/oaNotify/self','GET','tabPageId=jerichotabiframe_17',''),('c924bd31feae47ad8ab1426e32cee0de','1','哈特-聊天管理-讨论组聊天记录','1','2016-11-22 17:53:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtgroupchat/hmrtGroupChat','GET','tabPageId=jerichotabiframe_5',''),('c9e7f6ceb70248e0b0c5345fff62444d','1','系统登录','1','2016-11-22 22:42:34','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a','GET','login=',''),('ca08f51f8b6143cc9b3cbf9d1abc8149','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 17:46:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/list','GET','',''),('ca21d0ac305347e59691c0273ccc6ab0','1','内容管理-栏目设置-栏目管理-修改','1','2016-11-22 22:53:04','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/save','POST','id=&office.id=1&office.name=山东省总公司&parent.id=1&parent.name=顶级栏目&module=&name=病例库&image=&href=&target=&description=&keywords=&sort=30&inMenu=0&inList=1&showModes=0&allowComment=0&isAudit=0&customListView=&customContentView=&viewConfig=',''),('cc340ac44d224b23ba50470bd5252a81','1','系统设置-机构用户-用户管理-查看','1','2016-11-22 23:05:52','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/list','GET','',''),('cc82cdbd00a947998dbd0c30a788c9a5','1','????-????-????','1','2016-11-22 00:38:35','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_10',''),('cf5b74acb7c440ea844a1ee760402240','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:47:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('d1c7b155450b40b9b8582ad8a22b0f72','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:51:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=60&parent.id=6cf938a30faf4758a85f1167eff0000b&name=群聊对应病例&target=&permission=hmrtgroupcase:hmrtGroupCase:view,hmrtgroupcase:hmrtGroupCase:edit&remarks=&href=/hmrtgroupcase/hmrtGroupCase&parent.name=聊天管理&isShow=1',''),('d549eadadf3144589658b80682cd1578','1','哈特-病例标签-病例标签','1','2016-11-22 22:42:45','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrttags/hmrtTags','GET','tabPageId=jerichotabiframe_4',''),('d60787e5883d46be95b99d4abcbd3848','1','我的面板-个人信息-修改密码','1','2016-11-22 22:51:16','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/modifyPwd','GET','tabPageId=jerichotabiframe_19',''),('d6c4158c49bc4639adafa97e3a539f6c','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:56:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','id=41cd215a548a428c8b111c173428222b',''),('d6e66b75c6724ad38dc2a76d5c28bc47','1','系统设置-系统设置-菜单管理-修改','1','2016-11-22 17:47:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=0c6ba2d1dd634a3186c908a8dfa52318&name=活动点赞&target=&permission=hmrtlike:hmrtLike:view,hmrtlike:hmrtLike:edit&remarks=&href=/hmrtlike/hmrtLike&parent.name=活动点赞&isShow=1',''),('d7b24bc40ee34cc9a5c24bf87da265e6','1','内容管理-内容管理','1','2016-11-22 22:59:10','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none','GET','',''),('d9b40d2ee56240f6bd7265e62214add4','1','哈特-活动点赞-活动点赞','1','2016-11-22 18:01:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtlike/hmrtLike','GET','tabPageId=jerichotabiframe_7',''),('da43cc31a60340789501a49ff434c117','1','内容管理-内容管理','1','2016-11-22 14:42:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/tree','GET','',''),('da71b5b6a88a4061bb758db52a92d7a7','1','内容管理-内容管理','1','2016-11-22 23:00:32','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/tree','GET','',''),('dadf86376f7841b1aadd956971167578','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:41:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('db3a77bf794f47f58349350477861f26','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:40:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','tabPageId=jerichotabiframe_2',''),('dcca5d8f6e324ee4ae7b7c8b3eadf557','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:47:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=ccc626c15e1a4cec9261a273871d5e1f',''),('de6a0b75bae746f2817cd1f7158a2bc4','1','哈特-患者管理-患者管理','1','2016-11-22 22:42:38','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('e00acf43499f454b9673b9f924a1dc1b','1','????-????-????-??','1','2016-11-22 00:37:30','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/office/list','GET','parentIds=&id=',''),('e0125fb84764453dbfda67b033b579de','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:43:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('e143657829744620bc2317b03e0d6e99','1','哈特-积分规则-积分规则','1','2016-11-22 23:04:35','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/hmrtscorerule/hmrtScoreRule','GET','tabPageId=jerichotabiframe_5',''),('e193bc701e02457b9fc3604523f33931','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:42:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=d9a42152d22b4159a02d9794c180675d',''),('e196f76c516e4b19b263684b27d6fb58','1','我的面板-个人信息-个人信息','1','2016-11-22 17:41:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('e19f60ed088b4231ba304673f1c8bbdf','1','系统登录','1','2016-11-22 14:42:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a','GET','login=',''),('e31643b34cd3495da74b820a8df6da21','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:47:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=b79bc81107a44c2bb1ee0f4c6021ba1a',''),('e3951ff1ff904b65bd61a62b3eef9887','1','内容管理-内容管理-内容发布','1','2016-11-22 22:59:10','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_23',''),('e7258bf8564c4a0aa1bd83db18be9665','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 14:45:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_4',''),('e7a2301195d4432dad620239b36f9507','1','哈特-病例标签-病历标签关系','1','2016-11-22 22:42:46','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/hmrtarticletags/hmrtArticleTags','GET','tabPageId=jerichotabiframe_5',''),('e8351124208a447d957b17231be3d268','1','我的面板-个人信息-个人信息','1','2016-11-22 17:43:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('e8fb5199744d44358626ef6e54c7bc3b','1','内容管理-内容管理-内容发布-文章模型','1','2016-11-22 22:59:57','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/article/','GET','category.id=9',''),('e928c8b7acfc493e96e9cc3dc9184efa','1','我的面板-个人信息-个人信息','1','2016-11-22 17:57:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('e98e8524daff498894380e4886b40655','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:56:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('e9b58ac208c948b2a7800907a811bb0e','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:50:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=6cf938a30faf4758a85f1167eff0000b',''),('e9ee9e56c03d40f1ae27217639967c4a','1','在线办公-通知通告-通告管理','1','2016-11-22 22:59:18','117.100.157.188','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','/jeesite/a/oa/oaNotify','GET','tabPageId=jerichotabiframe_2',''),('eb73c535313e4b69980018370f569a9f','1','系统登录','1','2016-11-22 17:37:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a','GET','login=',''),('ecc5e88d3bff4b999041fde59c233f92','1','内容管理-内容管理-内容发布','1','2016-11-22 22:51:23','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/','GET','tabPageId=jerichotabiframe_20',''),('ee14eb935e77432a954acc0ce0cf08e1','1','????-????-????','1','2016-11-22 00:34:33','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/user/info','GET','tabPageId=jerichotabiframe_0',''),('ef1b0a7991994d41b9f4f254768a9f35','1','????-????-????','1','2016-11-22 00:37:29','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/office/','GET','tabPageId=jerichotabiframe_3',''),('efce37f5a4924d21bd4bfd8f45d0e221','1','哈特-病例标签-病历标签关系','1','2016-11-22 17:59:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtarticletags/hmrtArticleTags','GET','tabPageId=jerichotabiframe_4',''),('f06596b572f14c9e80c6d8bea020f0a9','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:42:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','id=d9a42152d22b4159a02d9794c180675d',''),('f0c45ea7bfad4fc9bd0fd4f5ff041c15','1','系统设置-机构用户-用户管理','1','2016-11-22 23:05:52','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/sys/user/index','GET','tabPageId=jerichotabiframe_10',''),('f1451ac7a6e04a108343dd988fa735d6','1','哈特-积分规则-积分规则','1','2016-11-22 17:59:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtscorerule/hmrtScoreRule','GET','tabPageId=jerichotabiframe_5',''),('f3b4432592ca48d98a5bcc2d1864a515','1','????-????','1','2016-11-22 00:24:00','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/cms/none','GET','',''),('f506dbc40d744a3ab7343fedc81720a7','1','内容管理-栏目设置-栏目管理-修改','1','2016-11-22 23:00:20','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/category/save','POST','id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b&office.id=1&office.name=山东省总公司&parent.id=1&parent.name=顶级栏目&module=article&name=资料库&image=&href=&target=&description=&keywords=&sort=30&inMenu=0&inList=0&showModes=0&allowComment=0&isAudit=0&customListView=&customContentView=&viewConfig=',''),('f6cce21b8a9b4325b75d3216c06acc12','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:43:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','id=90',''),('f752c6dabbe7425aabef9c1e7de5c490','1','系统设置-系统设置-菜单管理','1','2016-11-22 17:51:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/','GET','',''),('f757a3a36174457294f03665486b2a41','1','内容管理-内容管理','1','2016-11-22 22:59:10','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/tree','GET','',''),('f86a945dfaa94ca0ab0305ab6e7bfd24','1','内容管理-内容管理-评论管理-查看','1','2016-11-22 14:45:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/cms/comment/','GET','status=2&tabPageId=jerichotabiframe_3',''),('f99f2c12724c4111b604f8115bf53728','1','内容管理-内容管理','1','2016-11-22 22:46:46','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none','GET','',''),('fa1970d635384b22b82eb839ed3d494f','1','????-????-????','1','2016-11-22 00:38:11','192.168.31.246','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36','/jeesite/a/sys/log','GET','tabPageId=jerichotabiframe_8',''),('fad50f169e7344498bfc9144c8580809','1','内容管理-内容管理','1','2016-11-22 23:00:29','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/none/','GET','category.id=fab0ae2c1c0c4aa7ac1d9d60f6f8973b',''),('fb1aa5b64aa241b3a01916237203ce99','1','哈特-患者管理-患者管理','1','2016-11-22 17:44:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/hmrtpatient/hmrtPatient','GET','tabPageId=jerichotabiframe_1',''),('fd9f73902d994210a5c7120031de88f4','1','系统设置-系统设置-菜单管理-查看','1','2016-11-22 17:48:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36','/jeesite/a/sys/menu/form','GET','parent.id=33ca702e9b734f2795d82524dde9b3aa',''),('fddd751d67cf4d99b391cb646b2176cb','1','内容管理-内容管理','1','2016-11-22 22:46:46','222.128.190.45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8','/jeesite/a/cms/tree','GET','','');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('026124ad397c4337ad6fc0e386aae56a','6cf938a30faf4758a85f1167eff0000b','0,1,ccc626c15e1a4cec9261a273871d5e1f,6cf938a30faf4758a85f1167eff0000b,','群聊对应病例','60','/hmrtgroupcase/hmrtGroupCase','','','0','hmrtgroupcase:hmrtGroupCase:view,hmrtgroupcase:hmrtGroupCase:edit','1','2016-11-22 17:51:40','1','2016-11-22 17:57:12','','0'),('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑','60','','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0c6ba2d1dd634a3186c908a8dfa52318','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','活动点赞','5090','','','','1','','1','2016-11-22 17:46:49','1','2016-11-22 17:46:49','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构','90','/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','功能菜单','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理','60','/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户','970',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','区域管理','50','/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','机构管理','40','/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','查看','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','修改','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','系统设置','900',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','用户管理','30','/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','查看','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','修改','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','关于帮助','990',NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','23','0,1,2,23','官方首页','30','http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','项目支持','50','http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','论坛交流','80','http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2625f1f39ff244418f939f1b086fda08','b79bc81107a44c2bb1ee0f4c6021ba1a','0,1,ccc626c15e1a4cec9261a273871d5e1f,b79bc81107a44c2bb1ee0f4c6021ba1a,','积分规则','30','/hmrtscorerule/hmrtScoreRule','','','1','hmrtscorerule:hmrtScoreRule:view,hmrtscorerule:hmrtScoreRule:edit','1','2016-11-22 17:47:51','1','2016-11-22 17:47:51','','0'),('27','1','0,1,','我的面板','100',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','个人信息','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','个人信息','30','/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','系统设置','980',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码','40','/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','内容管理','500',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','栏目设置','990',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','栏目管理','30','/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33ca702e9b734f2795d82524dde9b3aa','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','积分日志','5180','','','','1','','1','2016-11-22 17:48:49','1','2016-11-22 17:48:49','','0'),('34','33','0,1,31,32,33,','查看','30',NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','修改','40',NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','站点设置','40','/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','查看','30',NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','修改','40',NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','切换站点','50','/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例','120','','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('3ed237f2b14c47e68859335bd8fb016a','75e1c27ff0144cf297d6b56bd3353a51','0,1,ccc626c15e1a4cec9261a273871d5e1f,75e1c27ff0144cf297d6b56bd3353a51,','病例标签','30','/hmrttags/hmrtTags','','','1','hmrttags:hmrtTags:view,hmrttags:hmrtTags:edit','1','2016-11-22 17:48:30','1','2016-11-22 17:48:30','','0'),('4','3','0,1,2,3,','菜单管理','30','/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','内容管理','500',NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','内容发布','30','/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41cd215a548a428c8b111c173428222b','6cf938a30faf4758a85f1167eff0000b','0,1,ccc626c15e1a4cec9261a273871d5e1f,6cf938a30faf4758a85f1167eff0000b,','讨论组聊天记录','90','/hmrtgroupchat/hmrtGroupChat','','','0','hmrtgroupchat:hmrtGroupChat:view,hmrtgroupchat:hmrtGroupChat:edit','1','2016-11-22 17:52:08','1','2016-11-22 17:56:52','','0'),('42','41','0,1,31,40,41,','文章模型','40','/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','查看','30',NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','修改','40',NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','审核','50',NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','链接模型','60','/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','查看','30',NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','修改','40',NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看','30','','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('49','46','0,1,31,40,41,46,','审核','50',NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4a003836ad4e4f329eb0fb25a8018e0d','75e1c27ff0144cf297d6b56bd3353a51','0,1,ccc626c15e1a4cec9261a273871d5e1f,75e1c27ff0144cf297d6b56bd3353a51,','病历标签关系','60','/hmrtarticletags/hmrtArticleTags','','','1','hmrtarticletags:hmrtArticleTags:view,hmrtarticletags:hmrtArticleTags:edit','1','2016-11-22 17:50:19','1','2016-11-22 17:50:19','','0'),('5','4','0,1,2,3,4,','查看','30',NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','评论管理','40','/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','查看','30',NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','审核','40',NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','公共留言','80','/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','查看','30',NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','审核','40',NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','文件管理','90','/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','查看','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','上传','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','修改','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','修改','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','统计分析','600',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','信息量统计','30','/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','在线办公','200',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','62','0,1,62,','个人办公','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','请假办理','300','/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','查看','30',NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','修改','40',NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','日志查询','985',NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','日志查询','30','/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','流程管理','300',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6cf938a30faf4758a85f1167eff0000b','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','聊天管理','5210','','','','1','','1','2016-11-22 17:50:40','1','2016-11-22 17:50:40','','0'),('7','3','0,1,2,3,','角色管理','50','/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','流程管理','50','/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','文件管理','90',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','模型管理','100','/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','我的任务','50','/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','审批测试','100','/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','在线演示','3000',NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('75e1c27ff0144cf297d6b56bd3353a51','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','病例标签','5150','','','','1','','1','2016-11-22 17:48:06','1','2016-11-22 17:48:06','','0'),('79','1','0,1,','代码生成','5000',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('8','7','0,1,2,3,7,','查看','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','生成方案配置','30','/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','业务表配置','20','/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','代码模板管理','90','/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','连接池监视','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','行政区域','80','/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','组件演示','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','组件演示','30','/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','通知通告','20','','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','我的通告','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9','7','0,1,2,3,7,','修改','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理','50','/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('a1be747c0276477d82b2d47f9012736c','6cf938a30faf4758a85f1167eff0000b','0,1,ccc626c15e1a4cec9261a273871d5e1f,6cf938a30faf4758a85f1167eff0000b,','聊天分组','30','/hmrtgroup/hmrtGroup','','','1','hmrtgroup:hmrtGroup:view,hmrtgroup:hmrtGroup:edit','1','2016-11-22 17:51:11','1','2016-11-22 17:51:11','','0'),('a5aad88a320c4bbeb775a30286d97068','33ca702e9b734f2795d82524dde9b3aa','0,1,ccc626c15e1a4cec9261a273871d5e1f,33ca702e9b734f2795d82524dde9b3aa,','积分日志','30','/hmrtscorelog/hmrtScoreLog','','','1','hmrtscorelog:hmrtScoreLog:view,hmrtscorelog:hmrtScoreLog:edit','1','2016-11-22 17:49:13','1','2016-11-22 17:49:13','','0'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑','60','','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表','60','/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b79bc81107a44c2bb1ee0f4c6021ba1a','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','积分规则','5120','','','','1','','1','2016-11-22 17:47:27','1','2016-11-22 17:47:27','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表','30','/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('bf9e74cbc8c048b38d1f6244347083ee','6cf938a30faf4758a85f1167eff0000b','0,1,ccc626c15e1a4cec9261a273871d5e1f,6cf938a30faf4758a85f1167eff0000b,','分组用户','120','/hmrtgroupuser/hmrtGroupUser','','','1','hmrtgroupuser:hmrtGroupUser:view,hmrtgroupuser:hmrtGroupUser:edit','1','2016-11-22 17:52:36','1','2016-11-22 17:52:36','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看','30','','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('ccc626c15e1a4cec9261a273871d5e1f','1','0,1,','哈特','5030','','','','1','','1','2016-11-22 17:40:16','1','2016-11-22 17:40:16','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑','60','','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('d9a42152d22b4159a02d9794c180675d','ccc626c15e1a4cec9261a273871d5e1f','0,1,ccc626c15e1a4cec9261a273871d5e1f,','患者管理','5060','','','','1','','1','2016-11-22 17:41:20','1','2016-11-22 17:42:10','','0'),('db3e2da0e7bb4096aa9068e5a4033614','d9a42152d22b4159a02d9794c180675d','0,1,ccc626c15e1a4cec9261a273871d5e1f,d9a42152d22b4159a02d9794c180675d,','患者管理','30','/hmrtpatient/hmrtPatient','','','1','hmrtpatient:hmrtPatient:view,hmrtpatient:hmrtPatient:edit','1','2016-11-22 17:43:11','1','2016-11-22 17:43:11','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看','30','','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('f223faae18fd47bb95673b590be08f8e','0c6ba2d1dd634a3186c908a8dfa52318','0,1,ccc626c15e1a4cec9261a273871d5e1f,0c6ba2d1dd634a3186c908a8dfa52318,','活动点赞','30','/hmrtlike/hmrtLike','','','1','hmrtlike:hmrtLike:view,hmrtlike:hmrtLike:edit','1','2016-11-22 17:47:12','1','2016-11-22 17:47:12','','0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','山东省总公司','10','2','100000','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','7','0,1,7,','市场部','30','3','200003','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','7','0,1,7,','技术部','40','3','200004','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','7','0,1,7,','历城区分公司','0','4','201000','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','12','0,1,7,12,','公司领导','10','4','201001','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','12','0,1,7,12,','综合部','20','4','201002','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','12','0,1,7,12,','市场部','30','4','201003','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','12','0,1,7,12,','技术部','40','4','201004','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','0,1,7,','历下区分公司','40','5','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,7,17,','公司领导','10','5','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,7,17,','综合部','20','5','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','公司领导','10','2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','17','0,1,7,17,','市场部','30','5','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','17','0,1,7,17,','技术部','40','5','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','7','0,1,7,','高新区分公司','50','6','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','22','0,1,7,22,','公司领导','10','6','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','22','0,1,7,22,','综合部','20','6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','22','0,1,7,22,','市场部','30','6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','22','0,1,7,22,','技术部','40','6','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','综合部','20','2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','市场部','30','2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','技术部','40','2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','研发部','50','2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','1','0,1,','济南市分公司','20','3','200000','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','7','0,1,7,','公司领导','10','3','200001','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','7','0,1,7,','综合部','20','3','200002','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','1','系统管理员','dept','assignment','1',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','公司管理员','hr','assignment','2',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','本公司管理员','a','assignment','3',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','部门管理员','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','本部门管理员','c','assignment','5',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','普通用户','d','assignment','8',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','7','济南市管理员','e','assignment','9',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','75'),('1','76'),('1','77'),('1','78'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','83'),('1','84'),('1','85'),('1','86'),('1','87'),('1','88'),('1','89'),('1','9'),('1','90'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','75'),('2','76'),('2','77'),('2','78'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','83'),('2','84'),('2','85'),('2','86'),('2','87'),('2','88'),('2','89'),('2','9'),('2','90'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `level` char(1) DEFAULT NULL,
  `hospital` varchar(512) DEFAULT NULL,
  `isturn` char(1) DEFAULT NULL,
  `score` varchar(64) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `openId` varchar(64) DEFAULT NULL,
  `income` varchar(32) DEFAULT NULL,
  `cert` varchar(128) DEFAULT NULL,
  `dept` varchar(128) DEFAULT NULL,
  `prof` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`level`,`hospital`,`isturn`,`score`,`token`,`openId`,`income`,`cert`,`dept`,`prof`) values ('1','1','2','thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','thinkgem@163.com','8675','8675',NULL,NULL,'222.128.190.45','2016-11-22 23:12:53','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','最高管理员','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('10','7','11','jn_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0010','济南技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('11','12','13','lc_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0011','济南历城领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('12','12','18','lx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0012','济南历下领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('13','22','23','gx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','济南高新领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','1','2','sd_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3287b3081c3b402abe8601e527bea0db',NULL,NULL,'test','4fff46b59e139bbfd910b4e4b0e5f27d4bbc2aa79bf5f1c703ab2d3f','0000','王医生','','','','3','',NULL,NULL,'1','1','2016-11-22 23:06:46','1','2016-11-22 23:06:46','test test test test','0','C','北京协和医院','1','0',NULL,NULL,'100',NULL,NULL,NULL),('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('40eb07dc30b54c268c8fe5999a2b9cc6',NULL,NULL,'123','8db6989d048778705edeed24f5631dade91503f1116c0eec64295893','0000','d','','','','','',NULL,NULL,'1','1','2016-11-22 23:05:39','1','2016-11-22 23:05:39','','0','','','','0',NULL,NULL,'',NULL,NULL,NULL),('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6','1','6','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','7','8','jn_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0007','济南领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8','7','9','jn_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0008','济南综合部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9','7','10','jn_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0009','济南市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','1'),('1','2'),('10','2'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','2'),('3287b3081c3b402abe8601e527bea0db','2'),('3287b3081c3b402abe8601e527bea0db','6'),('4','3'),('40eb07dc30b54c268c8fe5999a2b9cc6','2'),('5','4'),('6','5'),('7','2'),('7','7'),('8','2'),('9','1');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data` */

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data_main` */

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';

/*Data for the table `test_tree` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
