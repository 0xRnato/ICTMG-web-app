-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_overrides`
--

DROP TABLE IF EXISTS `mdl_assign_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `allowsubmissionsfromdate` bigint(10) DEFAULT NULL,
  `duedate` bigint(10) DEFAULT NULL,
  `cutoffdate` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_assiover_ass_ix` (`assignid`),
  KEY `mdl_assiover_gro_ix` (`groupid`),
  KEY `mdl_assiover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to assign settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_overrides`
--

LOCK TABLES `mdl_assign_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_assign_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_flags`
--

LOCK TABLES `mdl_assign_user_flags` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_annot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_annot`
--

LOCK TABLES `mdl_assignfeedback_editpdf_annot` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_cmnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_cmnt`
--

LOCK TABLES `mdl_assignfeedback_editpdf_cmnt` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_queue`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `submissionattempt` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Queue for processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_queue`
--

LOCK TABLES `mdl_assignfeedback_editpdf_queue` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_quick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_quick`
--

LOCK TABLES `mdl_assignfeedback_editpdf_quick` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_upgrade`
--

DROP TABLE IF EXISTS `mdl_assignment_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about upgraded assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_upgrade`
--

LOCK TABLES `mdl_assignment_upgrade` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge`
--

LOCK TABLES `mdl_badge` WRITE;
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_backpack`
--

LOCK TABLES `mdl_badge_backpack` WRITE;
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria`
--

LOCK TABLES `mdl_badge_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_met`
--

LOCK TABLES `mdl_badge_criteria_met` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_param`
--

LOCK TABLES `mdl_badge_criteria_param` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_external`
--

LOCK TABLES `mdl_badge_external` WRITE;
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_issued`
--

LOCK TABLES `mdl_badge_issued` WRITE;
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_manual_award`
--

LOCK TABLES `mdl_badge_manual_award` WRITE;
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',0,0,1),(2,'activity_results',0,0,1),(3,'admin_bookmarks',0,0,1),(4,'badges',0,0,1),(5,'blog_menu',0,0,1),(6,'blog_recent',0,0,1),(7,'blog_tags',0,0,1),(8,'calendar_month',0,0,1),(9,'calendar_upcoming',0,0,1),(10,'comments',0,0,1),(11,'community',0,0,1),(12,'completionstatus',0,0,1),(13,'course_list',0,0,1),(14,'course_overview',0,0,1),(15,'course_summary',0,0,1),(16,'feedback',0,0,1),(17,'globalsearch',0,0,1),(18,'glossary_random',0,0,1),(19,'html',0,0,1),(20,'login',0,0,1),(21,'lp',0,0,1),(22,'mentees',0,0,1),(23,'messages',0,0,1),(24,'mnet_hosts',0,0,1),(25,'myprofile',0,0,1),(26,'navigation',0,0,1),(27,'news_items',0,0,1),(28,'online_users',0,0,1),(29,'participants',0,0,1),(30,'private_files',0,0,1),(31,'quiz_results',0,0,0),(32,'recent_activity',86400,0,1),(33,'rss_client',300,0,1),(34,'search_forums',0,0,1),(35,'section_links',0,0,1),(36,'selfcompletion',0,0,1),(37,'settings',0,0,1),(38,'site_main_menu',0,0,1),(39,'social_activities',0,0,1),(40,'tag_flickr',0,0,1),(41,'tag_youtube',0,0,0),(42,'tags',0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `requiredbytheme` smallint(4) NOT NULL DEFAULT '0',
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'admin_bookmarks',1,0,0,'admin-*',NULL,'side-pre',2,''),(2,'private_files',1,0,0,'my-index','2','side-post',0,''),(3,'online_users',1,0,0,'my-index','2','side-post',1,''),(4,'badges',1,0,0,'my-index','2','side-post',2,''),(5,'calendar_month',1,0,0,'my-index','2','side-post',3,''),(6,'calendar_upcoming',1,0,0,'my-index','2','side-post',4,''),(7,'lp',1,0,0,'my-index','2','content',0,''),(8,'course_overview',1,0,0,'my-index','2','content',1,''),(9,'private_files',5,0,0,'my-index','3','side-post',0,''),(10,'online_users',5,0,0,'my-index','3','side-post',1,''),(11,'badges',5,0,0,'my-index','3','side-post',2,''),(12,'calendar_month',5,0,0,'my-index','3','side-post',3,''),(13,'calendar_upcoming',5,0,0,'my-index','3','side-post',4,''),(14,'lp',5,0,0,'my-index','3','content',0,''),(15,'course_overview',5,0,0,'my-index','3','content',1,''),(23,'private_files',31,0,0,'my-index','7','side-post',0,''),(24,'online_users',31,0,0,'my-index','7','side-post',1,''),(25,'badges',31,0,0,'my-index','7','side-post',2,''),(26,'calendar_month',31,0,0,'my-index','7','side-post',3,''),(27,'calendar_upcoming',31,0,0,'my-index','7','side-post',4,''),(28,'lp',31,0,0,'my-index','7','content',0,''),(29,'course_overview',31,0,0,'my-index','7','content',1,''),(30,'private_files',39,0,0,'my-index','8','side-post',0,''),(31,'online_users',39,0,0,'my-index','8','side-post',1,''),(32,'badges',39,0,0,'my-index','8','side-post',2,''),(33,'calendar_month',39,0,0,'my-index','8','side-post',3,''),(34,'calendar_upcoming',39,0,0,'my-index','8','side-post',4,''),(35,'lp',39,0,0,'my-index','8','content',0,''),(36,'course_overview',39,0,0,'my-index','8','content',1,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_recent_activity`
--

DROP TABLE IF EXISTS `mdl_block_recent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Recent activity block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_recent_activity`
--

LOCK TABLES `mdl_block_recent_activity` WRITE;
/*!40000 ALTER TABLE `mdl_block_recent_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_recent_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (1,'userpreferenceschanged','2',1487542301,'1',1487549501),(2,'userpreferenceschanged','3',1484875306,'1',1484882506),(3,'accesslib/dirtycontexts','/1/22',1484875668,'1',1484882868),(4,'userpreferenceschanged','4',1485311357,'1',1485318557),(5,'accesslib/dirtycontexts','/1/23/24',1485358137,'1',1485365337),(6,'accesslib/dirtycontexts','/1/23/25',1485358137,'1',1485365337),(7,'accesslib/dirtycontexts','/1/23/26',1485358137,'1',1485365337),(8,'accesslib/dirtycontexts','/1/23/27',1485358137,'1',1485365337),(9,'accesslib/dirtycontexts','/1/23/28',1485358137,'1',1485365337),(10,'accesslib/dirtycontexts','/1/23/29',1485358137,'1',1485365337),(11,'accesslib/dirtycontexts','/1/23/30',1485358137,'1',1485365337),(12,'accesslib/dirtycontexts','/1/23',1485358137,'1',1485365337),(13,'userpreferenceschanged','5',1485994820,'1',1486002020),(14,'userpreferenceschanged','6',1486666826,'1',1486674026),(15,'accesslib/dirtycontexts','/1/47',1486953375,'1',1486960575),(16,'accesslib/dirtycontexts','/1/47/48',1486953621,'1',1486960821),(17,'accesslib/dirtycontexts','/1/47/50',1486953950,'1',1486961150),(18,'accesslib/dirtycontexts','/1/3/51',1486954002,'1',1486961202);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:configview','read',10,'moodle',0),(3,'moodle/site:readallmessages','read',10,'moodle',8),(4,'moodle/site:manageallmessaging','write',10,'moodle',8),(5,'moodle/site:deleteanymessage','write',10,'moodle',32),(6,'moodle/site:sendmessage','write',10,'moodle',16),(7,'moodle/site:deleteownmessage','write',10,'moodle',0),(8,'moodle/site:approvecourse','write',10,'moodle',4),(9,'moodle/backup:backupcourse','write',50,'moodle',28),(10,'moodle/backup:backupsection','write',50,'moodle',28),(11,'moodle/backup:backupactivity','write',70,'moodle',28),(12,'moodle/backup:backuptargethub','write',50,'moodle',28),(13,'moodle/backup:backuptargetimport','write',50,'moodle',28),(14,'moodle/backup:downloadfile','write',50,'moodle',28),(15,'moodle/backup:configure','write',50,'moodle',28),(16,'moodle/backup:userinfo','read',50,'moodle',8),(17,'moodle/backup:anonymise','read',50,'moodle',8),(18,'moodle/restore:restorecourse','write',50,'moodle',28),(19,'moodle/restore:restoresection','write',50,'moodle',28),(20,'moodle/restore:restoreactivity','write',50,'moodle',28),(21,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(22,'moodle/restore:restoretargethub','write',50,'moodle',28),(23,'moodle/restore:restoretargetimport','write',50,'moodle',28),(24,'moodle/restore:uploadfile','write',50,'moodle',28),(25,'moodle/restore:configure','write',50,'moodle',28),(26,'moodle/restore:rolldates','write',50,'moodle',0),(27,'moodle/restore:userinfo','write',50,'moodle',30),(28,'moodle/restore:createuser','write',10,'moodle',24),(29,'moodle/site:manageblocks','write',80,'moodle',20),(30,'moodle/site:accessallgroups','read',50,'moodle',0),(31,'moodle/site:viewfullnames','read',50,'moodle',0),(32,'moodle/site:viewuseridentity','read',50,'moodle',0),(33,'moodle/site:viewreports','read',50,'moodle',8),(34,'moodle/site:trustcontent','write',50,'moodle',4),(35,'moodle/site:uploadusers','write',10,'moodle',24),(36,'moodle/filter:manage','write',50,'moodle',0),(37,'moodle/user:create','write',10,'moodle',24),(38,'moodle/user:delete','write',10,'moodle',8),(39,'moodle/user:update','write',10,'moodle',24),(40,'moodle/user:viewdetails','read',50,'moodle',0),(41,'moodle/user:viewalldetails','read',30,'moodle',8),(42,'moodle/user:viewlastip','read',30,'moodle',8),(43,'moodle/user:viewhiddendetails','read',50,'moodle',8),(44,'moodle/user:loginas','write',50,'moodle',30),(45,'moodle/user:managesyspages','write',10,'moodle',0),(46,'moodle/user:manageblocks','write',30,'moodle',0),(47,'moodle/user:manageownblocks','write',10,'moodle',0),(48,'moodle/user:manageownfiles','write',10,'moodle',0),(49,'moodle/user:ignoreuserquota','write',10,'moodle',0),(50,'moodle/my:configsyspages','write',10,'moodle',0),(51,'moodle/role:assign','write',50,'moodle',28),(52,'moodle/role:review','read',50,'moodle',8),(53,'moodle/role:override','write',50,'moodle',28),(54,'moodle/role:safeoverride','write',50,'moodle',16),(55,'moodle/role:manage','write',10,'moodle',28),(56,'moodle/role:switchroles','read',50,'moodle',12),(57,'moodle/category:manage','write',40,'moodle',4),(58,'moodle/category:viewhiddencategories','read',40,'moodle',0),(59,'moodle/cohort:manage','write',40,'moodle',0),(60,'moodle/cohort:assign','write',40,'moodle',0),(61,'moodle/cohort:view','read',50,'moodle',0),(62,'moodle/course:create','write',40,'moodle',4),(63,'moodle/course:request','write',10,'moodle',0),(64,'moodle/course:delete','write',50,'moodle',32),(65,'moodle/course:update','write',50,'moodle',4),(66,'moodle/course:view','read',50,'moodle',0),(67,'moodle/course:enrolreview','read',50,'moodle',8),(68,'moodle/course:enrolconfig','write',50,'moodle',8),(69,'moodle/course:reviewotherusers','read',50,'moodle',0),(70,'moodle/course:bulkmessaging','write',50,'moodle',16),(71,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(72,'moodle/course:viewhiddencourses','read',50,'moodle',0),(73,'moodle/course:visibility','write',50,'moodle',0),(74,'moodle/course:managefiles','write',50,'moodle',4),(75,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(76,'moodle/course:manageactivities','write',70,'moodle',4),(77,'moodle/course:activityvisibility','write',70,'moodle',0),(78,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(79,'moodle/course:viewparticipants','read',50,'moodle',0),(80,'moodle/course:changefullname','write',50,'moodle',4),(81,'moodle/course:changeshortname','write',50,'moodle',4),(82,'moodle/course:renameroles','write',50,'moodle',0),(83,'moodle/course:changeidnumber','write',50,'moodle',4),(84,'moodle/course:changecategory','write',50,'moodle',4),(85,'moodle/course:changesummary','write',50,'moodle',4),(86,'moodle/site:viewparticipants','read',10,'moodle',0),(87,'moodle/course:isincompletionreports','read',50,'moodle',0),(88,'moodle/course:viewscales','read',50,'moodle',0),(89,'moodle/course:managescales','write',50,'moodle',0),(90,'moodle/course:managegroups','write',50,'moodle',0),(91,'moodle/course:reset','write',50,'moodle',32),(92,'moodle/course:viewsuspendedusers','read',10,'moodle',0),(93,'moodle/course:tag','write',50,'moodle',16),(94,'moodle/blog:view','read',10,'moodle',0),(95,'moodle/blog:search','read',10,'moodle',0),(96,'moodle/blog:viewdrafts','read',10,'moodle',8),(97,'moodle/blog:create','write',10,'moodle',16),(98,'moodle/blog:manageentries','write',10,'moodle',16),(99,'moodle/blog:manageexternal','write',10,'moodle',16),(100,'moodle/calendar:manageownentries','write',50,'moodle',16),(101,'moodle/calendar:managegroupentries','write',50,'moodle',16),(102,'moodle/calendar:manageentries','write',50,'moodle',16),(103,'moodle/user:editprofile','write',30,'moodle',24),(104,'moodle/user:editownprofile','write',10,'moodle',16),(105,'moodle/user:changeownpassword','write',10,'moodle',0),(106,'moodle/user:readuserposts','read',30,'moodle',0),(107,'moodle/user:readuserblogs','read',30,'moodle',0),(108,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(109,'moodle/user:editmessageprofile','write',30,'moodle',16),(110,'moodle/user:editownmessageprofile','write',10,'moodle',0),(111,'moodle/question:managecategory','write',50,'moodle',20),(112,'moodle/question:add','write',50,'moodle',20),(113,'moodle/question:editmine','write',50,'moodle',20),(114,'moodle/question:editall','write',50,'moodle',20),(115,'moodle/question:viewmine','read',50,'moodle',0),(116,'moodle/question:viewall','read',50,'moodle',0),(117,'moodle/question:usemine','read',50,'moodle',0),(118,'moodle/question:useall','read',50,'moodle',0),(119,'moodle/question:movemine','write',50,'moodle',0),(120,'moodle/question:moveall','write',50,'moodle',0),(121,'moodle/question:config','write',10,'moodle',2),(122,'moodle/question:flag','write',50,'moodle',0),(123,'moodle/site:doclinks','read',10,'moodle',0),(124,'moodle/course:sectionvisibility','write',50,'moodle',0),(125,'moodle/course:useremail','write',50,'moodle',0),(126,'moodle/course:viewhiddensections','write',50,'moodle',0),(127,'moodle/course:setcurrentsection','write',50,'moodle',0),(128,'moodle/course:movesections','write',50,'moodle',0),(129,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(130,'moodle/grade:viewall','read',50,'moodle',8),(131,'moodle/grade:view','read',50,'moodle',0),(132,'moodle/grade:viewhidden','read',50,'moodle',8),(133,'moodle/grade:import','write',50,'moodle',12),(134,'moodle/grade:export','read',50,'moodle',8),(135,'moodle/grade:manage','write',50,'moodle',12),(136,'moodle/grade:edit','write',50,'moodle',12),(137,'moodle/grade:managegradingforms','write',50,'moodle',12),(138,'moodle/grade:sharegradingforms','write',10,'moodle',4),(139,'moodle/grade:managesharedforms','write',10,'moodle',4),(140,'moodle/grade:manageoutcomes','write',50,'moodle',0),(141,'moodle/grade:manageletters','write',50,'moodle',0),(142,'moodle/grade:hide','write',50,'moodle',0),(143,'moodle/grade:lock','write',50,'moodle',0),(144,'moodle/grade:unlock','write',50,'moodle',0),(145,'moodle/my:manageblocks','write',10,'moodle',0),(146,'moodle/notes:view','read',50,'moodle',0),(147,'moodle/notes:manage','write',50,'moodle',16),(148,'moodle/tag:manage','write',10,'moodle',16),(149,'moodle/tag:edit','write',10,'moodle',16),(150,'moodle/tag:flag','write',10,'moodle',16),(151,'moodle/tag:editblocks','write',10,'moodle',0),(152,'moodle/block:view','read',80,'moodle',0),(153,'moodle/block:edit','write',80,'moodle',20),(154,'moodle/portfolio:export','read',10,'moodle',0),(155,'moodle/comment:view','read',50,'moodle',0),(156,'moodle/comment:post','write',50,'moodle',24),(157,'moodle/comment:delete','write',50,'moodle',32),(158,'moodle/webservice:createtoken','write',10,'moodle',62),(159,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(160,'moodle/rating:view','read',50,'moodle',0),(161,'moodle/rating:viewany','read',50,'moodle',8),(162,'moodle/rating:viewall','read',50,'moodle',8),(163,'moodle/rating:rate','write',50,'moodle',0),(164,'moodle/course:publish','write',10,'moodle',24),(165,'moodle/course:markcomplete','write',50,'moodle',0),(166,'moodle/community:add','write',10,'moodle',0),(167,'moodle/community:download','write',10,'moodle',0),(168,'moodle/badges:manageglobalsettings','write',10,'moodle',34),(169,'moodle/badges:viewbadges','read',50,'moodle',0),(170,'moodle/badges:manageownbadges','write',30,'moodle',0),(171,'moodle/badges:viewotherbadges','read',30,'moodle',0),(172,'moodle/badges:earnbadge','write',50,'moodle',0),(173,'moodle/badges:createbadge','write',50,'moodle',16),(174,'moodle/badges:deletebadge','write',50,'moodle',32),(175,'moodle/badges:configuredetails','write',50,'moodle',16),(176,'moodle/badges:configurecriteria','write',50,'moodle',4),(177,'moodle/badges:configuremessages','write',50,'moodle',16),(178,'moodle/badges:awardbadge','write',50,'moodle',16),(179,'moodle/badges:revokebadge','write',50,'moodle',16),(180,'moodle/badges:viewawarded','read',50,'moodle',8),(181,'moodle/site:forcelanguage','read',10,'moodle',0),(182,'moodle/search:query','read',10,'moodle',0),(183,'moodle/competency:competencymanage','write',40,'moodle',0),(184,'moodle/competency:competencyview','read',40,'moodle',0),(185,'moodle/competency:competencygrade','write',50,'moodle',0),(186,'moodle/competency:coursecompetencymanage','write',50,'moodle',0),(187,'moodle/competency:coursecompetencyconfigure','write',70,'moodle',0),(188,'moodle/competency:coursecompetencygradable','read',50,'moodle',0),(189,'moodle/competency:coursecompetencyview','read',50,'moodle',0),(190,'moodle/competency:evidencedelete','write',30,'moodle',0),(191,'moodle/competency:planmanage','write',30,'moodle',0),(192,'moodle/competency:planmanagedraft','write',30,'moodle',0),(193,'moodle/competency:planmanageown','write',30,'moodle',0),(194,'moodle/competency:planmanageowndraft','write',30,'moodle',0),(195,'moodle/competency:planview','read',30,'moodle',0),(196,'moodle/competency:planviewdraft','read',30,'moodle',0),(197,'moodle/competency:planviewown','read',30,'moodle',0),(198,'moodle/competency:planviewowndraft','read',30,'moodle',0),(199,'moodle/competency:planrequestreview','write',30,'moodle',0),(200,'moodle/competency:planrequestreviewown','write',30,'moodle',0),(201,'moodle/competency:planreview','write',30,'moodle',0),(202,'moodle/competency:plancomment','write',30,'moodle',0),(203,'moodle/competency:plancommentown','write',30,'moodle',0),(204,'moodle/competency:usercompetencyview','read',30,'moodle',0),(205,'moodle/competency:usercompetencyrequestreview','write',30,'moodle',0),(206,'moodle/competency:usercompetencyrequestreviewown','write',30,'moodle',0),(207,'moodle/competency:usercompetencyreview','write',30,'moodle',0),(208,'moodle/competency:usercompetencycomment','write',30,'moodle',0),(209,'moodle/competency:usercompetencycommentown','write',30,'moodle',0),(210,'moodle/competency:templatemanage','write',40,'moodle',0),(211,'moodle/competency:templateview','read',40,'moodle',0),(212,'moodle/competency:userevidencemanage','write',30,'moodle',0),(213,'moodle/competency:userevidencemanageown','write',30,'moodle',0),(214,'moodle/competency:userevidenceview','read',30,'moodle',0),(215,'moodle/site:maintenanceaccess','write',10,'moodle',0),(216,'mod/assign:view','read',70,'mod_assign',0),(217,'mod/assign:submit','write',70,'mod_assign',0),(218,'mod/assign:grade','write',70,'mod_assign',4),(219,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(220,'mod/assign:addinstance','write',50,'mod_assign',4),(221,'mod/assign:editothersubmission','write',70,'mod_assign',41),(222,'mod/assign:grantextension','write',70,'mod_assign',0),(223,'mod/assign:revealidentities','write',70,'mod_assign',0),(224,'mod/assign:reviewgrades','write',70,'mod_assign',0),(225,'mod/assign:releasegrades','write',70,'mod_assign',0),(226,'mod/assign:managegrades','write',70,'mod_assign',0),(227,'mod/assign:manageallocations','write',70,'mod_assign',0),(228,'mod/assign:viewgrades','read',70,'mod_assign',0),(229,'mod/assign:viewblinddetails','write',70,'mod_assign',8),(230,'mod/assign:receivegradernotifications','read',70,'mod_assign',0),(231,'mod/assign:manageoverrides','write',70,'mod_assign',0),(232,'mod/assignment:view','read',70,'mod_assignment',0),(233,'mod/assignment:addinstance','write',50,'mod_assignment',4),(234,'mod/assignment:submit','write',70,'mod_assignment',0),(235,'mod/assignment:grade','write',70,'mod_assignment',4),(236,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(237,'mod/book:addinstance','write',50,'mod_book',4),(238,'mod/book:read','read',70,'mod_book',0),(239,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(240,'mod/book:edit','write',70,'mod_book',4),(241,'mod/chat:addinstance','write',50,'mod_chat',4),(242,'mod/chat:chat','write',70,'mod_chat',16),(243,'mod/chat:readlog','read',70,'mod_chat',0),(244,'mod/chat:deletelog','write',70,'mod_chat',0),(245,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(246,'mod/chat:exportsession','read',70,'mod_chat',8),(247,'mod/chat:view','read',70,'mod_chat',0),(248,'mod/choice:addinstance','write',50,'mod_choice',4),(249,'mod/choice:choose','write',70,'mod_choice',0),(250,'mod/choice:readresponses','read',70,'mod_choice',0),(251,'mod/choice:deleteresponses','write',70,'mod_choice',0),(252,'mod/choice:downloadresponses','read',70,'mod_choice',0),(253,'mod/choice:view','read',70,'mod_choice',0),(254,'mod/data:addinstance','write',50,'mod_data',4),(255,'mod/data:viewentry','read',70,'mod_data',0),(256,'mod/data:writeentry','write',70,'mod_data',16),(257,'mod/data:comment','write',70,'mod_data',16),(258,'mod/data:rate','write',70,'mod_data',0),(259,'mod/data:viewrating','read',70,'mod_data',0),(260,'mod/data:viewanyrating','read',70,'mod_data',8),(261,'mod/data:viewallratings','read',70,'mod_data',8),(262,'mod/data:approve','write',70,'mod_data',16),(263,'mod/data:manageentries','write',70,'mod_data',16),(264,'mod/data:managecomments','write',70,'mod_data',16),(265,'mod/data:managetemplates','write',70,'mod_data',20),(266,'mod/data:viewalluserpresets','read',70,'mod_data',0),(267,'mod/data:manageuserpresets','write',70,'mod_data',20),(268,'mod/data:exportentry','read',70,'mod_data',8),(269,'mod/data:exportownentry','read',70,'mod_data',0),(270,'mod/data:exportallentries','read',70,'mod_data',8),(271,'mod/data:exportuserinfo','read',70,'mod_data',8),(272,'mod/data:view','read',70,'mod_data',0),(273,'mod/feedback:addinstance','write',50,'mod_feedback',4),(274,'mod/feedback:view','read',70,'mod_feedback',0),(275,'mod/feedback:complete','write',70,'mod_feedback',16),(276,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(277,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(278,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(279,'mod/feedback:edititems','write',70,'mod_feedback',20),(280,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(281,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(282,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(283,'mod/feedback:viewreports','read',70,'mod_feedback',8),(284,'mod/feedback:receivemail','read',70,'mod_feedback',8),(285,'mod/folder:addinstance','write',50,'mod_folder',4),(286,'mod/folder:view','read',70,'mod_folder',0),(287,'mod/folder:managefiles','write',70,'mod_folder',16),(288,'mod/forum:addinstance','write',50,'mod_forum',4),(289,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(290,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(291,'mod/forum:startdiscussion','write',70,'mod_forum',16),(292,'mod/forum:replypost','write',70,'mod_forum',16),(293,'mod/forum:addnews','write',70,'mod_forum',16),(294,'mod/forum:replynews','write',70,'mod_forum',16),(295,'mod/forum:viewrating','read',70,'mod_forum',0),(296,'mod/forum:viewanyrating','read',70,'mod_forum',8),(297,'mod/forum:viewallratings','read',70,'mod_forum',8),(298,'mod/forum:rate','write',70,'mod_forum',0),(299,'mod/forum:createattachment','write',70,'mod_forum',16),(300,'mod/forum:deleteownpost','read',70,'mod_forum',0),(301,'mod/forum:deleteanypost','read',70,'mod_forum',0),(302,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(303,'mod/forum:movediscussions','read',70,'mod_forum',0),(304,'mod/forum:pindiscussions','write',70,'mod_forum',0),(305,'mod/forum:editanypost','write',70,'mod_forum',16),(306,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(307,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(308,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(309,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(310,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(311,'mod/forum:exportpost','read',70,'mod_forum',8),(312,'mod/forum:exportownpost','read',70,'mod_forum',8),(313,'mod/forum:addquestion','write',70,'mod_forum',16),(314,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(315,'mod/forum:canposttomygroups','write',70,'mod_forum',0),(316,'mod/forum:canoverridediscussionlock','write',70,'mod_forum',0),(317,'mod/glossary:addinstance','write',50,'mod_glossary',4),(318,'mod/glossary:view','read',70,'mod_glossary',0),(319,'mod/glossary:write','write',70,'mod_glossary',16),(320,'mod/glossary:manageentries','write',70,'mod_glossary',16),(321,'mod/glossary:managecategories','write',70,'mod_glossary',16),(322,'mod/glossary:comment','write',70,'mod_glossary',16),(323,'mod/glossary:managecomments','write',70,'mod_glossary',16),(324,'mod/glossary:import','write',70,'mod_glossary',16),(325,'mod/glossary:export','read',70,'mod_glossary',0),(326,'mod/glossary:approve','write',70,'mod_glossary',16),(327,'mod/glossary:rate','write',70,'mod_glossary',0),(328,'mod/glossary:viewrating','read',70,'mod_glossary',0),(329,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(330,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(331,'mod/glossary:exportentry','read',70,'mod_glossary',8),(332,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(333,'mod/imscp:view','read',70,'mod_imscp',0),(334,'mod/imscp:addinstance','write',50,'mod_imscp',4),(335,'mod/label:addinstance','write',50,'mod_label',4),(336,'mod/label:view','read',70,'mod_label',0),(337,'mod/lesson:addinstance','write',50,'mod_lesson',4),(338,'mod/lesson:edit','write',70,'mod_lesson',4),(339,'mod/lesson:grade','write',70,'mod_lesson',20),(340,'mod/lesson:viewreports','read',70,'mod_lesson',8),(341,'mod/lesson:manage','write',70,'mod_lesson',0),(342,'mod/lesson:manageoverrides','write',70,'mod_lesson',0),(343,'mod/lesson:view','read',70,'mod_lesson',0),(344,'mod/lti:view','read',70,'mod_lti',0),(345,'mod/lti:addinstance','write',50,'mod_lti',4),(346,'mod/lti:manage','write',70,'mod_lti',8),(347,'mod/lti:addcoursetool','write',50,'mod_lti',0),(348,'mod/lti:requesttooladd','write',50,'mod_lti',0),(349,'mod/page:view','read',70,'mod_page',0),(350,'mod/page:addinstance','write',50,'mod_page',4),(351,'mod/quiz:view','read',70,'mod_quiz',0),(352,'mod/quiz:addinstance','write',50,'mod_quiz',4),(353,'mod/quiz:attempt','write',70,'mod_quiz',16),(354,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(355,'mod/quiz:manage','write',70,'mod_quiz',16),(356,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(357,'mod/quiz:preview','write',70,'mod_quiz',0),(358,'mod/quiz:grade','write',70,'mod_quiz',20),(359,'mod/quiz:regrade','write',70,'mod_quiz',16),(360,'mod/quiz:viewreports','read',70,'mod_quiz',8),(361,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(362,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(363,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(364,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(365,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(366,'mod/resource:view','read',70,'mod_resource',0),(367,'mod/resource:addinstance','write',50,'mod_resource',4),(368,'mod/scorm:addinstance','write',50,'mod_scorm',4),(369,'mod/scorm:viewreport','read',70,'mod_scorm',0),(370,'mod/scorm:skipview','read',70,'mod_scorm',0),(371,'mod/scorm:savetrack','write',70,'mod_scorm',0),(372,'mod/scorm:viewscores','read',70,'mod_scorm',0),(373,'mod/scorm:deleteresponses','write',70,'mod_scorm',0),(374,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(375,'mod/survey:addinstance','write',50,'mod_survey',4),(376,'mod/survey:participate','read',70,'mod_survey',0),(377,'mod/survey:readresponses','read',70,'mod_survey',0),(378,'mod/survey:download','read',70,'mod_survey',0),(379,'mod/url:view','read',70,'mod_url',0),(380,'mod/url:addinstance','write',50,'mod_url',4),(381,'mod/wiki:addinstance','write',50,'mod_wiki',4),(382,'mod/wiki:viewpage','read',70,'mod_wiki',0),(383,'mod/wiki:editpage','write',70,'mod_wiki',16),(384,'mod/wiki:createpage','write',70,'mod_wiki',16),(385,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(386,'mod/wiki:editcomment','write',70,'mod_wiki',16),(387,'mod/wiki:managecomment','write',70,'mod_wiki',0),(388,'mod/wiki:managefiles','write',70,'mod_wiki',0),(389,'mod/wiki:overridelock','write',70,'mod_wiki',0),(390,'mod/wiki:managewiki','write',70,'mod_wiki',0),(391,'mod/workshop:view','read',70,'mod_workshop',0),(392,'mod/workshop:addinstance','write',50,'mod_workshop',4),(393,'mod/workshop:switchphase','write',70,'mod_workshop',0),(394,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(395,'mod/workshop:submit','write',70,'mod_workshop',0),(396,'mod/workshop:peerassess','write',70,'mod_workshop',0),(397,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(398,'mod/workshop:allocate','write',70,'mod_workshop',0),(399,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(400,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(401,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(402,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(403,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(404,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(405,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(406,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(407,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(408,'mod/workshop:deletesubmissions','write',70,'mod_workshop',0),(409,'mod/workshop:exportsubmissions','read',70,'mod_workshop',0),(410,'enrol/category:synchronised','write',10,'enrol_category',0),(411,'enrol/category:config','write',50,'enrol_category',0),(412,'enrol/cohort:config','write',50,'enrol_cohort',0),(413,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(414,'enrol/database:unenrol','write',50,'enrol_database',0),(415,'enrol/database:config','write',50,'enrol_database',0),(416,'enrol/flatfile:manage','write',50,'enrol_flatfile',0),(417,'enrol/flatfile:unenrol','write',50,'enrol_flatfile',0),(418,'enrol/guest:config','write',50,'enrol_guest',0),(419,'enrol/imsenterprise:config','write',50,'enrol_imsenterprise',0),(420,'enrol/ldap:manage','write',50,'enrol_ldap',0),(421,'enrol/lti:config','write',50,'enrol_lti',0),(422,'enrol/lti:unenrol','write',50,'enrol_lti',0),(423,'enrol/manual:config','write',50,'enrol_manual',0),(424,'enrol/manual:enrol','write',50,'enrol_manual',0),(425,'enrol/manual:manage','write',50,'enrol_manual',0),(426,'enrol/manual:unenrol','write',50,'enrol_manual',0),(427,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(428,'enrol/meta:config','write',50,'enrol_meta',0),(429,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(430,'enrol/meta:unenrol','write',50,'enrol_meta',0),(431,'enrol/mnet:config','write',50,'enrol_mnet',0),(432,'enrol/paypal:config','write',50,'enrol_paypal',0),(433,'enrol/paypal:manage','write',50,'enrol_paypal',0),(434,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(435,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(436,'enrol/self:config','write',50,'enrol_self',0),(437,'enrol/self:manage','write',50,'enrol_self',0),(438,'enrol/self:holdkey','write',50,'enrol_self',0),(439,'enrol/self:unenrolself','write',50,'enrol_self',0),(440,'enrol/self:unenrol','write',50,'enrol_self',0),(441,'message/airnotifier:managedevice','write',10,'message_airnotifier',0),(442,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(443,'block/activity_results:addinstance','write',80,'block_activity_results',20),(444,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(445,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(446,'block/badges:addinstance','read',80,'block_badges',0),(447,'block/badges:myaddinstance','read',10,'block_badges',8),(448,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(449,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(450,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(451,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(452,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(453,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(454,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(455,'block/comments:myaddinstance','write',10,'block_comments',0),(456,'block/comments:addinstance','write',80,'block_comments',20),(457,'block/community:myaddinstance','write',10,'block_community',0),(458,'block/community:addinstance','write',80,'block_community',20),(459,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(460,'block/course_list:myaddinstance','write',10,'block_course_list',0),(461,'block/course_list:addinstance','write',80,'block_course_list',20),(462,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(463,'block/course_overview:addinstance','write',80,'block_course_overview',20),(464,'block/course_summary:addinstance','write',80,'block_course_summary',20),(465,'block/feedback:addinstance','write',80,'block_feedback',20),(466,'block/globalsearch:myaddinstance','write',10,'block_globalsearch',0),(467,'block/globalsearch:addinstance','write',80,'block_globalsearch',0),(468,'block/glossary_random:myaddinstance','write',10,'block_glossary_random',0),(469,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(470,'block/html:myaddinstance','write',10,'block_html',0),(471,'block/html:addinstance','write',80,'block_html',20),(472,'block/login:addinstance','write',80,'block_login',20),(473,'block/lp:addinstance','write',10,'block_lp',0),(474,'block/lp:myaddinstance','write',10,'block_lp',0),(475,'block/lp:view','read',10,'block_lp',0),(476,'block/mentees:myaddinstance','write',10,'block_mentees',0),(477,'block/mentees:addinstance','write',80,'block_mentees',20),(478,'block/messages:myaddinstance','write',10,'block_messages',0),(479,'block/messages:addinstance','write',80,'block_messages',20),(480,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(481,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(482,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(483,'block/myprofile:addinstance','write',80,'block_myprofile',20),(484,'block/navigation:myaddinstance','write',10,'block_navigation',0),(485,'block/navigation:addinstance','write',80,'block_navigation',20),(486,'block/news_items:myaddinstance','write',10,'block_news_items',0),(487,'block/news_items:addinstance','write',80,'block_news_items',20),(488,'block/online_users:myaddinstance','write',10,'block_online_users',0),(489,'block/online_users:addinstance','write',80,'block_online_users',20),(490,'block/online_users:viewlist','read',80,'block_online_users',0),(491,'block/participants:addinstance','write',80,'block_participants',20),(492,'block/private_files:myaddinstance','write',10,'block_private_files',0),(493,'block/private_files:addinstance','write',80,'block_private_files',20),(494,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(495,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(496,'block/recent_activity:viewaddupdatemodule','read',50,'block_recent_activity',0),(497,'block/recent_activity:viewdeletemodule','read',50,'block_recent_activity',0),(498,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(499,'block/rss_client:addinstance','write',80,'block_rss_client',20),(500,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(501,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(502,'block/search_forums:addinstance','write',80,'block_search_forums',20),(503,'block/section_links:addinstance','write',80,'block_section_links',20),(504,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(505,'block/settings:myaddinstance','write',10,'block_settings',0),(506,'block/settings:addinstance','write',80,'block_settings',20),(507,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(508,'block/social_activities:addinstance','write',80,'block_social_activities',20),(509,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(510,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(511,'block/tags:myaddinstance','write',10,'block_tags',0),(512,'block/tags:addinstance','write',80,'block_tags',20),(513,'report/completion:view','read',50,'report_completion',8),(514,'report/courseoverview:view','read',10,'report_courseoverview',8),(515,'report/log:view','read',50,'report_log',8),(516,'report/log:viewtoday','read',50,'report_log',8),(517,'report/loglive:view','read',50,'report_loglive',8),(518,'report/outline:view','read',50,'report_outline',8),(519,'report/participation:view','read',50,'report_participation',8),(520,'report/performance:view','read',10,'report_performance',2),(521,'report/progress:view','read',50,'report_progress',8),(522,'report/questioninstances:view','read',10,'report_questioninstances',0),(523,'report/security:view','read',10,'report_security',2),(524,'report/stats:view','read',50,'report_stats',8),(525,'report/usersessions:manageownsessions','write',30,'report_usersessions',0),(526,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(527,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(528,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(529,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(530,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(531,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(532,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(533,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(534,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(535,'gradeimport/direct:view','write',50,'gradeimport_direct',0),(536,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(537,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(538,'gradereport/grader:view','read',50,'gradereport_grader',8),(539,'gradereport/history:view','read',50,'gradereport_history',8),(540,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(541,'gradereport/overview:view','read',50,'gradereport_overview',8),(542,'gradereport/singleview:view','read',50,'gradereport_singleview',8),(543,'gradereport/user:view','read',50,'gradereport_user',8),(544,'webservice/rest:use','read',50,'webservice_rest',0),(545,'webservice/soap:use','read',50,'webservice_soap',0),(546,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',0),(547,'repository/areafiles:view','read',70,'repository_areafiles',0),(548,'repository/boxnet:view','read',70,'repository_boxnet',0),(549,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(550,'repository/dropbox:view','read',70,'repository_dropbox',0),(551,'repository/equella:view','read',70,'repository_equella',0),(552,'repository/filesystem:view','read',70,'repository_filesystem',0),(553,'repository/flickr:view','read',70,'repository_flickr',0),(554,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(555,'repository/googledocs:view','read',70,'repository_googledocs',0),(556,'repository/local:view','read',70,'repository_local',0),(557,'repository/merlot:view','read',70,'repository_merlot',0),(558,'repository/picasa:view','read',70,'repository_picasa',0),(559,'repository/recent:view','read',70,'repository_recent',0),(560,'repository/s3:view','read',70,'repository_s3',0),(561,'repository/skydrive:view','read',70,'repository_skydrive',0),(562,'repository/upload:view','read',70,'repository_upload',0),(563,'repository/url:view','read',70,'repository_url',0),(564,'repository/user:view','read',70,'repository_user',0),(565,'repository/webdav:view','read',70,'repository_webdav',0),(566,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(567,'repository/youtube:view','read',70,'repository_youtube',0),(568,'tool/customlang:view','read',10,'tool_customlang',2),(569,'tool/customlang:edit','write',10,'tool_customlang',6),(570,'tool/lpmigrate:frameworksmigrate','write',10,'tool_lpmigrate',0),(571,'tool/monitor:subscribe','read',50,'tool_monitor',8),(572,'tool/monitor:managerules','write',50,'tool_monitor',4),(573,'tool/monitor:managetool','write',10,'tool_monitor',4),(574,'tool/recyclebin:deleteitems','write',50,'tool_recyclebin',32),(575,'tool/recyclebin:restoreitems','write',50,'tool_recyclebin',0),(576,'tool/recyclebin:viewitems','read',50,'tool_recyclebin',0),(577,'tool/uploaduser:uploaduserpictures','write',10,'tool_uploaduser',16),(578,'tool/usertours:managetours','write',10,'tool_usertours',4),(579,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(580,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(581,'booktool/print:print','read',70,'booktool_print',0),(582,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(583,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(584,'quiz/statistics:view','read',70,'quiz_statistics',0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency`
--

DROP TABLE IF EXISTS `mdl_competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `competencyframeworkid` bigint(10) NOT NULL,
  `parentid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL,
  `ruletype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ruleoutcome` tinyint(2) NOT NULL DEFAULT '0',
  `ruleconfig` longtext COLLATE utf8_unicode_ci,
  `scaleid` bigint(10) DEFAULT NULL,
  `scaleconfiguration` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  KEY `mdl_comp_rul_ix` (`ruleoutcome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains the master record of each competency in ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency`
--

LOCK TABLES `mdl_competency` WRITE;
/*!40000 ALTER TABLE `mdl_competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_coursecomp`
--

DROP TABLE IF EXISTS `mdl_competency_coursecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_coursecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  KEY `mdl_compcour_cou_ix` (`courseid`),
  KEY `mdl_compcour_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a course.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_coursecomp`
--

LOCK TABLES `mdl_competency_coursecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_coursecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_coursecompsetting`
--

DROP TABLE IF EXISTS `mdl_competency_coursecompsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_coursecompsetting` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `pushratingstouserplans` tinyint(2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains the course specific settings for compete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_coursecompsetting`
--

LOCK TABLES `mdl_competency_coursecompsetting` WRITE;
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_evidence`
--

DROP TABLE IF EXISTS `mdl_competency_evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_evidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `usercompetencyid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `actionuserid` bigint(10) DEFAULT NULL,
  `descidentifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `desccomponent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `desca` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compevid_use_ix` (`usercompetencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The evidence linked to a user competency';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_evidence`
--

LOCK TABLES `mdl_competency_evidence` WRITE;
/*!40000 ALTER TABLE `mdl_competency_evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_framework`
--

DROP TABLE IF EXISTS `mdl_competency_framework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_framework` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `scaleid` bigint(11) DEFAULT NULL,
  `scaleconfiguration` longtext COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of competency frameworks.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_framework`
--

LOCK TABLES `mdl_competency_framework` WRITE;
/*!40000 ALTER TABLE `mdl_competency_framework` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_framework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_modulecomp`
--

DROP TABLE IF EXISTS `mdl_competency_modulecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_modulecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  KEY `mdl_compmodu_cmi_ix` (`cmid`),
  KEY `mdl_compmodu_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a module.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_modulecomp`
--

LOCK TABLES `mdl_competency_modulecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_modulecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_modulecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_plan`
--

DROP TABLE IF EXISTS `mdl_competency_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_plan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `templateid` bigint(10) DEFAULT NULL,
  `origtemplateid` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint(10) DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  KEY `mdl_compplan_tem_ix` (`templateid`),
  KEY `mdl_compplan_stadue_ix` (`status`,`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Learning plans';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_plan`
--

LOCK TABLES `mdl_competency_plan` WRITE;
/*!40000 ALTER TABLE `mdl_competency_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_plancomp`
--

DROP TABLE IF EXISTS `mdl_competency_plancomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_plancomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `planid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Plan competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_plancomp`
--

LOCK TABLES `mdl_competency_plancomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_plancomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plancomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_relatedcomp`
--

DROP TABLE IF EXISTS `mdl_competency_relatedcomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_relatedcomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `competencyid` bigint(10) NOT NULL,
  `relatedcompetencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Related competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_relatedcomp`
--

LOCK TABLES `mdl_competency_relatedcomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_template`
--

DROP TABLE IF EXISTS `mdl_competency_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `duedate` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Learning plan templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_template`
--

LOCK TABLES `mdl_competency_template` WRITE;
/*!40000 ALTER TABLE `mdl_competency_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_templatecohort`
--

DROP TABLE IF EXISTS `mdl_competency_templatecohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_templatecohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  KEY `mdl_comptemp_tem2_ix` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_templatecohort`
--

LOCK TABLES `mdl_competency_templatecohort` WRITE;
/*!40000 ALTER TABLE `mdl_competency_templatecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_templatecomp`
--

DROP TABLE IF EXISTS `mdl_competency_templatecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_templatecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_tem_ix` (`templateid`),
  KEY `mdl_comptemp_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a competency to a learning plan template.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_templatecomp`
--

LOCK TABLES `mdl_competency_templatecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_templatecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercomp`
--

DROP TABLE IF EXISTS `mdl_competency_usercomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercomp`
--

LOCK TABLES `mdl_competency_usercomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercompcourse`
--

DROP TABLE IF EXISTS `mdl_competency_usercompcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercompcourse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercompcourse`
--

LOCK TABLES `mdl_competency_usercompcourse` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercompplan`
--

DROP TABLE IF EXISTS `mdl_competency_usercompplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercompplan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User competencies plans';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercompplan`
--

LOCK TABLES `mdl_competency_usercompplan` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercompplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_userevidence`
--

DROP TABLE IF EXISTS `mdl_competency_userevidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_userevidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The evidence of prior learning';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_userevidence`
--

LOCK TABLES `mdl_competency_userevidence` WRITE;
/*!40000 ALTER TABLE `mdl_competency_userevidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_userevidencecomp`
--

DROP TABLE IF EXISTS `mdl_competency_userevidencecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_userevidencecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userevidenceid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  KEY `mdl_compuser_use2_ix` (`userevidenceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relationship between user evidence and competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_userevidencecomp`
--

LOCK TABLES `mdl_competency_userevidencecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','boost'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','xFM7m8HCxS8fBbdxqA0Hvj8iddefO1Ab50.112.26.194'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','atto,tinymce,textarea'),(16,'antiviruses',''),(17,'media_plugins_sortorder','videojs,youtube,swf'),(18,'upgrade_minmaxgradestepignored','1'),(19,'upgrade_extracreditweightsstepignored','1'),(20,'upgrade_calculatedgradeitemsignored','1'),(21,'upgrade_letterboundarycourses','1'),(22,'mnet_localhost_id','1'),(23,'mnet_all_hosts_id','2'),(24,'siteguest','1'),(25,'siteadmins','2,5'),(26,'themerev','1484792671'),(27,'jsrev','1484792671'),(28,'gdversion','2'),(29,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(30,'version','2016120501'),(31,'enableoutcomes','0'),(32,'usecomments','1'),(33,'usetags','1'),(34,'enablenotes','1'),(35,'enableportfolios','0'),(36,'enablewebservices','0'),(37,'messaging','1'),(38,'messaginghidereadnotifications','0'),(39,'messagingdeletereadnotificationsdelay','604800'),(40,'messagingallowemailoverride','0'),(41,'enablestats','0'),(42,'enablerssfeeds','0'),(43,'enableblogs','1'),(44,'enablecompletion','1'),(45,'completiondefault','1'),(46,'enableavailability','1'),(47,'enableplagiarism','0'),(48,'enablebadges','1'),(49,'enableglobalsearch','0'),(50,'defaultpreference_maildisplay','2'),(51,'defaultpreference_mailformat','1'),(52,'defaultpreference_maildigest','0'),(53,'defaultpreference_autosubscribe','1'),(54,'defaultpreference_trackforums','0'),(55,'autologinguests','0'),(56,'hiddenuserfields',''),(57,'showuseridentity','email'),(58,'fullnamedisplay','language'),(59,'alternativefullnameformat','language'),(60,'maxusersperpage','100'),(61,'enablegravatar','0'),(62,'gravatardefaulturl','mm'),(63,'enablecourserequests','0'),(64,'defaultrequestcategory','1'),(65,'requestcategoryselection','0'),(66,'courserequestnotify',''),(67,'grade_profilereport','user'),(68,'grade_aggregationposition','1'),(69,'grade_includescalesinaggregation','1'),(70,'grade_hiddenasdate','0'),(71,'gradepublishing','0'),(72,'grade_export_displaytype','1'),(73,'grade_export_decimalpoints','2'),(74,'grade_navmethod','1'),(75,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email'),(76,'grade_export_customprofilefields',''),(77,'recovergradesdefault','0'),(78,'gradeexport',''),(79,'unlimitedgrades','0'),(80,'grade_report_showmin','1'),(81,'gradepointmax','100'),(82,'gradepointdefault','100'),(83,'grade_minmaxtouse','1'),(84,'grade_mygrades_report','overview'),(85,'gradereport_mygradeurl',''),(86,'grade_hideforcedsettings','1'),(87,'grade_aggregation','13'),(88,'grade_aggregation_flag','0'),(89,'grade_aggregations_visible','13'),(90,'grade_aggregateonlygraded','1'),(91,'grade_aggregateonlygraded_flag','2'),(92,'grade_aggregateoutcomes','0'),(93,'grade_aggregateoutcomes_flag','2'),(94,'grade_keephigh','0'),(95,'grade_keephigh_flag','3'),(96,'grade_droplow','0'),(97,'grade_droplow_flag','2'),(98,'grade_overridecat','1'),(99,'grade_displaytype','1'),(100,'grade_decimalpoints','2'),(101,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(102,'grade_report_studentsperpage','100'),(103,'grade_report_showonlyactiveenrol','1'),(104,'grade_report_quickgrading','1'),(105,'grade_report_showquickfeedback','0'),(106,'grade_report_meanselection','1'),(107,'grade_report_enableajax','0'),(108,'grade_report_showcalculations','1'),(109,'grade_report_showeyecons','0'),(110,'grade_report_showaverages','1'),(111,'grade_report_showlocks','0'),(112,'grade_report_showranges','0'),(113,'grade_report_showanalysisicon','1'),(114,'grade_report_showuserimage','1'),(115,'grade_report_showactivityicons','1'),(116,'grade_report_shownumberofgrades','0'),(117,'grade_report_averagesdisplaytype','inherit'),(118,'grade_report_rangesdisplaytype','inherit'),(119,'grade_report_averagesdecimalpoints','inherit'),(120,'grade_report_rangesdecimalpoints','inherit'),(121,'grade_report_historyperpage','50'),(122,'grade_report_overview_showrank','0'),(123,'grade_report_overview_showtotalsifcontainhidden','0'),(124,'grade_report_user_showrank','0'),(125,'grade_report_user_showpercentage','1'),(126,'grade_report_user_showgrade','1'),(127,'grade_report_user_showfeedback','1'),(128,'grade_report_user_showrange','1'),(129,'grade_report_user_showweight','1'),(130,'grade_report_user_showaverage','0'),(131,'grade_report_user_showlettergrade','0'),(132,'grade_report_user_rangedecimals','0'),(133,'grade_report_user_showhiddenitems','1'),(134,'grade_report_user_showtotalsifcontainhidden','0'),(135,'grade_report_user_showcontributiontocoursetotal','1'),(136,'badges_defaultissuername',''),(137,'badges_defaultissuercontact',''),(138,'badges_badgesalt','badges1484792637'),(139,'badges_allowexternalbackpack','1'),(140,'badges_allowcoursebadges','1'),(142,'forcetimezone','99'),(143,'country','0'),(144,'defaultcity',''),(145,'geoip2file','/var/www/moodledata/geoip/GeoLite2-City.mmdb'),(146,'googlemapkey3',''),(147,'allcountrycodes',''),(148,'autolang','1'),(149,'lang','pt_br'),(150,'langmenu','1'),(151,'langlist',''),(152,'langrev','1484792671'),(153,'langcache','1'),(154,'langstringcache','1'),(155,'locale',''),(156,'latinexcelexport','0'),(157,'requiremodintro','0'),(159,'authloginviaemail','0'),(160,'allowaccountssameemail','0'),(161,'authpreventaccountcreation','0'),(162,'loginpageautofocus','0'),(163,'guestloginbutton','1'),(164,'limitconcurrentlogins','0'),(165,'alternateloginurl',''),(166,'forgottenpasswordurl',''),(167,'auth_instructions',''),(168,'allowemailaddresses',''),(169,'denyemailaddresses',''),(170,'verifychangedemail','1'),(171,'recaptchapublickey',''),(172,'recaptchaprivatekey',''),(173,'filteruploadedfiles','0'),(174,'filtermatchoneperpage','0'),(175,'filtermatchonepertext','0'),(176,'sitedefaultlicense','allrightsreserved'),(177,'media_default_width','400'),(178,'media_default_height','300'),(179,'searchengine','solr'),(180,'portfolio_moderate_filesize_threshold','1048576'),(181,'portfolio_high_filesize_threshold','5242880'),(182,'portfolio_moderate_db_threshold','20'),(183,'portfolio_high_db_threshold','50'),(184,'repositorycacheexpire','120'),(185,'repositorygetfiletimeout','30'),(186,'repositorysyncfiletimeout','1'),(187,'repositorysyncimagetimeout','3'),(188,'repositoryallowexternallinks','1'),(189,'legacyfilesinnewcourses','0'),(190,'legacyfilesaddallowed','1'),(191,'enablewsdocumentation','0'),(192,'allowbeforeblock','0'),(193,'allowedip',''),(194,'blockedip',''),(195,'protectusernames','1'),(196,'forcelogin','0'),(197,'forceloginforprofiles','1'),(198,'forceloginforprofileimage','0'),(199,'opentogoogle','0'),(200,'maxbytes','0'),(201,'userquota','104857600'),(202,'allowobjectembed','0'),(203,'enabletrusttext','0'),(204,'maxeditingtime','1800'),(205,'extendedusernamechars','0'),(206,'sitepolicy',''),(207,'sitepolicyguest',''),(208,'keeptagnamecase','1'),(209,'profilesforenrolledusersonly','1'),(210,'cronclionly','1'),(211,'cronremotepassword',''),(212,'lockoutthreshold','0'),(213,'lockoutwindow','1800'),(214,'lockoutduration','1800'),(215,'passwordpolicy','1'),(216,'minpasswordlength','8'),(217,'minpassworddigits','1'),(218,'minpasswordlower','1'),(219,'minpasswordupper','1'),(220,'minpasswordnonalphanum','1'),(221,'maxconsecutiveidentchars','0'),(222,'passwordreuselimit','0'),(223,'pwresettime','1800'),(224,'passwordchangelogout','0'),(225,'passwordchangetokendeletion','0'),(226,'groupenrolmentkeypolicy','1'),(227,'disableuserimages','0'),(228,'emailchangeconfirmation','1'),(229,'rememberusername','2'),(230,'strictformsrequired','0'),(231,'loginhttps','0'),(232,'cookiesecure','1'),(233,'cookiehttponly','0'),(234,'allowframembedding','0'),(235,'loginpasswordautocomplete','0'),(236,'curlsecurityblockedhosts',''),(237,'curlsecurityallowedport',''),(238,'displayloginfailures','0'),(239,'notifyloginfailures',''),(240,'notifyloginthreshold','10'),(241,'themelist',''),(242,'themedesignermode','0'),(243,'allowuserthemes','0'),(244,'allowcoursethemes','0'),(245,'allowcategorythemes','0'),(246,'allowthemechangeonurl','0'),(247,'allowuserblockhiding','1'),(248,'allowblockstodock','1'),(249,'custommenuitems',''),(250,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),(251,'enabledevicedetection','1'),(252,'devicedetectregex','[]'),(253,'calendartype','gregorian'),(254,'calendar_adminseesall','0'),(255,'calendar_site_timeformat','0'),(256,'calendar_startwday','1'),(257,'calendar_weekend','65'),(258,'calendar_lookahead','21'),(259,'calendar_maxevents','10'),(260,'enablecalendarexport','1'),(261,'calendar_customexport','1'),(262,'calendar_exportlookahead','365'),(263,'calendar_exportlookback','5'),(264,'calendar_exportsalt','SWBaf0n18Htg12h1H4GlpxZJB5hP9EsZKsSjouJLhGukSa5DWjXXsJGfFJ91'),(265,'calendar_showicalsource','1'),(266,'useblogassociations','1'),(267,'bloglevel','4'),(268,'useexternalblogs','1'),(269,'externalblogcrontime','86400'),(270,'maxexternalblogsperuser','1'),(271,'blogusecomments','1'),(272,'blogshowcommentscount','1'),(273,'defaulthomepage','1'),(274,'allowguestmymoodle','1'),(275,'navshowfullcoursenames','0'),(276,'navshowcategories','1'),(277,'navshowmycoursecategories','0'),(278,'navshowallcourses','0'),(279,'navsortmycoursessort','sortorder'),(280,'navcourselimit','20'),(281,'usesitenameforsitepages','0'),(282,'linkadmincategories','1'),(283,'linkcoursesections','0'),(284,'navshowfrontpagemods','1'),(285,'navadduserpostslinks','1'),(286,'formatstringstriptags','1'),(287,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(288,'docroot','http://docs.moodle.org'),(289,'doclang',''),(290,'doctonewwindow','0'),(291,'courselistshortnames','0'),(292,'coursesperpage','20'),(293,'courseswithsummarieslimit','10'),(294,'courseoverviewfileslimit','1'),(295,'courseoverviewfilesext','.jpg,.gif,.png'),(296,'useexternalyui','0'),(297,'yuicomboloading','1'),(298,'cachejs','1'),(299,'modchooserdefault','1'),(300,'additionalhtmlhead',''),(301,'additionalhtmltopofbody',''),(302,'additionalhtmlfooter',''),(303,'pathtodu',''),(304,'aspellpath',''),(305,'pathtodot',''),(306,'pathtogs','/usr/bin/gs'),(307,'pathtounoconv','/usr/bin/unoconv'),(308,'supportname','Administrador Usuário'),(309,'supportemail',''),(310,'supportpage',''),(311,'dbsessions','0'),(312,'sessioncookie',''),(313,'sessioncookiepath',''),(314,'sessioncookiedomain',''),(315,'statsfirstrun','none'),(316,'statsmaxruntime','0'),(317,'statsruntimedays','31'),(318,'statsuserthreshold','0'),(319,'slasharguments','1'),(320,'getremoteaddrconf','0'),(321,'proxyhost',''),(322,'proxyport','0'),(323,'proxytype','HTTP'),(324,'proxyuser',''),(325,'proxypassword',''),(326,'proxybypass','localhost, 127.0.0.1'),(327,'maintenance_enabled','0'),(328,'maintenance_message',''),(329,'deleteunconfirmed','168'),(330,'deleteincompleteusers','0'),(331,'disablegradehistory','0'),(332,'gradehistorylifetime','0'),(333,'tempdatafoldercleanup','168'),(334,'extramemorylimit','512M'),(335,'maxtimelimit','0'),(336,'curlcache','120'),(337,'curltimeoutkbitrate','56'),(338,'smtphosts',''),(339,'smtpsecure',''),(340,'smtpauthtype','LOGIN'),(341,'smtpuser',''),(342,'smtppass',''),(343,'smtpmaxbulk','1'),(344,'noreplyaddress','noreply@50.112.26.194'),(345,'allowedemaildomains',''),(346,'sitemailcharset','0'),(347,'allowusermailcharset','0'),(348,'allowattachments','1'),(349,'mailnewline','LF'),(350,'emailfromvia','1'),(351,'updateautocheck','1'),(352,'updateminmaturity','200'),(353,'updatenotifybuilds','0'),(354,'enablesafebrowserintegration','0'),(355,'dndallowtextandlinks','0'),(356,'debug','0'),(357,'debugdisplay','0'),(358,'debugsmtp','0'),(359,'perfdebug','7'),(360,'debugstringids','0'),(361,'debugvalidators','0'),(362,'debugpageinfo','0'),(363,'profilingenabled','0'),(364,'profilingincluded',''),(365,'profilingexcluded',''),(366,'profilingautofrec','0'),(367,'profilingallowme','0'),(368,'profilingallowall','0'),(369,'profilinglifetime','1440'),(370,'profilingimportprefix','(I)'),(371,'release','3.2.1 (Build: 20170109)'),(372,'branch','32'),(373,'localcachedirpurged','1484792671'),(374,'scheduledtaskreset','1484792671'),(375,'allversionshash','03862bcd622665a998878770c9a84883607e18d1'),(377,'notloggedinroleid','6'),(378,'guestroleid','6'),(379,'defaultuserroleid','7'),(380,'creatornewroleid','3'),(381,'restorernewroleid','3'),(382,'gradebookroles','5'),(383,'data_enablerssfeeds','0'),(384,'chat_method','ajax'),(385,'chat_refresh_userlist','10'),(386,'chat_old_ping','35'),(387,'chat_refresh_room','5'),(388,'chat_normal_updatemode','jsupdate'),(389,'chat_serverhost','50.112.26.194'),(390,'chat_serverip','127.0.0.1'),(391,'chat_serverport','9111'),(392,'chat_servermax','100'),(393,'forum_displaymode','3'),(394,'forum_shortpost','300'),(395,'forum_longpost','600'),(396,'forum_manydiscussions','100'),(397,'forum_maxbytes','512000'),(398,'forum_maxattachments','9'),(399,'forum_trackingtype','1'),(400,'forum_trackreadposts','1'),(401,'forum_allowforcedreadtracking','0'),(402,'forum_oldpostdays','14'),(403,'forum_usermarksread','0'),(404,'forum_cleanreadtime','2'),(405,'digestmailtime','17'),(406,'forum_enablerssfeeds','0'),(407,'forum_enabletimedposts','1'),(408,'glossary_entbypage','10'),(409,'glossary_dupentries','0'),(410,'glossary_allowcomments','0'),(411,'glossary_linkbydefault','1'),(412,'glossary_defaultapproval','1'),(413,'glossary_enablerssfeeds','0'),(414,'glossary_linkentries','0'),(415,'glossary_casesensitive','0'),(416,'glossary_fullmatch','0'),(417,'feedback_allowfullanonymous','0'),(418,'block_rss_client_num_entries','5'),(419,'block_rss_client_timeout','30'),(420,'block_course_list_adminview','all'),(421,'block_course_list_hideallcourseslink','0'),(422,'block_html_allowcssclasses','0'),(423,'block_online_users_timetosee','5'),(424,'filter_censor_badwords',''),(425,'filter_multilang_force_old','0'),(426,'logguests','1'),(427,'loglifetime','0'),(428,'jabberhost',''),(429,'jabberserver',''),(430,'jabberusername',''),(431,'jabberpassword',''),(432,'jabberport','5222'),(433,'airnotifierurl','https://messages.moodle.net'),(434,'airnotifierport','443'),(435,'airnotifiermobileappname','com.moodle.moodlemobile'),(436,'airnotifierappname','commoodlemoodlemobile'),(437,'airnotifieraccesskey',''),(438,'profileroles','5,4,3'),(439,'coursecontact','3'),(440,'frontpage','4,0,2,7,6'),(441,'frontpageloggedin','4,0,5,2,7,6'),(442,'maxcategorydepth','2'),(443,'frontpagecourselimit','200'),(444,'commentsperpage','15'),(445,'defaultfrontpageroleid','8'),(446,'messageinbound_enabled','0'),(447,'messageinbound_mailbox',''),(448,'messageinbound_domain',''),(449,'messageinbound_host',''),(450,'messageinbound_hostssl','ssl'),(451,'messageinbound_hostuser',''),(452,'messageinbound_hostpass',''),(453,'enablemobilewebservice','0'),(454,'timezone','America/Sao_Paulo'),(455,'registerauth','');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1484792641,NULL,'enableoutcomes','0',NULL),(2,0,1484792641,NULL,'usecomments','1',NULL),(3,0,1484792641,NULL,'usetags','1',NULL),(4,0,1484792641,NULL,'enablenotes','1',NULL),(5,0,1484792641,NULL,'enableportfolios','0',NULL),(6,0,1484792642,NULL,'enablewebservices','0',NULL),(7,0,1484792642,NULL,'messaging','1',NULL),(8,0,1484792642,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1484792642,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1484792642,NULL,'messagingallowemailoverride','0',NULL),(11,0,1484792642,NULL,'enablestats','0',NULL),(12,0,1484792642,NULL,'enablerssfeeds','0',NULL),(13,0,1484792642,NULL,'enableblogs','1',NULL),(14,0,1484792642,NULL,'enablecompletion','1',NULL),(15,0,1484792642,NULL,'completiondefault','1',NULL),(16,0,1484792642,NULL,'enableavailability','1',NULL),(17,0,1484792642,NULL,'enableplagiarism','0',NULL),(18,0,1484792642,NULL,'enablebadges','1',NULL),(19,0,1484792642,NULL,'enableglobalsearch','0',NULL),(20,0,1484792642,NULL,'defaultpreference_maildisplay','2',NULL),(21,0,1484792642,NULL,'defaultpreference_mailformat','1',NULL),(22,0,1484792642,NULL,'defaultpreference_maildigest','0',NULL),(23,0,1484792642,NULL,'defaultpreference_autosubscribe','1',NULL),(24,0,1484792642,NULL,'defaultpreference_trackforums','0',NULL),(25,0,1484792642,NULL,'autologinguests','0',NULL),(26,0,1484792642,NULL,'hiddenuserfields','',NULL),(27,0,1484792642,NULL,'showuseridentity','email',NULL),(28,0,1484792642,NULL,'fullnamedisplay','language',NULL),(29,0,1484792642,NULL,'alternativefullnameformat','language',NULL),(30,0,1484792642,NULL,'maxusersperpage','100',NULL),(31,0,1484792642,NULL,'enablegravatar','0',NULL),(32,0,1484792642,NULL,'gravatardefaulturl','mm',NULL),(33,0,1484792642,'moodlecourse','visible','1',NULL),(34,0,1484792642,'moodlecourse','format','topics',NULL),(35,0,1484792642,'moodlecourse','maxsections','52',NULL),(36,0,1484792642,'moodlecourse','numsections','4',NULL),(37,0,1484792642,'moodlecourse','hiddensections','0',NULL),(38,0,1484792642,'moodlecourse','coursedisplay','0',NULL),(39,0,1484792642,'moodlecourse','courseduration','31536000',NULL),(40,0,1484792642,'moodlecourse','lang','',NULL),(41,0,1484792642,'moodlecourse','newsitems','5',NULL),(42,0,1484792642,'moodlecourse','showgrades','1',NULL),(43,0,1484792642,'moodlecourse','showreports','0',NULL),(44,0,1484792642,'moodlecourse','maxbytes','0',NULL),(45,0,1484792642,'moodlecourse','enablecompletion','0',NULL),(46,0,1484792642,'moodlecourse','groupmode','0',NULL),(47,0,1484792642,'moodlecourse','groupmodeforce','0',NULL),(48,0,1484792642,NULL,'enablecourserequests','0',NULL),(49,0,1484792642,NULL,'defaultrequestcategory','1',NULL),(50,0,1484792642,NULL,'requestcategoryselection','0',NULL),(51,0,1484792642,NULL,'courserequestnotify','',NULL),(52,0,1484792642,'backup','loglifetime','30',NULL),(53,0,1484792642,'backup','backup_general_users','1',NULL),(54,0,1484792642,'backup','backup_general_users_locked','',NULL),(55,0,1484792642,'backup','backup_general_anonymize','0',NULL),(56,0,1484792642,'backup','backup_general_anonymize_locked','',NULL),(57,0,1484792642,'backup','backup_general_role_assignments','1',NULL),(58,0,1484792642,'backup','backup_general_role_assignments_locked','',NULL),(59,0,1484792642,'backup','backup_general_activities','1',NULL),(60,0,1484792642,'backup','backup_general_activities_locked','',NULL),(61,0,1484792642,'backup','backup_general_blocks','1',NULL),(62,0,1484792642,'backup','backup_general_blocks_locked','',NULL),(63,0,1484792642,'backup','backup_general_filters','1',NULL),(64,0,1484792642,'backup','backup_general_filters_locked','',NULL),(65,0,1484792642,'backup','backup_general_comments','1',NULL),(66,0,1484792642,'backup','backup_general_comments_locked','',NULL),(67,0,1484792642,'backup','backup_general_badges','1',NULL),(68,0,1484792642,'backup','backup_general_badges_locked','',NULL),(69,0,1484792642,'backup','backup_general_calendarevents','1',NULL),(70,0,1484792642,'backup','backup_general_calendarevents_locked','',NULL),(71,0,1484792642,'backup','backup_general_userscompletion','1',NULL),(72,0,1484792642,'backup','backup_general_userscompletion_locked','',NULL),(73,0,1484792642,'backup','backup_general_logs','0',NULL),(74,0,1484792642,'backup','backup_general_logs_locked','',NULL),(75,0,1484792642,'backup','backup_general_histories','0',NULL),(76,0,1484792642,'backup','backup_general_histories_locked','',NULL),(77,0,1484792642,'backup','backup_general_questionbank','1',NULL),(78,0,1484792642,'backup','backup_general_questionbank_locked','',NULL),(79,0,1484792642,'backup','backup_general_groups','1',NULL),(80,0,1484792642,'backup','backup_general_groups_locked','',NULL),(81,0,1484792642,'backup','backup_general_competencies','1',NULL),(82,0,1484792642,'backup','backup_general_competencies_locked','',NULL),(83,0,1484792642,'backup','import_general_maxresults','10',NULL),(84,0,1484792642,'backup','import_general_duplicate_admin_allowed','0',NULL),(85,0,1484792642,'backup','backup_import_activities','1',NULL),(86,0,1484792642,'backup','backup_import_activities_locked','',NULL),(87,0,1484792642,'backup','backup_import_blocks','1',NULL),(88,0,1484792642,'backup','backup_import_blocks_locked','',NULL),(89,0,1484792642,'backup','backup_import_filters','1',NULL),(90,0,1484792642,'backup','backup_import_filters_locked','',NULL),(91,0,1484792642,'backup','backup_import_calendarevents','1',NULL),(92,0,1484792642,'backup','backup_import_calendarevents_locked','',NULL),(93,0,1484792642,'backup','backup_import_questionbank','1',NULL),(94,0,1484792642,'backup','backup_import_questionbank_locked','',NULL),(95,0,1484792642,'backup','backup_import_groups','1',NULL),(96,0,1484792642,'backup','backup_import_groups_locked','',NULL),(97,0,1484792642,'backup','backup_import_competencies','1',NULL),(98,0,1484792642,'backup','backup_import_competencies_locked','',NULL),(99,0,1484792642,'backup','backup_auto_active','0',NULL),(100,0,1484792642,'backup','backup_auto_weekdays','0000000',NULL),(101,0,1484792642,'backup','backup_auto_hour','0',NULL),(102,0,1484792642,'backup','backup_auto_minute','0',NULL),(103,0,1484792642,'backup','backup_auto_storage','0',NULL),(104,0,1484792642,'backup','backup_auto_destination','',NULL),(105,0,1484792642,'backup','backup_auto_max_kept','1',NULL),(106,0,1484792642,'backup','backup_auto_delete_days','0',NULL),(107,0,1484792642,'backup','backup_auto_min_kept','0',NULL),(108,0,1484792642,'backup','backup_shortname','0',NULL),(109,0,1484792642,'backup','backup_auto_skip_hidden','1',NULL),(110,0,1484792642,'backup','backup_auto_skip_modif_days','30',NULL),(111,0,1484792642,'backup','backup_auto_skip_modif_prev','0',NULL),(112,0,1484792642,'backup','backup_auto_users','1',NULL),(113,0,1484792642,'backup','backup_auto_role_assignments','1',NULL),(114,0,1484792642,'backup','backup_auto_activities','1',NULL),(115,0,1484792642,'backup','backup_auto_blocks','1',NULL),(116,0,1484792642,'backup','backup_auto_filters','1',NULL),(117,0,1484792642,'backup','backup_auto_comments','1',NULL),(118,0,1484792642,'backup','backup_auto_badges','1',NULL),(119,0,1484792642,'backup','backup_auto_calendarevents','1',NULL),(120,0,1484792642,'backup','backup_auto_userscompletion','1',NULL),(121,0,1484792642,'backup','backup_auto_logs','0',NULL),(122,0,1484792642,'backup','backup_auto_histories','0',NULL),(123,0,1484792642,'backup','backup_auto_questionbank','1',NULL),(124,0,1484792642,'backup','backup_auto_groups','1',NULL),(125,0,1484792642,'backup','backup_auto_competencies','1',NULL),(126,0,1484792642,NULL,'grade_profilereport','user',NULL),(127,0,1484792642,NULL,'grade_aggregationposition','1',NULL),(128,0,1484792642,NULL,'grade_includescalesinaggregation','1',NULL),(129,0,1484792642,NULL,'grade_hiddenasdate','0',NULL),(130,0,1484792642,NULL,'gradepublishing','0',NULL),(131,0,1484792642,NULL,'grade_export_displaytype','1',NULL),(132,0,1484792642,NULL,'grade_export_decimalpoints','2',NULL),(133,0,1484792642,NULL,'grade_navmethod','1',NULL),(134,0,1484792642,NULL,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email',NULL),(135,0,1484792642,NULL,'grade_export_customprofilefields','',NULL),(136,0,1484792642,NULL,'recovergradesdefault','0',NULL),(137,0,1484792642,NULL,'gradeexport','',NULL),(138,0,1484792642,NULL,'unlimitedgrades','0',NULL),(139,0,1484792642,NULL,'grade_report_showmin','1',NULL),(140,0,1484792642,NULL,'gradepointmax','100',NULL),(141,0,1484792642,NULL,'gradepointdefault','100',NULL),(142,0,1484792642,NULL,'grade_minmaxtouse','1',NULL),(143,0,1484792642,NULL,'grade_mygrades_report','overview',NULL),(144,0,1484792642,NULL,'gradereport_mygradeurl','',NULL),(145,0,1484792642,NULL,'grade_hideforcedsettings','1',NULL),(146,0,1484792642,NULL,'grade_aggregation','13',NULL),(147,0,1484792642,NULL,'grade_aggregation_flag','0',NULL),(148,0,1484792642,NULL,'grade_aggregations_visible','13',NULL),(149,0,1484792642,NULL,'grade_aggregateonlygraded','1',NULL),(150,0,1484792642,NULL,'grade_aggregateonlygraded_flag','2',NULL),(151,0,1484792642,NULL,'grade_aggregateoutcomes','0',NULL),(152,0,1484792642,NULL,'grade_aggregateoutcomes_flag','2',NULL),(153,0,1484792642,NULL,'grade_keephigh','0',NULL),(154,0,1484792642,NULL,'grade_keephigh_flag','3',NULL),(155,0,1484792643,NULL,'grade_droplow','0',NULL),(156,0,1484792643,NULL,'grade_droplow_flag','2',NULL),(157,0,1484792643,NULL,'grade_overridecat','1',NULL),(158,0,1484792643,NULL,'grade_displaytype','1',NULL),(159,0,1484792643,NULL,'grade_decimalpoints','2',NULL),(160,0,1484792643,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(161,0,1484792643,NULL,'grade_report_studentsperpage','100',NULL),(162,0,1484792643,NULL,'grade_report_showonlyactiveenrol','1',NULL),(163,0,1484792643,NULL,'grade_report_quickgrading','1',NULL),(164,0,1484792643,NULL,'grade_report_showquickfeedback','0',NULL),(165,0,1484792643,NULL,'grade_report_meanselection','1',NULL),(166,0,1484792643,NULL,'grade_report_enableajax','0',NULL),(167,0,1484792643,NULL,'grade_report_showcalculations','1',NULL),(168,0,1484792643,NULL,'grade_report_showeyecons','0',NULL),(169,0,1484792643,NULL,'grade_report_showaverages','1',NULL),(170,0,1484792643,NULL,'grade_report_showlocks','0',NULL),(171,0,1484792643,NULL,'grade_report_showranges','0',NULL),(172,0,1484792643,NULL,'grade_report_showanalysisicon','1',NULL),(173,0,1484792643,NULL,'grade_report_showuserimage','1',NULL),(174,0,1484792643,NULL,'grade_report_showactivityicons','1',NULL),(175,0,1484792643,NULL,'grade_report_shownumberofgrades','0',NULL),(176,0,1484792643,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(177,0,1484792643,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(178,0,1484792643,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(179,0,1484792643,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(180,0,1484792643,NULL,'grade_report_historyperpage','50',NULL),(181,0,1484792643,NULL,'grade_report_overview_showrank','0',NULL),(182,0,1484792643,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(183,0,1484792643,NULL,'grade_report_user_showrank','0',NULL),(184,0,1484792643,NULL,'grade_report_user_showpercentage','1',NULL),(185,0,1484792643,NULL,'grade_report_user_showgrade','1',NULL),(186,0,1484792643,NULL,'grade_report_user_showfeedback','1',NULL),(187,0,1484792643,NULL,'grade_report_user_showrange','1',NULL),(188,0,1484792643,NULL,'grade_report_user_showweight','1',NULL),(189,0,1484792643,NULL,'grade_report_user_showaverage','0',NULL),(190,0,1484792643,NULL,'grade_report_user_showlettergrade','0',NULL),(191,0,1484792643,NULL,'grade_report_user_rangedecimals','0',NULL),(192,0,1484792643,NULL,'grade_report_user_showhiddenitems','1',NULL),(193,0,1484792643,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(194,0,1484792643,NULL,'grade_report_user_showcontributiontocoursetotal','1',NULL),(195,0,1484792643,'core_competency','enabled','1',NULL),(196,0,1484792643,'core_competency','pushcourseratingstouserplans','1',NULL),(197,0,1484792643,NULL,'badges_defaultissuername','',NULL),(198,0,1484792643,NULL,'badges_defaultissuercontact','',NULL),(199,0,1484792643,NULL,'badges_badgesalt','badges1484792637',NULL),(200,0,1484792643,NULL,'badges_allowexternalbackpack','1',NULL),(201,0,1484792643,NULL,'badges_allowcoursebadges','1',NULL),(202,0,1484792644,NULL,'timezone','Europe/London',NULL),(203,0,1484792645,NULL,'forcetimezone','99',NULL),(204,0,1484792645,NULL,'country','0',NULL),(205,0,1484792645,NULL,'defaultcity','',NULL),(206,0,1484792645,NULL,'geoip2file','/var/www/moodledata/geoip/GeoLite2-City.mmdb',NULL),(207,0,1484792645,NULL,'googlemapkey3','',NULL),(208,0,1484792645,NULL,'allcountrycodes','',NULL),(209,0,1484792645,NULL,'autolang','1',NULL),(210,0,1484792645,NULL,'lang','pt_br',NULL),(211,0,1484792645,NULL,'langmenu','1',NULL),(212,0,1484792645,NULL,'langlist','',NULL),(213,0,1484792645,NULL,'langcache','1',NULL),(214,0,1484792645,NULL,'langstringcache','1',NULL),(215,0,1484792645,NULL,'locale','',NULL),(216,0,1484792645,NULL,'latinexcelexport','0',NULL),(217,0,1484792645,NULL,'requiremodintro','0',NULL),(218,0,1484792645,NULL,'registerauth','',NULL),(219,0,1484792645,NULL,'authloginviaemail','0',NULL),(220,0,1484792645,NULL,'allowaccountssameemail','0',NULL),(221,0,1484792645,NULL,'authpreventaccountcreation','0',NULL),(222,0,1484792645,NULL,'loginpageautofocus','0',NULL),(223,0,1484792645,NULL,'guestloginbutton','1',NULL),(224,0,1484792645,NULL,'limitconcurrentlogins','0',NULL),(225,0,1484792645,NULL,'alternateloginurl','',NULL),(226,0,1484792645,NULL,'forgottenpasswordurl','',NULL),(227,0,1484792645,NULL,'auth_instructions','',NULL),(228,0,1484792645,NULL,'allowemailaddresses','',NULL),(229,0,1484792645,NULL,'denyemailaddresses','',NULL),(230,0,1484792645,NULL,'verifychangedemail','1',NULL),(231,0,1484792645,NULL,'recaptchapublickey','',NULL),(232,0,1484792645,NULL,'recaptchaprivatekey','',NULL),(233,0,1484792645,'cachestore_apcu','testperformance','0',NULL),(234,0,1484792645,'cachestore_memcache','testservers','',NULL),(235,0,1484792645,'cachestore_memcached','testservers','',NULL),(236,0,1484792645,'cachestore_mongodb','testserver','',NULL),(237,0,1484792645,'cachestore_redis','test_server','',NULL),(238,0,1484792645,NULL,'filteruploadedfiles','0',NULL),(239,0,1484792645,NULL,'filtermatchoneperpage','0',NULL),(240,0,1484792645,NULL,'filtermatchonepertext','0',NULL),(241,0,1484792645,NULL,'sitedefaultlicense','allrightsreserved',NULL),(242,0,1484792645,NULL,'media_default_width','400',NULL),(243,0,1484792645,NULL,'media_default_height','300',NULL),(244,0,1484792645,NULL,'searchengine','solr',NULL),(245,0,1484792645,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(246,0,1484792645,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(247,0,1484792645,NULL,'portfolio_moderate_db_threshold','20',NULL),(248,0,1484792645,NULL,'portfolio_high_db_threshold','50',NULL),(249,0,1484792645,NULL,'repositorycacheexpire','120',NULL),(250,0,1484792645,NULL,'repositorygetfiletimeout','30',NULL),(251,0,1484792645,NULL,'repositorysyncfiletimeout','1',NULL),(252,0,1484792645,NULL,'repositorysyncimagetimeout','3',NULL),(253,0,1484792645,NULL,'repositoryallowexternallinks','1',NULL),(254,0,1484792645,NULL,'legacyfilesinnewcourses','0',NULL),(255,0,1484792645,NULL,'legacyfilesaddallowed','1',NULL),(256,0,1484792645,'question_preview','behaviour','deferredfeedback',NULL),(257,0,1484792645,'question_preview','correctness','1',NULL),(258,0,1484792645,'question_preview','marks','2',NULL),(259,0,1484792645,'question_preview','markdp','2',NULL),(260,0,1484792645,'question_preview','feedback','1',NULL),(261,0,1484792645,'question_preview','generalfeedback','1',NULL),(262,0,1484792645,'question_preview','rightanswer','1',NULL),(263,0,1484792645,'question_preview','history','0',NULL),(264,0,1484792645,NULL,'enablewsdocumentation','0',NULL),(265,0,1484792645,NULL,'allowbeforeblock','0',NULL),(266,0,1484792645,NULL,'allowedip','',NULL),(267,0,1484792645,NULL,'blockedip','',NULL),(268,0,1484792645,NULL,'protectusernames','1',NULL),(269,0,1484792645,NULL,'forcelogin','0',NULL),(270,0,1484792645,NULL,'forceloginforprofiles','1',NULL),(271,0,1484792645,NULL,'forceloginforprofileimage','0',NULL),(272,0,1484792645,NULL,'opentogoogle','0',NULL),(273,0,1484792645,NULL,'maxbytes','0',NULL),(274,0,1484792645,NULL,'userquota','104857600',NULL),(275,0,1484792645,NULL,'allowobjectembed','0',NULL),(276,0,1484792645,NULL,'enabletrusttext','0',NULL),(277,0,1484792645,NULL,'maxeditingtime','1800',NULL),(278,0,1484792645,NULL,'extendedusernamechars','0',NULL),(279,0,1484792645,NULL,'sitepolicy','',NULL),(280,0,1484792645,NULL,'sitepolicyguest','',NULL),(281,0,1484792645,NULL,'keeptagnamecase','1',NULL),(282,0,1484792645,NULL,'profilesforenrolledusersonly','1',NULL),(283,0,1484792645,NULL,'cronclionly','1',NULL),(284,0,1484792645,NULL,'cronremotepassword','',NULL),(285,0,1484792645,NULL,'lockoutthreshold','0',NULL),(286,0,1484792645,NULL,'lockoutwindow','1800',NULL),(287,0,1484792645,NULL,'lockoutduration','1800',NULL),(288,0,1484792645,NULL,'passwordpolicy','1',NULL),(289,0,1484792645,NULL,'minpasswordlength','8',NULL),(290,0,1484792645,NULL,'minpassworddigits','1',NULL),(291,0,1484792645,NULL,'minpasswordlower','1',NULL),(292,0,1484792645,NULL,'minpasswordupper','1',NULL),(293,0,1484792645,NULL,'minpasswordnonalphanum','1',NULL),(294,0,1484792645,NULL,'maxconsecutiveidentchars','0',NULL),(295,0,1484792645,NULL,'passwordreuselimit','0',NULL),(296,0,1484792645,NULL,'pwresettime','1800',NULL),(297,0,1484792645,NULL,'passwordchangelogout','0',NULL),(298,0,1484792645,NULL,'passwordchangetokendeletion','0',NULL),(299,0,1484792645,NULL,'groupenrolmentkeypolicy','1',NULL),(300,0,1484792645,NULL,'disableuserimages','0',NULL),(301,0,1484792645,NULL,'emailchangeconfirmation','1',NULL),(302,0,1484792645,NULL,'rememberusername','2',NULL),(303,0,1484792645,NULL,'strictformsrequired','0',NULL),(304,0,1484792645,NULL,'loginhttps','0',NULL),(305,0,1484792645,NULL,'cookiesecure','1',NULL),(306,0,1484792645,NULL,'cookiehttponly','0',NULL),(307,0,1484792645,NULL,'allowframembedding','0',NULL),(308,0,1484792645,NULL,'loginpasswordautocomplete','0',NULL),(309,0,1484792645,NULL,'curlsecurityblockedhosts','',NULL),(310,0,1484792645,NULL,'curlsecurityallowedport','',NULL),(311,0,1484792645,NULL,'displayloginfailures','0',NULL),(312,0,1484792645,NULL,'notifyloginfailures','',NULL),(313,0,1484792645,NULL,'notifyloginthreshold','10',NULL),(314,0,1484792645,NULL,'themelist','',NULL),(315,0,1484792645,NULL,'themedesignermode','0',NULL),(316,0,1484792645,NULL,'allowuserthemes','0',NULL),(317,0,1484792645,NULL,'allowcoursethemes','0',NULL),(318,0,1484792645,NULL,'allowcategorythemes','0',NULL),(319,0,1484792645,NULL,'allowthemechangeonurl','0',NULL),(320,0,1484792645,NULL,'allowuserblockhiding','1',NULL),(321,0,1484792645,NULL,'allowblockstodock','1',NULL),(322,0,1484792645,NULL,'custommenuitems','',NULL),(323,0,1484792645,NULL,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences',NULL),(324,0,1484792645,NULL,'enabledevicedetection','1',NULL),(325,0,1484792645,NULL,'devicedetectregex','[]',NULL),(326,0,1484792645,'theme_boost','preset','default.scss',NULL),(327,0,1484792646,'theme_boost','presetfiles','',NULL),(328,0,1484792646,'theme_boost','brandcolor','',NULL),(329,0,1484792646,'theme_boost','scsspre','',NULL),(330,0,1484792646,'theme_boost','scss','',NULL),(331,0,1484792646,'theme_clean','invert','0',NULL),(332,0,1484792646,'theme_clean','logo','',NULL),(333,0,1484792646,'theme_clean','smalllogo','',NULL),(334,0,1484792646,'theme_clean','sitename','1',NULL),(335,0,1484792646,'theme_clean','customcss','',NULL),(336,0,1484792646,'theme_clean','footnote','',NULL),(337,0,1484792646,'theme_more','textcolor','#333366',NULL),(338,0,1484792646,'theme_more','linkcolor','#FF6500',NULL),(339,0,1484792646,'theme_more','bodybackground','',NULL),(340,0,1484792646,'theme_more','backgroundimage','',NULL),(341,0,1484792646,'theme_more','backgroundrepeat','repeat',NULL),(342,0,1484792646,'theme_more','backgroundposition','0',NULL),(343,0,1484792646,'theme_more','backgroundfixed','0',NULL),(344,0,1484792646,'theme_more','contentbackground','#FFFFFF',NULL),(345,0,1484792646,'theme_more','secondarybackground','#FFFFFF',NULL),(346,0,1484792646,'theme_more','invert','1',NULL),(347,0,1484792646,'theme_more','logo','',NULL),(348,0,1484792646,'theme_more','smalllogo','',NULL),(349,0,1484792646,'theme_more','sitename','1',NULL),(350,0,1484792646,'theme_more','customcss','',NULL),(351,0,1484792646,'theme_more','footnote','',NULL),(352,0,1484792646,'core_admin','logo','',NULL),(353,0,1484792646,'core_admin','logocompact','',NULL),(354,0,1484792646,NULL,'calendartype','gregorian',NULL),(355,0,1484792646,NULL,'calendar_adminseesall','0',NULL),(356,0,1484792646,NULL,'calendar_site_timeformat','0',NULL),(357,0,1484792646,NULL,'calendar_startwday','1',NULL),(358,0,1484792646,NULL,'calendar_weekend','65',NULL),(359,0,1484792646,NULL,'calendar_lookahead','21',NULL),(360,0,1484792646,NULL,'calendar_maxevents','10',NULL),(361,0,1484792646,NULL,'enablecalendarexport','1',NULL),(362,0,1484792646,NULL,'calendar_customexport','1',NULL),(363,0,1484792646,NULL,'calendar_exportlookahead','365',NULL),(364,0,1484792646,NULL,'calendar_exportlookback','5',NULL),(365,0,1484792646,NULL,'calendar_exportsalt','SWBaf0n18Htg12h1H4GlpxZJB5hP9EsZKsSjouJLhGukSa5DWjXXsJGfFJ91',NULL),(366,0,1484792646,NULL,'calendar_showicalsource','1',NULL),(367,0,1484792646,NULL,'useblogassociations','1',NULL),(368,0,1484792646,NULL,'bloglevel','4',NULL),(369,0,1484792646,NULL,'useexternalblogs','1',NULL),(370,0,1484792646,NULL,'externalblogcrontime','86400',NULL),(371,0,1484792646,NULL,'maxexternalblogsperuser','1',NULL),(372,0,1484792646,NULL,'blogusecomments','1',NULL),(373,0,1484792646,NULL,'blogshowcommentscount','1',NULL),(374,0,1484792646,NULL,'defaulthomepage','1',NULL),(375,0,1484792646,NULL,'allowguestmymoodle','1',NULL),(376,0,1484792646,NULL,'navshowfullcoursenames','0',NULL),(377,0,1484792646,NULL,'navshowcategories','1',NULL),(378,0,1484792646,NULL,'navshowmycoursecategories','0',NULL),(379,0,1484792646,NULL,'navshowallcourses','0',NULL),(380,0,1484792646,NULL,'navsortmycoursessort','sortorder',NULL),(381,0,1484792646,NULL,'navcourselimit','20',NULL),(382,0,1484792646,NULL,'usesitenameforsitepages','0',NULL),(383,0,1484792646,NULL,'linkadmincategories','1',NULL),(384,0,1484792646,NULL,'linkcoursesections','0',NULL),(385,0,1484792646,NULL,'navshowfrontpagemods','1',NULL),(386,0,1484792646,NULL,'navadduserpostslinks','1',NULL),(387,0,1484792646,NULL,'formatstringstriptags','1',NULL),(388,0,1484792646,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(389,0,1484792646,NULL,'docroot','http://docs.moodle.org',NULL),(390,0,1484792646,NULL,'doclang','',NULL),(391,0,1484792646,NULL,'doctonewwindow','0',NULL),(392,0,1484792646,NULL,'courselistshortnames','0',NULL),(393,0,1484792646,NULL,'coursesperpage','20',NULL),(394,0,1484792646,NULL,'courseswithsummarieslimit','10',NULL),(395,0,1484792646,NULL,'courseoverviewfileslimit','1',NULL),(396,0,1484792646,NULL,'courseoverviewfilesext','.jpg,.gif,.png',NULL),(397,0,1484792646,NULL,'useexternalyui','0',NULL),(398,0,1484792646,NULL,'yuicomboloading','1',NULL),(399,0,1484792646,NULL,'cachejs','1',NULL),(400,0,1484792646,NULL,'modchooserdefault','1',NULL),(401,0,1484792646,NULL,'additionalhtmlhead','',NULL),(402,0,1484792646,NULL,'additionalhtmltopofbody','',NULL),(403,0,1484792646,NULL,'additionalhtmlfooter','',NULL),(404,0,1484792646,NULL,'pathtodu','',NULL),(405,0,1484792646,NULL,'aspellpath','',NULL),(406,0,1484792646,NULL,'pathtodot','',NULL),(407,0,1484792646,NULL,'pathtogs','/usr/bin/gs',NULL),(408,0,1484792646,NULL,'pathtounoconv','/usr/bin/unoconv',NULL),(409,0,1484792646,NULL,'supportname','Administrador Usuário',NULL),(410,0,1484792646,NULL,'supportemail','',NULL),(411,0,1484792646,NULL,'supportpage','',NULL),(412,0,1484792646,NULL,'dbsessions','0',NULL),(413,0,1484792646,NULL,'sessioncookie','',NULL),(414,0,1484792646,NULL,'sessioncookiepath','',NULL),(415,0,1484792646,NULL,'sessioncookiedomain','',NULL),(416,0,1484792646,NULL,'statsfirstrun','none',NULL),(417,0,1484792646,NULL,'statsmaxruntime','0',NULL),(418,0,1484792646,NULL,'statsruntimedays','31',NULL),(419,0,1484792646,NULL,'statsuserthreshold','0',NULL),(420,0,1484792646,NULL,'slasharguments','1',NULL),(421,0,1484792646,NULL,'getremoteaddrconf','0',NULL),(422,0,1484792646,NULL,'proxyhost','',NULL),(423,0,1484792646,NULL,'proxyport','0',NULL),(424,0,1484792646,NULL,'proxytype','HTTP',NULL),(425,0,1484792646,NULL,'proxyuser','',NULL),(426,0,1484792646,NULL,'proxypassword','',NULL),(427,0,1484792646,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(428,0,1484792646,NULL,'maintenance_enabled','0',NULL),(429,0,1484792646,NULL,'maintenance_message','',NULL),(430,0,1484792646,NULL,'deleteunconfirmed','168',NULL),(431,0,1484792646,NULL,'deleteincompleteusers','0',NULL),(432,0,1484792646,NULL,'disablegradehistory','0',NULL),(433,0,1484792646,NULL,'gradehistorylifetime','0',NULL),(434,0,1484792646,NULL,'tempdatafoldercleanup','168',NULL),(435,0,1484792646,NULL,'extramemorylimit','512M',NULL),(436,0,1484792646,NULL,'maxtimelimit','0',NULL),(437,0,1484792646,NULL,'curlcache','120',NULL),(438,0,1484792646,NULL,'curltimeoutkbitrate','56',NULL),(439,0,1484792646,NULL,'smtphosts','',NULL),(440,0,1484792646,NULL,'smtpsecure','',NULL),(441,0,1484792646,NULL,'smtpauthtype','LOGIN',NULL),(442,0,1484792646,NULL,'smtpuser','',NULL),(443,0,1484792646,NULL,'smtppass','',NULL),(444,0,1484792646,NULL,'smtpmaxbulk','1',NULL),(445,0,1484792646,NULL,'noreplyaddress','noreply@50.112.26.194',NULL),(446,0,1484792646,NULL,'allowedemaildomains','',NULL),(447,0,1484792646,NULL,'sitemailcharset','0',NULL),(448,0,1484792646,NULL,'allowusermailcharset','0',NULL),(449,0,1484792646,NULL,'allowattachments','1',NULL),(450,0,1484792646,NULL,'mailnewline','LF',NULL),(451,0,1484792646,NULL,'emailfromvia','1',NULL),(452,0,1484792646,NULL,'updateautocheck','1',NULL),(453,0,1484792646,NULL,'updateminmaturity','200',NULL),(454,0,1484792646,NULL,'updatenotifybuilds','0',NULL),(455,0,1484792646,NULL,'enablesafebrowserintegration','0',NULL),(456,0,1484792646,NULL,'dndallowtextandlinks','0',NULL),(457,0,1484792646,NULL,'debug','0',NULL),(458,0,1484792646,NULL,'debugdisplay','0',NULL),(459,0,1484792646,NULL,'debugsmtp','0',NULL),(460,0,1484792647,NULL,'perfdebug','7',NULL),(461,0,1484792647,NULL,'debugstringids','0',NULL),(462,0,1484792647,NULL,'debugvalidators','0',NULL),(463,0,1484792647,NULL,'debugpageinfo','0',NULL),(464,0,1484792647,NULL,'profilingenabled','0',NULL),(465,0,1484792647,NULL,'profilingincluded','',NULL),(466,0,1484792647,NULL,'profilingexcluded','',NULL),(467,0,1484792647,NULL,'profilingautofrec','0',NULL),(468,0,1484792647,NULL,'profilingallowme','0',NULL),(469,0,1484792647,NULL,'profilingallowall','0',NULL),(470,0,1484792647,NULL,'profilinglifetime','1440',NULL),(471,0,1484792647,NULL,'profilingimportprefix','(I)',NULL),(472,0,1484792658,'activitynames','filter_active','1',''),(473,0,1484792658,'mathjaxloader','filter_active','1',''),(474,0,1484792659,'mediaplugin','filter_active','1',''),(475,2,1484792904,NULL,'notloggedinroleid','6',NULL),(476,2,1484792904,NULL,'guestroleid','6',NULL),(477,2,1484792904,NULL,'defaultuserroleid','7',NULL),(478,2,1484792904,NULL,'creatornewroleid','3',NULL),(479,2,1484792904,NULL,'restorernewroleid','3',NULL),(480,2,1484792904,NULL,'gradebookroles','5',NULL),(481,2,1484792904,'resource','framesize','130',NULL),(482,2,1484792904,'resource','displayoptions','0,1,4,5,6',NULL),(483,2,1484792904,'resource','printintro','1',NULL),(484,2,1484792904,'resource','display','0',NULL),(485,2,1484792904,'resource','showsize','0',NULL),(486,2,1484792904,'resource','showtype','0',NULL),(487,2,1484792904,'resource','showdate','0',NULL),(488,2,1484792904,'resource','popupwidth','620',NULL),(489,2,1484792904,'resource','popupheight','450',NULL),(490,2,1484792904,'resource','filterfiles','0',NULL),(491,2,1484792904,NULL,'data_enablerssfeeds','0',NULL),(492,2,1484792904,NULL,'chat_method','ajax',NULL),(493,2,1484792904,NULL,'chat_refresh_userlist','10',NULL),(494,2,1484792904,NULL,'chat_old_ping','35',NULL),(495,2,1484792904,NULL,'chat_refresh_room','5',NULL),(496,2,1484792904,NULL,'chat_normal_updatemode','jsupdate',NULL),(497,2,1484792904,NULL,'chat_serverhost','50.112.26.194',NULL),(498,2,1484792904,NULL,'chat_serverip','127.0.0.1',NULL),(499,2,1484792904,NULL,'chat_serverport','9111',NULL),(500,2,1484792904,NULL,'chat_servermax','100',NULL),(501,2,1484792904,'imscp','keepold','1',NULL),(502,2,1484792904,'imscp','keepold_adv','',NULL),(503,2,1484792904,NULL,'forum_displaymode','3',NULL),(504,2,1484792904,NULL,'forum_shortpost','300',NULL),(505,2,1484792904,NULL,'forum_longpost','600',NULL),(506,2,1484792904,NULL,'forum_manydiscussions','100',NULL),(507,2,1484792904,NULL,'forum_maxbytes','512000',NULL),(508,2,1484792904,NULL,'forum_maxattachments','9',NULL),(509,2,1484792904,NULL,'forum_trackingtype','1',NULL),(510,2,1484792904,NULL,'forum_trackreadposts','1',NULL),(511,2,1484792904,NULL,'forum_allowforcedreadtracking','0',NULL),(512,2,1484792904,NULL,'forum_oldpostdays','14',NULL),(513,2,1484792904,NULL,'forum_usermarksread','0',NULL),(514,2,1484792904,NULL,'forum_cleanreadtime','2',NULL),(515,2,1484792904,NULL,'digestmailtime','17',NULL),(516,2,1484792904,NULL,'forum_enablerssfeeds','0',NULL),(517,2,1484792904,NULL,'forum_enabletimedposts','1',NULL),(518,2,1484792904,NULL,'glossary_entbypage','10',NULL),(519,2,1484792904,NULL,'glossary_dupentries','0',NULL),(520,2,1484792904,NULL,'glossary_allowcomments','0',NULL),(521,2,1484792904,NULL,'glossary_linkbydefault','1',NULL),(522,2,1484792904,NULL,'glossary_defaultapproval','1',NULL),(523,2,1484792904,NULL,'glossary_enablerssfeeds','0',NULL),(524,2,1484792904,NULL,'glossary_linkentries','0',NULL),(525,2,1484792904,NULL,'glossary_casesensitive','0',NULL),(526,2,1484792904,NULL,'glossary_fullmatch','0',NULL),(527,2,1484792905,'workshop','grade','80',NULL),(528,2,1484792905,'workshop','gradinggrade','20',NULL),(529,2,1484792905,'workshop','gradedecimals','0',NULL),(530,2,1484792905,'workshop','maxbytes','0',NULL),(531,2,1484792905,'workshop','strategy','accumulative',NULL),(532,2,1484792905,'workshop','examplesmode','0',NULL),(533,2,1484792905,'workshopallocation_random','numofreviews','5',NULL),(534,2,1484792905,'workshopform_numerrors','grade0','Não',NULL),(535,2,1484792905,'workshopform_numerrors','grade1','Sim',NULL),(536,2,1484792905,'workshopeval_best','comparison','5',NULL),(537,2,1484792905,'mod_lesson','mediafile','',NULL),(538,2,1484792905,'mod_lesson','mediafile_adv','1',NULL),(539,2,1484792905,'mod_lesson','mediawidth','640',NULL),(540,2,1484792905,'mod_lesson','mediaheight','480',NULL),(541,2,1484792905,'mod_lesson','mediaclose','0',NULL),(542,2,1484792905,'mod_lesson','progressbar','0',NULL),(543,2,1484792905,'mod_lesson','progressbar_adv','',NULL),(544,2,1484792905,'mod_lesson','ongoing','0',NULL),(545,2,1484792905,'mod_lesson','ongoing_adv','1',NULL),(546,2,1484792905,'mod_lesson','displayleftmenu','0',NULL),(547,2,1484792905,'mod_lesson','displayleftmenu_adv','',NULL),(548,2,1484792905,'mod_lesson','displayleftif','0',NULL),(549,2,1484792905,'mod_lesson','displayleftif_adv','1',NULL),(550,2,1484792905,'mod_lesson','slideshow','0',NULL),(551,2,1484792905,'mod_lesson','slideshow_adv','1',NULL),(552,2,1484792905,'mod_lesson','slideshowwidth','640',NULL),(553,2,1484792905,'mod_lesson','slideshowheight','480',NULL),(554,2,1484792905,'mod_lesson','slideshowbgcolor','#FFFFFF',NULL),(555,2,1484792905,'mod_lesson','maxanswers','5',NULL),(556,2,1484792905,'mod_lesson','maxanswers_adv','1',NULL),(557,2,1484792905,'mod_lesson','defaultfeedback','0',NULL),(558,2,1484792905,'mod_lesson','defaultfeedback_adv','1',NULL),(559,2,1484792905,'mod_lesson','activitylink','',NULL),(560,2,1484792905,'mod_lesson','activitylink_adv','1',NULL),(561,2,1484792905,'mod_lesson','timelimit','0',NULL),(562,2,1484792905,'mod_lesson','timelimit_adv','',NULL),(563,2,1484792905,'mod_lesson','password','0',NULL),(564,2,1484792905,'mod_lesson','password_adv','1',NULL),(565,2,1484792905,'mod_lesson','modattempts','0',NULL),(566,2,1484792905,'mod_lesson','modattempts_adv','',NULL),(567,2,1484792905,'mod_lesson','displayreview','0',NULL),(568,2,1484792905,'mod_lesson','displayreview_adv','',NULL),(569,2,1484792905,'mod_lesson','maximumnumberofattempts','1',NULL),(570,2,1484792905,'mod_lesson','maximumnumberofattempts_adv','',NULL),(571,2,1484792905,'mod_lesson','defaultnextpage','0',NULL),(572,2,1484792905,'mod_lesson','defaultnextpage_adv','1',NULL),(573,2,1484792905,'mod_lesson','numberofpagestoshow','1',NULL),(574,2,1484792905,'mod_lesson','numberofpagestoshow_adv','1',NULL),(575,2,1484792905,'mod_lesson','practice','0',NULL),(576,2,1484792905,'mod_lesson','practice_adv','',NULL),(577,2,1484792905,'mod_lesson','customscoring','1',NULL),(578,2,1484792905,'mod_lesson','customscoring_adv','1',NULL),(579,2,1484792905,'mod_lesson','retakesallowed','0',NULL),(580,2,1484792905,'mod_lesson','retakesallowed_adv','',NULL),(581,2,1484792905,'mod_lesson','handlingofretakes','0',NULL),(582,2,1484792905,'mod_lesson','handlingofretakes_adv','1',NULL),(583,2,1484792905,'mod_lesson','minimumnumberofquestions','0',NULL),(584,2,1484792905,'mod_lesson','minimumnumberofquestions_adv','1',NULL),(585,2,1484792905,'book','numberingoptions','0,1,2,3',NULL),(586,2,1484792905,'book','navoptions','0,1,2',NULL),(587,2,1484792905,'book','numbering','1',NULL),(588,2,1484792905,'book','navstyle','1',NULL),(589,2,1484792905,'scorm','displaycoursestructure','0',NULL),(590,2,1484792905,'scorm','displaycoursestructure_adv','',NULL),(591,2,1484792905,'scorm','popup','0',NULL),(592,2,1484792905,'scorm','popup_adv','',NULL),(593,2,1484792905,'scorm','displayactivityname','1',NULL),(594,2,1484792905,'scorm','framewidth','100',NULL),(595,2,1484792905,'scorm','framewidth_adv','1',NULL),(596,2,1484792905,'scorm','frameheight','500',NULL),(597,2,1484792905,'scorm','frameheight_adv','1',NULL),(598,2,1484792905,'scorm','winoptgrp_adv','1',NULL),(599,2,1484792905,'scorm','scrollbars','0',NULL),(600,2,1484792905,'scorm','directories','0',NULL),(601,2,1484792905,'scorm','location','0',NULL),(602,2,1484792905,'scorm','menubar','0',NULL),(603,2,1484792905,'scorm','toolbar','0',NULL),(604,2,1484792905,'scorm','status','0',NULL),(605,2,1484792905,'scorm','skipview','0',NULL),(606,2,1484792905,'scorm','skipview_adv','1',NULL),(607,2,1484792905,'scorm','hidebrowse','0',NULL),(608,2,1484792905,'scorm','hidebrowse_adv','1',NULL),(609,2,1484792905,'scorm','hidetoc','0',NULL),(610,2,1484792905,'scorm','hidetoc_adv','1',NULL),(611,2,1484792905,'scorm','nav','1',NULL),(612,2,1484792905,'scorm','nav_adv','1',NULL),(613,2,1484792905,'scorm','navpositionleft','-100',NULL),(614,2,1484792905,'scorm','navpositionleft_adv','1',NULL),(615,2,1484792905,'scorm','navpositiontop','-100',NULL),(616,2,1484792905,'scorm','navpositiontop_adv','1',NULL),(617,2,1484792905,'scorm','collapsetocwinsize','767',NULL),(618,2,1484792905,'scorm','collapsetocwinsize_adv','1',NULL),(619,2,1484792905,'scorm','displayattemptstatus','1',NULL),(620,2,1484792905,'scorm','displayattemptstatus_adv','',NULL),(621,2,1484792905,'scorm','grademethod','1',NULL),(622,2,1484792905,'scorm','maxgrade','100',NULL),(623,2,1484792905,'scorm','maxattempt','0',NULL),(624,2,1484792905,'scorm','whatgrade','0',NULL),(625,2,1484792905,'scorm','forcecompleted','0',NULL),(626,2,1484792905,'scorm','forcenewattempt','0',NULL),(627,2,1484792905,'scorm','autocommit','0',NULL),(628,2,1484792905,'scorm','masteryoverride','1',NULL),(629,2,1484792905,'scorm','lastattemptlock','0',NULL),(630,2,1484792905,'scorm','auto','0',NULL),(631,2,1484792905,'scorm','updatefreq','0',NULL),(632,2,1484792905,'scorm','scorm12standard','1',NULL),(633,2,1484792905,'scorm','allowtypeexternal','0',NULL),(634,2,1484792905,'scorm','allowtypelocalsync','0',NULL),(635,2,1484792905,'scorm','allowtypeexternalaicc','0',NULL),(636,2,1484792905,'scorm','allowaicchacp','0',NULL),(637,2,1484792905,'scorm','aicchacptimeout','30',NULL),(638,2,1484792905,'scorm','aicchacpkeepsessiondata','1',NULL),(639,2,1484792905,'scorm','aiccuserid','1',NULL),(640,2,1484792905,'scorm','forcejavascript','1',NULL),(641,2,1484792905,'scorm','allowapidebug','0',NULL),(642,2,1484792905,'scorm','apidebugmask','.*',NULL),(643,2,1484792905,'scorm','protectpackagedownloads','0',NULL),(644,2,1484792905,'page','displayoptions','5',NULL),(645,2,1484792905,'page','printheading','1',NULL),(646,2,1484792905,'page','printintro','0',NULL),(647,2,1484792905,'page','display','5',NULL),(648,2,1484792905,'page','popupwidth','620',NULL),(649,2,1484792905,'page','popupheight','450',NULL),(650,2,1484792905,'folder','showexpanded','1',NULL),(651,2,1484792905,'folder','maxsizetodownload','0',NULL),(652,2,1484792905,NULL,'feedback_allowfullanonymous','0',NULL),(653,2,1484792905,'quiz','timelimit','0',NULL),(654,2,1484792905,'quiz','timelimit_adv','',NULL),(655,2,1484792905,'quiz','overduehandling','autosubmit',NULL),(656,2,1484792905,'quiz','overduehandling_adv','',NULL),(657,2,1484792905,'quiz','graceperiod','86400',NULL),(658,2,1484792905,'quiz','graceperiod_adv','',NULL),(659,2,1484792905,'quiz','graceperiodmin','60',NULL),(660,2,1484792905,'quiz','attempts','0',NULL),(661,2,1484792905,'quiz','attempts_adv','',NULL),(662,2,1484792905,'quiz','grademethod','1',NULL),(663,2,1484792905,'quiz','grademethod_adv','',NULL),(664,2,1484792905,'quiz','maximumgrade','10',NULL),(665,2,1484792905,'quiz','questionsperpage','1',NULL),(666,2,1484792905,'quiz','questionsperpage_adv','',NULL),(667,2,1484792905,'quiz','navmethod','free',NULL),(668,2,1484792905,'quiz','navmethod_adv','1',NULL),(669,2,1484792905,'quiz','shuffleanswers','1',NULL),(670,2,1484792905,'quiz','shuffleanswers_adv','',NULL),(671,2,1484792905,'quiz','preferredbehaviour','deferredfeedback',NULL),(672,2,1484792905,'quiz','canredoquestions','0',NULL),(673,2,1484792905,'quiz','canredoquestions_adv','1',NULL),(674,2,1484792905,'quiz','attemptonlast','0',NULL),(675,2,1484792905,'quiz','attemptonlast_adv','1',NULL),(676,2,1484792905,'quiz','reviewattempt','69904',NULL),(677,2,1484792905,'quiz','reviewcorrectness','69904',NULL),(678,2,1484792905,'quiz','reviewmarks','69904',NULL),(679,2,1484792905,'quiz','reviewspecificfeedback','69904',NULL),(680,2,1484792905,'quiz','reviewgeneralfeedback','69904',NULL),(681,2,1484792905,'quiz','reviewrightanswer','69904',NULL),(682,2,1484792905,'quiz','reviewoverallfeedback','4368',NULL),(683,2,1484792905,'quiz','showuserpicture','0',NULL),(684,2,1484792905,'quiz','showuserpicture_adv','',NULL),(685,2,1484792905,'quiz','decimalpoints','2',NULL),(686,2,1484792905,'quiz','decimalpoints_adv','',NULL),(687,2,1484792905,'quiz','questiondecimalpoints','-1',NULL),(688,2,1484792905,'quiz','questiondecimalpoints_adv','1',NULL),(689,2,1484792905,'quiz','showblocks','0',NULL),(690,2,1484792905,'quiz','showblocks_adv','1',NULL),(691,2,1484792905,'quiz','password','',NULL),(692,2,1484792905,'quiz','password_adv','',NULL),(693,2,1484792905,'quiz','subnet','',NULL),(694,2,1484792905,'quiz','subnet_adv','1',NULL),(695,2,1484792905,'quiz','delay1','0',NULL),(696,2,1484792905,'quiz','delay1_adv','1',NULL),(697,2,1484792905,'quiz','delay2','0',NULL),(698,2,1484792905,'quiz','delay2_adv','1',NULL),(699,2,1484792905,'quiz','browsersecurity','-',NULL),(700,2,1484792905,'quiz','browsersecurity_adv','1',NULL),(701,2,1484792905,'quiz','initialnumfeedbacks','2',NULL),(702,2,1484792905,'quiz','autosaveperiod','60',NULL),(703,2,1484792905,'label','dndmedia','1',NULL),(704,2,1484792905,'label','dndresizewidth','400',NULL),(705,2,1484792905,'label','dndresizeheight','400',NULL),(706,2,1484792905,'assign','feedback_plugin_for_gradebook','assignfeedback_comments',NULL),(707,2,1484792905,'assign','showrecentsubmissions','0',NULL),(708,2,1484792905,'assign','submissionreceipts','1',NULL),(709,2,1484792905,'assign','submissionstatement','Esta tarefa é meu próprio trabalho, exceto onde eu reconheço o uso do trabalho de outras pessoas.',NULL),(710,2,1484792905,'assign','maxperpage','-1',NULL),(711,2,1484792905,'assign','alwaysshowdescription','1',NULL),(712,2,1484792905,'assign','alwaysshowdescription_adv','',NULL),(713,2,1484792905,'assign','alwaysshowdescription_locked','',NULL),(714,2,1484792905,'assign','allowsubmissionsfromdate','0',NULL),(715,2,1484792905,'assign','allowsubmissionsfromdate_enabled','1',NULL),(716,2,1484792905,'assign','allowsubmissionsfromdate_adv','',NULL),(717,2,1484792905,'assign','duedate','604800',NULL),(718,2,1484792905,'assign','duedate_enabled','1',NULL),(719,2,1484792905,'assign','duedate_adv','',NULL),(720,2,1484792905,'assign','cutoffdate','1209600',NULL),(721,2,1484792905,'assign','cutoffdate_enabled','',NULL),(722,2,1484792905,'assign','cutoffdate_adv','',NULL),(723,2,1484792905,'assign','submissiondrafts','0',NULL),(724,2,1484792905,'assign','submissiondrafts_adv','',NULL),(725,2,1484792905,'assign','submissiondrafts_locked','',NULL),(726,2,1484792905,'assign','requiresubmissionstatement','0',NULL),(727,2,1484792905,'assign','requiresubmissionstatement_adv','',NULL),(728,2,1484792905,'assign','requiresubmissionstatement_locked','',NULL),(729,2,1484792905,'assign','attemptreopenmethod','none',NULL),(730,2,1484792905,'assign','attemptreopenmethod_adv','',NULL),(731,2,1484792905,'assign','attemptreopenmethod_locked','',NULL),(732,2,1484792905,'assign','maxattempts','-1',NULL),(733,2,1484792905,'assign','maxattempts_adv','',NULL),(734,2,1484792905,'assign','maxattempts_locked','',NULL),(735,2,1484792905,'assign','teamsubmission','0',NULL),(736,2,1484792905,'assign','teamsubmission_adv','',NULL),(737,2,1484792905,'assign','teamsubmission_locked','',NULL),(738,2,1484792905,'assign','preventsubmissionnotingroup','0',NULL),(739,2,1484792905,'assign','preventsubmissionnotingroup_adv','',NULL),(740,2,1484792905,'assign','preventsubmissionnotingroup_locked','',NULL),(741,2,1484792905,'assign','requireallteammemberssubmit','0',NULL),(742,2,1484792905,'assign','requireallteammemberssubmit_adv','',NULL),(743,2,1484792905,'assign','requireallteammemberssubmit_locked','',NULL),(744,2,1484792905,'assign','teamsubmissiongroupingid','',NULL),(745,2,1484792905,'assign','teamsubmissiongroupingid_adv','',NULL),(746,2,1484792906,'assign','sendnotifications','0',NULL),(747,2,1484792906,'assign','sendnotifications_adv','',NULL),(748,2,1484792906,'assign','sendnotifications_locked','',NULL),(749,2,1484792906,'assign','sendlatenotifications','0',NULL),(750,2,1484792906,'assign','sendlatenotifications_adv','',NULL),(751,2,1484792906,'assign','sendlatenotifications_locked','',NULL),(752,2,1484792906,'assign','sendstudentnotifications','1',NULL),(753,2,1484792906,'assign','sendstudentnotifications_adv','',NULL),(754,2,1484792906,'assign','sendstudentnotifications_locked','',NULL),(755,2,1484792906,'assign','blindmarking','0',NULL),(756,2,1484792906,'assign','blindmarking_adv','',NULL),(757,2,1484792906,'assign','blindmarking_locked','',NULL),(758,2,1484792906,'assign','markingworkflow','0',NULL),(759,2,1484792906,'assign','markingworkflow_adv','',NULL),(760,2,1484792906,'assign','markingworkflow_locked','',NULL),(761,2,1484792906,'assign','markingallocation','0',NULL),(762,2,1484792906,'assign','markingallocation_adv','',NULL),(763,2,1484792906,'assign','markingallocation_locked','',NULL),(764,2,1484792906,'assignsubmission_file','default','1',NULL),(765,2,1484792906,'assignsubmission_file','maxfiles','20',NULL),(766,2,1484792906,'assignsubmission_file','maxbytes','0',NULL),(767,2,1484792906,'assignsubmission_onlinetext','default','0',NULL),(768,2,1484792906,'assignfeedback_comments','default','1',NULL),(769,2,1484792906,'assignfeedback_comments','inline','0',NULL),(770,2,1484792906,'assignfeedback_comments','inline_adv','',NULL),(771,2,1484792906,'assignfeedback_comments','inline_locked','',NULL),(772,2,1484792906,'assignfeedback_editpdf','stamps','',NULL),(773,2,1484792906,'assignfeedback_file','default','0',NULL),(774,2,1484792906,'assignfeedback_offline','default','0',NULL),(775,2,1484792906,'url','framesize','130',NULL),(776,2,1484792906,'url','secretphrase','',NULL),(777,2,1484792906,'url','rolesinparams','0',NULL),(778,2,1484792906,'url','displayoptions','0,1,5,6',NULL),(779,2,1484792906,'url','printintro','1',NULL),(780,2,1484792906,'url','display','0',NULL),(781,2,1484792906,'url','popupwidth','620',NULL),(782,2,1484792906,'url','popupheight','450',NULL),(783,2,1484792906,NULL,'block_rss_client_num_entries','5',NULL),(784,2,1484792906,NULL,'block_rss_client_timeout','30',NULL),(785,2,1484792906,NULL,'block_course_list_adminview','all',NULL),(786,2,1484792906,NULL,'block_course_list_hideallcourseslink','0',NULL),(787,2,1484792906,NULL,'block_html_allowcssclasses','0',NULL),(788,2,1484792906,'block_section_links','numsections1','22',NULL),(789,2,1484792906,'block_section_links','incby1','2',NULL),(790,2,1484792906,'block_section_links','numsections2','40',NULL),(791,2,1484792906,'block_section_links','incby2','5',NULL),(792,2,1484792906,'block_activity_results','config_showbest','3',NULL),(793,2,1484792906,'block_activity_results','config_showbest_locked','',NULL),(794,2,1484792906,'block_activity_results','config_showworst','0',NULL),(795,2,1484792906,'block_activity_results','config_showworst_locked','',NULL),(796,2,1484792906,'block_activity_results','config_usegroups','0',NULL),(797,2,1484792906,'block_activity_results','config_usegroups_locked','',NULL),(798,2,1484792906,'block_activity_results','config_nameformat','1',NULL),(799,2,1484792906,'block_activity_results','config_nameformat_locked','',NULL),(800,2,1484792906,'block_activity_results','config_gradeformat','1',NULL),(801,2,1484792906,'block_activity_results','config_gradeformat_locked','',NULL),(802,2,1484792906,'block_activity_results','config_decimalpoints','2',NULL),(803,2,1484792906,'block_activity_results','config_decimalpoints_locked','',NULL),(804,2,1484792906,NULL,'block_online_users_timetosee','5',NULL),(805,2,1484792906,'block_course_overview','defaultmaxcourses','10',NULL),(806,2,1484792906,'block_course_overview','forcedefaultmaxcourses','0',NULL),(807,2,1484792906,'block_course_overview','showchildren','0',NULL),(808,2,1484792906,'block_course_overview','showwelcomearea','0',NULL),(809,2,1484792906,'block_course_overview','showcategories','0',NULL),(810,2,1484792906,'block_tag_youtube','apikey','',NULL),(811,2,1484792906,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html',NULL),(812,2,1484792906,'editor_atto','autosavefrequency','60',NULL),(813,2,1484792906,'atto_collapse','showgroups','5',NULL),(814,2,1484792906,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n',NULL),(815,2,1484792906,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n',NULL),(816,2,1484792906,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n',NULL),(817,2,1484792906,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n',NULL),(818,2,1484792906,'atto_table','allowborders','0',NULL),(819,2,1484792906,'atto_table','allowbackgroundcolour','0',NULL),(820,2,1484792906,'atto_table','allowwidth','0',NULL),(821,2,1484792906,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen',NULL),(822,2,1484792906,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(823,2,1484792906,'editor_tinymce','customconfig','',NULL),(824,2,1484792906,'tinymce_moodleemoticon','requireemoticon','1',NULL),(825,2,1484792906,'tinymce_spellchecker','spellengine','',NULL),(826,2,1484792906,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(827,2,1484792906,'tool_recyclebin','coursebinenable','1',NULL),(828,2,1484792906,'tool_recyclebin','coursebinexpiry','604800',NULL),(829,2,1484792906,'tool_recyclebin','categorybinenable','1',NULL),(830,2,1484792906,'tool_recyclebin','categorybinexpiry','604800',NULL),(831,2,1484792906,'tool_recyclebin','autohide','1',NULL),(832,2,1484792906,NULL,'filter_censor_badwords','',NULL),(833,2,1484792906,NULL,'filter_multilang_force_old','0',NULL),(834,2,1484792906,'filter_urltolink','formats','0',NULL),(835,2,1484792906,'filter_urltolink','embedimages','1',NULL),(836,2,1484792906,'filter_emoticon','formats','1,4,0',NULL),(837,2,1484792906,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.7-latest/MathJax.js',NULL),(838,2,1484792906,'filter_mathjaxloader','texfiltercompatibility','0',NULL),(839,2,1484792906,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n',NULL),(840,2,1484792906,'filter_mathjaxloader','additionaldelimiters','',NULL),(841,2,1484792906,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(842,2,1484792906,'filter_tex','latexbackground','#FFFFFF',NULL),(843,2,1484792906,'filter_tex','density','120',NULL),(844,2,1484792906,'filter_tex','pathlatex','/usr/bin/latex',NULL),(845,2,1484792906,'filter_tex','pathdvips','/usr/bin/dvips',NULL),(846,2,1484792906,'filter_tex','pathconvert','/usr/bin/convert',NULL),(847,2,1484792906,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm',NULL),(848,2,1484792906,'filter_tex','pathmimetex','',NULL),(849,2,1484792906,'filter_tex','convertformat','gif',NULL),(850,2,1484792906,'format_singleactivity','activitytype','forum',NULL),(851,2,1484792906,'enrol_guest','requirepassword','0',NULL),(852,2,1484792906,'enrol_guest','usepasswordpolicy','0',NULL),(853,2,1484792906,'enrol_guest','showhint','0',NULL),(854,2,1484792906,'enrol_guest','defaultenrol','1',NULL),(855,2,1484792906,'enrol_guest','status','1',NULL),(856,2,1484792906,'enrol_guest','status_adv','',NULL),(857,2,1484792906,'enrol_imsenterprise','imsfilelocation','',NULL),(858,2,1484792906,'enrol_imsenterprise','logtolocation','',NULL),(859,2,1484792906,'enrol_imsenterprise','mailadmins','0',NULL),(860,2,1484792906,'enrol_imsenterprise','createnewusers','0',NULL),(861,2,1484792906,'enrol_imsenterprise','imsupdateusers','0',NULL),(862,2,1484792906,'enrol_imsenterprise','imsdeleteusers','0',NULL),(863,2,1484792906,'enrol_imsenterprise','fixcaseusernames','0',NULL),(864,2,1484792906,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(865,2,1484792906,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(866,2,1484792906,'enrol_imsenterprise','imsrolemap01','5',NULL),(867,2,1484792906,'enrol_imsenterprise','imsrolemap02','3',NULL),(868,2,1484792906,'enrol_imsenterprise','imsrolemap03','3',NULL),(869,2,1484792906,'enrol_imsenterprise','imsrolemap04','5',NULL),(870,2,1484792906,'enrol_imsenterprise','imsrolemap05','0',NULL),(871,2,1484792906,'enrol_imsenterprise','imsrolemap06','4',NULL),(872,2,1484792906,'enrol_imsenterprise','imsrolemap07','0',NULL),(873,2,1484792906,'enrol_imsenterprise','imsrolemap08','4',NULL),(874,2,1484792906,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(875,2,1484792906,'enrol_imsenterprise','createnewcourses','0',NULL),(876,2,1484792906,'enrol_imsenterprise','updatecourses','0',NULL),(877,2,1484792906,'enrol_imsenterprise','createnewcategories','0',NULL),(878,2,1484792906,'enrol_imsenterprise','nestedcategories','0',NULL),(879,2,1484792906,'enrol_imsenterprise','categoryidnumber','0',NULL),(880,2,1484792906,'enrol_imsenterprise','categoryseparator','',NULL),(881,2,1484792906,'enrol_imsenterprise','imsunenrol','0',NULL),(882,2,1484792906,'enrol_imsenterprise','imscoursemapshortname','coursecode',NULL),(883,2,1484792906,'enrol_imsenterprise','imscoursemapfullname','short',NULL),(884,2,1484792906,'enrol_imsenterprise','imscoursemapsummary','ignore',NULL),(885,2,1484792906,'enrol_imsenterprise','imsrestricttarget','',NULL),(886,2,1484792906,'enrol_imsenterprise','imscapitafix','0',NULL),(887,2,1484792906,'enrol_flatfile','location','',NULL),(888,2,1484792906,'enrol_flatfile','encoding','UTF-8',NULL),(889,2,1484792906,'enrol_flatfile','mailstudents','0',NULL),(890,2,1484792906,'enrol_flatfile','mailteachers','0',NULL),(891,2,1484792906,'enrol_flatfile','mailadmins','0',NULL),(892,2,1484792906,'enrol_flatfile','unenrolaction','3',NULL),(893,2,1484792906,'enrol_flatfile','expiredaction','3',NULL),(894,2,1484792906,'enrol_self','requirepassword','0',NULL),(895,2,1484792906,'enrol_self','usepasswordpolicy','0',NULL),(896,2,1484792906,'enrol_self','showhint','0',NULL),(897,2,1484792906,'enrol_self','expiredaction','1',NULL),(898,2,1484792906,'enrol_self','expirynotifyhour','6',NULL),(899,2,1484792906,'enrol_self','defaultenrol','1',NULL),(900,2,1484792906,'enrol_self','status','1',NULL),(901,2,1484792906,'enrol_self','newenrols','1',NULL),(902,2,1484792906,'enrol_self','groupkey','0',NULL),(903,2,1484792906,'enrol_self','roleid','5',NULL),(904,2,1484792906,'enrol_self','enrolperiod','0',NULL),(905,2,1484792906,'enrol_self','expirynotify','0',NULL),(906,2,1484792906,'enrol_self','expirythreshold','86400',NULL),(907,2,1484792906,'enrol_self','longtimenosee','0',NULL),(908,2,1484792906,'enrol_self','maxenrolled','0',NULL),(909,2,1484792906,'enrol_self','sendcoursewelcomemessage','1',NULL),(910,2,1484792906,'enrol_database','dbtype','',NULL),(911,2,1484792906,'enrol_database','dbhost','localhost',NULL),(912,2,1484792906,'enrol_database','dbuser','',NULL),(913,2,1484792906,'enrol_database','dbpass','',NULL),(914,2,1484792906,'enrol_database','dbname','',NULL),(915,2,1484792906,'enrol_database','dbencoding','utf-8',NULL),(916,2,1484792906,'enrol_database','dbsetupsql','',NULL),(917,2,1484792906,'enrol_database','dbsybasequoting','0',NULL),(918,2,1484792906,'enrol_database','debugdb','0',NULL),(919,2,1484792906,'enrol_database','localcoursefield','idnumber',NULL),(920,2,1484792906,'enrol_database','localuserfield','idnumber',NULL),(921,2,1484792906,'enrol_database','localrolefield','shortname',NULL),(922,2,1484792906,'enrol_database','localcategoryfield','id',NULL),(923,2,1484792906,'enrol_database','remoteenroltable','',NULL),(924,2,1484792906,'enrol_database','remotecoursefield','',NULL),(925,2,1484792906,'enrol_database','remoteuserfield','',NULL),(926,2,1484792906,'enrol_database','remoterolefield','',NULL),(927,2,1484792906,'enrol_database','remoteotheruserfield','',NULL),(928,2,1484792906,'enrol_database','defaultrole','5',NULL),(929,2,1484792906,'enrol_database','ignorehiddencourses','0',NULL),(930,2,1484792906,'enrol_database','unenrolaction','0',NULL),(931,2,1484792906,'enrol_database','newcoursetable','',NULL),(932,2,1484792906,'enrol_database','newcoursefullname','fullname',NULL),(933,2,1484792906,'enrol_database','newcourseshortname','shortname',NULL),(934,2,1484792906,'enrol_database','newcourseidnumber','idnumber',NULL),(935,2,1484792906,'enrol_database','newcoursecategory','',NULL),(936,2,1484792906,'enrol_database','defaultcategory','1',NULL),(937,2,1484792906,'enrol_database','templatecourse','',NULL),(938,2,1484792906,'enrol_meta','nosyncroleids','',NULL),(939,2,1484792906,'enrol_meta','syncall','1',NULL),(940,2,1484792906,'enrol_meta','unenrolaction','3',NULL),(941,2,1484792906,'enrol_meta','coursesort','sortorder',NULL),(942,2,1484792906,'enrol_manual','expiredaction','1',NULL),(943,2,1484792906,'enrol_manual','expirynotifyhour','6',NULL),(944,2,1484792906,'enrol_manual','defaultenrol','1',NULL),(945,2,1484792906,'enrol_manual','status','0',NULL),(946,2,1484792906,'enrol_manual','roleid','5',NULL),(947,2,1484792906,'enrol_manual','enrolstart','4',NULL),(948,2,1484792906,'enrol_manual','enrolperiod','0',NULL),(949,2,1484792906,'enrol_manual','expirynotify','0',NULL),(950,2,1484792906,'enrol_manual','expirythreshold','86400',NULL),(951,2,1484792906,'enrol_mnet','roleid','5',NULL),(952,2,1484792906,'enrol_mnet','roleid_adv','1',NULL),(953,2,1484792906,'enrol_paypal','paypalbusiness','',NULL),(954,2,1484792906,'enrol_paypal','mailstudents','0',NULL),(955,2,1484792906,'enrol_paypal','mailteachers','0',NULL),(956,2,1484792906,'enrol_paypal','mailadmins','0',NULL),(957,2,1484792906,'enrol_paypal','expiredaction','3',NULL),(958,2,1484792906,'enrol_paypal','status','1',NULL),(959,2,1484792906,'enrol_paypal','cost','0',NULL),(960,2,1484792906,'enrol_paypal','currency','USD',NULL),(961,2,1484792906,'enrol_paypal','roleid','5',NULL),(962,2,1484792906,'enrol_paypal','enrolperiod','0',NULL),(963,2,1484792906,'enrol_lti','emaildisplay','2',NULL),(964,2,1484792906,'enrol_lti','city','',NULL),(965,2,1484792906,'enrol_lti','country','',NULL),(966,2,1484792906,'enrol_lti','timezone','99',NULL),(967,2,1484792906,'enrol_lti','lang','pt_br',NULL),(968,2,1484792906,'enrol_lti','institution','',NULL),(969,2,1484792906,'enrol_cohort','roleid','5',NULL),(970,2,1484792906,'enrol_cohort','unenrolaction','0',NULL),(971,2,1484792906,'logstore_database','dbdriver','',NULL),(972,2,1484792906,'logstore_database','dbhost','',NULL),(973,2,1484792906,'logstore_database','dbuser','',NULL),(974,2,1484792906,'logstore_database','dbpass','',NULL),(975,2,1484792906,'logstore_database','dbname','',NULL),(976,2,1484792906,'logstore_database','dbtable','',NULL),(977,2,1484792906,'logstore_database','dbpersist','0',NULL),(978,2,1484792906,'logstore_database','dbsocket','',NULL),(979,2,1484792906,'logstore_database','dbport','',NULL),(980,2,1484792906,'logstore_database','dbschema','',NULL),(981,2,1484792906,'logstore_database','dbcollation','',NULL),(982,2,1484792906,'logstore_database','buffersize','50',NULL),(983,2,1484792906,'logstore_database','logguests','0',NULL),(984,2,1484792906,'logstore_database','includelevels','1,2,0',NULL),(985,2,1484792906,'logstore_database','includeactions','c,r,u,d',NULL),(986,2,1484792906,'logstore_legacy','loglegacy','0',NULL),(987,2,1484792906,NULL,'logguests','1',NULL),(988,2,1484792906,NULL,'loglifetime','0',NULL),(989,2,1484792906,'logstore_standard','logguests','1',NULL),(990,2,1484792907,'logstore_standard','loglifetime','0',NULL),(991,2,1484792907,'logstore_standard','buffersize','50',NULL),(992,2,1484792907,'media_videojs','videoextensions','.mov, .mp4, .m4v, .ogv, .webm, .flv, .f4v',NULL),(993,2,1484792907,'media_videojs','audioextensions','.aac, .flac, .mp3, .m4a, .oga, .ogg, .wav',NULL),(994,2,1484792907,'media_videojs','useflash','0',NULL),(995,2,1484792907,'media_videojs','youtube','1',NULL),(996,2,1484792907,'media_videojs','videocssclass','video-js',NULL),(997,2,1484792907,'media_videojs','audiocssclass','video-js',NULL),(998,2,1484792907,'media_videojs','limitsize','1',NULL),(999,2,1484792907,'antivirus_clamav','runningmethod','commandline',NULL),(1000,2,1484792907,'antivirus_clamav','pathtoclam','',NULL),(1001,2,1484792907,'antivirus_clamav','pathtounixsocket','',NULL),(1002,2,1484792907,'antivirus_clamav','clamfailureonupload','donothing',NULL),(1003,2,1484792907,NULL,'jabberhost','',NULL),(1004,2,1484792907,NULL,'jabberserver','',NULL),(1005,2,1484792907,NULL,'jabberusername','',NULL),(1006,2,1484792907,NULL,'jabberpassword','',NULL),(1007,2,1484792907,NULL,'jabberport','5222',NULL),(1008,2,1484792907,NULL,'airnotifierurl','https://messages.moodle.net',NULL),(1009,2,1484792907,NULL,'airnotifierport','443',NULL),(1010,2,1484792907,NULL,'airnotifiermobileappname','com.moodle.moodlemobile',NULL),(1011,2,1484792907,NULL,'airnotifierappname','commoodlemoodlemobile',NULL),(1012,2,1484792907,NULL,'airnotifieraccesskey','',NULL),(1013,2,1484792907,NULL,'profileroles','5,4,3',NULL),(1014,2,1484792907,NULL,'coursecontact','3',NULL),(1015,2,1484792907,NULL,'frontpage','6',NULL),(1016,2,1484792907,NULL,'frontpageloggedin','6',NULL),(1017,2,1484792907,NULL,'maxcategorydepth','2',NULL),(1018,2,1484792907,NULL,'frontpagecourselimit','200',NULL),(1019,2,1484792907,NULL,'commentsperpage','15',NULL),(1020,2,1484792907,NULL,'defaultfrontpageroleid','8',NULL),(1021,2,1484792907,NULL,'messageinbound_enabled','0',NULL),(1022,2,1484792907,NULL,'messageinbound_mailbox','',NULL),(1023,2,1484792907,NULL,'messageinbound_domain','',NULL),(1024,2,1484792907,NULL,'messageinbound_host','',NULL),(1025,2,1484792907,NULL,'messageinbound_hostssl','ssl',NULL),(1026,2,1484792907,NULL,'messageinbound_hostuser','',NULL),(1027,2,1484792907,NULL,'messageinbound_hostpass','',NULL),(1028,2,1484792907,NULL,'enablemobilewebservice','0',NULL),(1029,2,1484874519,NULL,'frontpage','0,7,6','6'),(1030,2,1484874519,NULL,'frontpageloggedin','0,7,6','6'),(1031,2,1484874858,NULL,'frontpage','4,0,2,7,6','0,7,6'),(1032,2,1484874858,NULL,'frontpageloggedin','4,0,5,2,7,6','0,7,6'),(1033,5,1485998150,NULL,'timezone','America/Sao_Paulo',NULL),(1034,5,1485998150,NULL,'registerauth','',NULL);
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1294 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'question','multichoice_sortorder','1'),(2,'question','truefalse_sortorder','2'),(3,'question','match_sortorder','3'),(4,'question','shortanswer_sortorder','4'),(5,'question','numerical_sortorder','5'),(6,'question','essay_sortorder','6'),(7,'moodlecourse','visible','1'),(8,'moodlecourse','format','topics'),(9,'moodlecourse','maxsections','52'),(10,'moodlecourse','numsections','4'),(11,'moodlecourse','hiddensections','0'),(12,'moodlecourse','coursedisplay','0'),(13,'moodlecourse','courseduration','31536000'),(14,'moodlecourse','lang',''),(15,'moodlecourse','newsitems','5'),(16,'moodlecourse','showgrades','1'),(17,'moodlecourse','showreports','0'),(18,'moodlecourse','maxbytes','0'),(19,'moodlecourse','enablecompletion','0'),(20,'moodlecourse','groupmode','0'),(21,'moodlecourse','groupmodeforce','0'),(22,'backup','loglifetime','30'),(23,'backup','backup_general_users','1'),(24,'backup','backup_general_users_locked',''),(25,'backup','backup_general_anonymize','0'),(26,'backup','backup_general_anonymize_locked',''),(27,'backup','backup_general_role_assignments','1'),(28,'backup','backup_general_role_assignments_locked',''),(29,'backup','backup_general_activities','1'),(30,'backup','backup_general_activities_locked',''),(31,'backup','backup_general_blocks','1'),(32,'backup','backup_general_blocks_locked',''),(33,'backup','backup_general_filters','1'),(34,'backup','backup_general_filters_locked',''),(35,'backup','backup_general_comments','1'),(36,'backup','backup_general_comments_locked',''),(37,'backup','backup_general_badges','1'),(38,'backup','backup_general_badges_locked',''),(39,'backup','backup_general_calendarevents','1'),(40,'backup','backup_general_calendarevents_locked',''),(41,'backup','backup_general_userscompletion','1'),(42,'backup','backup_general_userscompletion_locked',''),(43,'backup','backup_general_logs','0'),(44,'backup','backup_general_logs_locked',''),(45,'backup','backup_general_histories','0'),(46,'backup','backup_general_histories_locked',''),(47,'backup','backup_general_questionbank','1'),(48,'backup','backup_general_questionbank_locked',''),(49,'backup','backup_general_groups','1'),(50,'backup','backup_general_groups_locked',''),(51,'backup','backup_general_competencies','1'),(52,'backup','backup_general_competencies_locked',''),(53,'backup','import_general_maxresults','10'),(54,'backup','import_general_duplicate_admin_allowed','0'),(55,'backup','backup_import_activities','1'),(56,'backup','backup_import_activities_locked',''),(57,'backup','backup_import_blocks','1'),(58,'backup','backup_import_blocks_locked',''),(59,'backup','backup_import_filters','1'),(60,'backup','backup_import_filters_locked',''),(61,'backup','backup_import_calendarevents','1'),(62,'backup','backup_import_calendarevents_locked',''),(63,'backup','backup_import_questionbank','1'),(64,'backup','backup_import_questionbank_locked',''),(65,'backup','backup_import_groups','1'),(66,'backup','backup_import_groups_locked',''),(67,'backup','backup_import_competencies','1'),(68,'backup','backup_import_competencies_locked',''),(69,'backup','backup_auto_active','0'),(70,'backup','backup_auto_weekdays','0000000'),(71,'backup','backup_auto_hour','0'),(72,'backup','backup_auto_minute','0'),(73,'backup','backup_auto_storage','0'),(74,'backup','backup_auto_destination',''),(75,'backup','backup_auto_max_kept','1'),(76,'backup','backup_auto_delete_days','0'),(77,'backup','backup_auto_min_kept','0'),(78,'backup','backup_shortname','0'),(79,'backup','backup_auto_skip_hidden','1'),(80,'backup','backup_auto_skip_modif_days','30'),(81,'backup','backup_auto_skip_modif_prev','0'),(82,'backup','backup_auto_users','1'),(83,'backup','backup_auto_role_assignments','1'),(84,'backup','backup_auto_activities','1'),(85,'backup','backup_auto_blocks','1'),(86,'backup','backup_auto_filters','1'),(87,'backup','backup_auto_comments','1'),(88,'backup','backup_auto_badges','1'),(89,'backup','backup_auto_calendarevents','1'),(90,'backup','backup_auto_userscompletion','1'),(91,'backup','backup_auto_logs','0'),(92,'backup','backup_auto_histories','0'),(93,'backup','backup_auto_questionbank','1'),(94,'backup','backup_auto_groups','1'),(95,'backup','backup_auto_competencies','1'),(96,'core_competency','enabled','1'),(97,'core_competency','pushcourseratingstouserplans','1'),(98,'cachestore_apcu','testperformance','0'),(99,'cachestore_memcache','testservers',''),(100,'cachestore_memcached','testservers',''),(101,'cachestore_mongodb','testserver',''),(102,'cachestore_redis','test_server',''),(103,'question_preview','behaviour','deferredfeedback'),(104,'question_preview','correctness','1'),(105,'question_preview','marks','2'),(106,'question_preview','markdp','2'),(107,'question_preview','feedback','1'),(108,'question_preview','generalfeedback','1'),(109,'question_preview','rightanswer','1'),(110,'question_preview','history','0'),(111,'theme_boost','preset','default.scss'),(112,'theme_boost','presetfiles',''),(113,'theme_boost','brandcolor',''),(114,'theme_boost','scsspre',''),(115,'theme_boost','scss',''),(116,'theme_clean','invert','0'),(117,'theme_clean','logo',''),(118,'theme_clean','smalllogo',''),(119,'theme_clean','sitename','1'),(120,'theme_clean','customcss',''),(121,'theme_clean','footnote',''),(122,'theme_more','textcolor','#333366'),(123,'theme_more','linkcolor','#FF6500'),(124,'theme_more','bodybackground',''),(125,'theme_more','backgroundimage',''),(126,'theme_more','backgroundrepeat','repeat'),(127,'theme_more','backgroundposition','0'),(128,'theme_more','backgroundfixed','0'),(129,'theme_more','contentbackground','#FFFFFF'),(130,'theme_more','secondarybackground','#FFFFFF'),(131,'theme_more','invert','1'),(132,'theme_more','logo',''),(133,'theme_more','smalllogo',''),(134,'theme_more','sitename','1'),(135,'theme_more','customcss',''),(136,'theme_more','footnote',''),(137,'core_admin','logo',''),(138,'core_admin','logocompact',''),(139,'antivirus_clamav','version','2016120500'),(140,'availability_completion','version','2016120500'),(141,'availability_date','version','2016120500'),(142,'availability_grade','version','2016120500'),(143,'availability_group','version','2016120500'),(144,'availability_grouping','version','2016120500'),(145,'availability_profile','version','2016120500'),(146,'qtype_calculated','version','2016120500'),(147,'qtype_calculatedmulti','version','2016120500'),(148,'qtype_calculatedsimple','version','2016120500'),(149,'qtype_ddimageortext','version','2016120500'),(150,'qtype_ddmarker','version','2016120500'),(151,'qtype_ddwtos','version','2016120500'),(152,'qtype_description','version','2016120500'),(153,'qtype_essay','version','2016120500'),(154,'qtype_gapselect','version','2016120500'),(155,'qtype_match','version','2016120500'),(156,'qtype_missingtype','version','2016120500'),(157,'qtype_multianswer','version','2016120500'),(158,'qtype_multichoice','version','2016120500'),(159,'qtype_numerical','version','2016120500'),(160,'qtype_random','version','2016120500'),(161,'qtype_randomsamatch','version','2016120500'),(162,'qtype_shortanswer','version','2016120500'),(163,'qtype_truefalse','version','2016120500'),(164,'mod_assign','version','2016120500'),(165,'mod_assignment','version','2016120500'),(167,'mod_book','version','2016120500'),(168,'mod_chat','version','2016120500'),(169,'mod_choice','version','2016120500'),(170,'mod_data','version','2016120500'),(171,'mod_feedback','version','2016120500'),(173,'mod_folder','version','2016120500'),(175,'mod_forum','version','2016120500'),(176,'mod_glossary','version','2016120500'),(177,'mod_imscp','version','2016120500'),(179,'mod_label','version','2016120500'),(180,'mod_lesson','version','2016120500'),(181,'mod_lti','version','2016120500'),(182,'mod_page','version','2016120500'),(184,'mod_quiz','version','2016120500'),(185,'mod_resource','version','2016120500'),(186,'mod_scorm','version','2016120501'),(187,'mod_survey','version','2016120500'),(189,'mod_url','version','2016120500'),(191,'mod_wiki','version','2016120500'),(193,'mod_workshop','version','2016120500'),(194,'auth_cas','version','2016120500'),(196,'auth_db','version','2016120500'),(198,'auth_email','version','2016120500'),(199,'auth_fc','version','2016120500'),(201,'auth_imap','version','2016120500'),(203,'auth_ldap','version','2016120500'),(205,'auth_lti','version','2016120500'),(206,'auth_manual','version','2016120500'),(207,'auth_mnet','version','2016120500'),(209,'auth_nntp','version','2016120500'),(211,'auth_nologin','version','2016120500'),(212,'auth_none','version','2016120500'),(213,'auth_pam','version','2016120500'),(215,'auth_pop3','version','2016120500'),(217,'auth_shibboleth','version','2016120500'),(219,'auth_webservice','version','2016120500'),(220,'calendartype_gregorian','version','2016120500'),(221,'enrol_category','version','2016120500'),(223,'enrol_cohort','version','2016120500'),(224,'enrol_database','version','2016120500'),(226,'enrol_flatfile','version','2016120500'),(228,'enrol_flatfile','map_1','manager'),(229,'enrol_flatfile','map_2','coursecreator'),(230,'enrol_flatfile','map_3','editingteacher'),(231,'enrol_flatfile','map_4','teacher'),(232,'enrol_flatfile','map_5','student'),(233,'enrol_flatfile','map_6','guest'),(234,'enrol_flatfile','map_7','user'),(235,'enrol_flatfile','map_8','frontpage'),(236,'enrol_guest','version','2016120500'),(237,'enrol_imsenterprise','version','2016120500'),(239,'enrol_ldap','version','2016120500'),(241,'enrol_lti','version','2016120500'),(242,'enrol_manual','version','2016120500'),(244,'enrol_meta','version','2016120500'),(246,'enrol_mnet','version','2016120500'),(247,'enrol_paypal','version','2016120500'),(248,'enrol_self','version','2016120500'),(250,'message_airnotifier','version','2016120500'),(252,'message','airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(253,'message','airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(254,'message','airnotifier_provider_enrol_manual_expiry_notification_permitted','permitted'),(255,'message','airnotifier_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(256,'message','airnotifier_provider_enrol_self_expiry_notification_permitted','permitted'),(257,'message','airnotifier_provider_mod_assign_assign_notification_permitted','permitted'),(258,'message','airnotifier_provider_mod_assignment_assignment_updates_permitted','permitted'),(259,'message','airnotifier_provider_mod_feedback_submission_permitted','permitted'),(260,'message','airnotifier_provider_mod_feedback_message_permitted','permitted'),(261,'message','airnotifier_provider_mod_forum_posts_permitted','permitted'),(262,'message','airnotifier_provider_mod_forum_digests_permitted','permitted'),(263,'message','airnotifier_provider_mod_lesson_graded_essay_permitted','permitted'),(264,'message','airnotifier_provider_mod_quiz_submission_permitted','permitted'),(265,'message','airnotifier_provider_mod_quiz_confirmation_permitted','permitted'),(266,'message','airnotifier_provider_mod_quiz_attempt_overdue_permitted','permitted'),(267,'message','airnotifier_provider_moodle_notices_permitted','permitted'),(268,'message','airnotifier_provider_moodle_errors_permitted','permitted'),(269,'message','airnotifier_provider_moodle_availableupdate_permitted','permitted'),(270,'message','airnotifier_provider_moodle_instantmessage_permitted','permitted'),(271,'message','airnotifier_provider_moodle_backup_permitted','permitted'),(272,'message','airnotifier_provider_moodle_courserequested_permitted','permitted'),(273,'message','airnotifier_provider_moodle_courserequestapproved_permitted','permitted'),(274,'message','airnotifier_provider_moodle_courserequestrejected_permitted','permitted'),(275,'message','airnotifier_provider_moodle_badgerecipientnotice_permitted','permitted'),(276,'message','airnotifier_provider_moodle_badgecreatornotice_permitted','permitted'),(277,'message','airnotifier_provider_moodle_competencyplancomment_permitted','permitted'),(278,'message','airnotifier_provider_moodle_competencyusercompcomment_permitted','permitted'),(279,'message_email','version','2016120500'),(281,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(282,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(283,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(284,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(285,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(286,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(287,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(288,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(289,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(290,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(291,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(292,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(293,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(294,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(295,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(296,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(297,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(298,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(299,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(300,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(301,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(302,'message','email_provider_mod_feedback_submission_permitted','permitted'),(303,'message','message_provider_mod_feedback_submission_loggedin','email'),(304,'message','message_provider_mod_feedback_submission_loggedoff','email'),(305,'message','email_provider_mod_feedback_message_permitted','permitted'),(306,'message','message_provider_mod_feedback_message_loggedin','email'),(307,'message','message_provider_mod_feedback_message_loggedoff','email'),(308,'message','email_provider_mod_forum_posts_permitted','permitted'),(309,'message','message_provider_mod_forum_posts_loggedin','email'),(310,'message','message_provider_mod_forum_posts_loggedoff','email'),(311,'message','email_provider_mod_forum_digests_permitted','permitted'),(312,'message','message_provider_mod_forum_digests_loggedin','email'),(313,'message','message_provider_mod_forum_digests_loggedoff','email'),(314,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(315,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(316,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(317,'message','email_provider_mod_quiz_submission_permitted','permitted'),(318,'message','message_provider_mod_quiz_submission_loggedin','email'),(319,'message','message_provider_mod_quiz_submission_loggedoff','email'),(320,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(321,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(322,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(323,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(324,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(325,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(326,'message','email_provider_moodle_notices_permitted','permitted'),(327,'message','message_provider_moodle_notices_loggedin','email'),(328,'message','message_provider_moodle_notices_loggedoff','email'),(329,'message','email_provider_moodle_errors_permitted','permitted'),(330,'message','message_provider_moodle_errors_loggedin','email'),(331,'message','message_provider_moodle_errors_loggedoff','email'),(332,'message','email_provider_moodle_availableupdate_permitted','permitted'),(333,'message','message_provider_moodle_availableupdate_loggedin','email'),(334,'message','message_provider_moodle_availableupdate_loggedoff','email'),(335,'message','email_provider_moodle_instantmessage_permitted','permitted'),(336,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(337,'message','email_provider_moodle_backup_permitted','permitted'),(338,'message','message_provider_moodle_backup_loggedin','email'),(339,'message','message_provider_moodle_backup_loggedoff','email'),(340,'message','email_provider_moodle_courserequested_permitted','permitted'),(341,'message','message_provider_moodle_courserequested_loggedin','email'),(342,'message','message_provider_moodle_courserequested_loggedoff','email'),(343,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(344,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(345,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(346,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(347,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(348,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(349,'message','email_provider_moodle_badgerecipientnotice_permitted','permitted'),(350,'message','message_provider_moodle_badgerecipientnotice_loggedoff','popup,email'),(351,'message','email_provider_moodle_badgecreatornotice_permitted','permitted'),(352,'message','message_provider_moodle_badgecreatornotice_loggedoff','email'),(353,'message','email_provider_moodle_competencyplancomment_permitted','permitted'),(354,'message','message_provider_moodle_competencyplancomment_loggedin','email'),(355,'message','message_provider_moodle_competencyplancomment_loggedoff','email'),(356,'message','email_provider_moodle_competencyusercompcomment_permitted','permitted'),(357,'message','message_provider_moodle_competencyusercompcomment_loggedin','email'),(358,'message','message_provider_moodle_competencyusercompcomment_loggedoff','email'),(359,'message_jabber','version','2016120500'),(361,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(362,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(363,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(364,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(365,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(366,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(367,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(368,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(369,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(370,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(371,'message','jabber_provider_mod_forum_digests_permitted','permitted'),(372,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(373,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(374,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(375,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(376,'message','jabber_provider_moodle_notices_permitted','permitted'),(377,'message','jabber_provider_moodle_errors_permitted','permitted'),(378,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(379,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(380,'message','jabber_provider_moodle_backup_permitted','permitted'),(381,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(382,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(383,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(384,'message','jabber_provider_moodle_badgerecipientnotice_permitted','permitted'),(385,'message','jabber_provider_moodle_badgecreatornotice_permitted','permitted'),(386,'message','jabber_provider_moodle_competencyplancomment_permitted','permitted'),(387,'message','jabber_provider_moodle_competencyusercompcomment_permitted','permitted'),(388,'message_popup','version','2016120500'),(390,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(391,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(392,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(393,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(394,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(395,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(396,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(397,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(398,'message','popup_provider_mod_feedback_message_permitted','permitted'),(399,'message','popup_provider_mod_forum_posts_permitted','permitted'),(400,'message','popup_provider_mod_forum_digests_permitted','permitted'),(401,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(402,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(403,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(404,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(405,'message','popup_provider_moodle_notices_permitted','permitted'),(406,'message','popup_provider_moodle_errors_permitted','permitted'),(407,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(408,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(409,'message','message_provider_moodle_instantmessage_loggedin','popup'),(410,'message','popup_provider_moodle_backup_permitted','permitted'),(411,'message','popup_provider_moodle_courserequested_permitted','permitted'),(412,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(413,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(414,'message','popup_provider_moodle_badgerecipientnotice_permitted','permitted'),(415,'message','message_provider_moodle_badgerecipientnotice_loggedin','popup'),(416,'message','popup_provider_moodle_badgecreatornotice_permitted','permitted'),(417,'message','popup_provider_moodle_competencyplancomment_permitted','permitted'),(418,'message','popup_provider_moodle_competencyusercompcomment_permitted','permitted'),(419,'block_activity_modules','version','2016120500'),(420,'block_activity_results','version','2016120500'),(421,'block_admin_bookmarks','version','2016120500'),(422,'block_badges','version','2016120500'),(423,'block_blog_menu','version','2016120500'),(424,'block_blog_recent','version','2016120500'),(425,'block_blog_tags','version','2016120500'),(426,'block_calendar_month','version','2016120500'),(427,'block_calendar_upcoming','version','2016120500'),(428,'block_comments','version','2016120500'),(429,'block_community','version','2016120500'),(430,'block_completionstatus','version','2016120500'),(431,'block_course_list','version','2016120500'),(432,'block_course_overview','version','2016120500'),(433,'block_course_summary','version','2016120500'),(434,'block_feedback','version','2016120500'),(436,'block_globalsearch','version','2016120500'),(437,'block_glossary_random','version','2016120500'),(438,'block_html','version','2016120500'),(439,'block_login','version','2016120500'),(440,'block_lp','version','2016120500'),(441,'block_mentees','version','2016120500'),(442,'block_messages','version','2016120500'),(443,'block_mnet_hosts','version','2016120500'),(444,'block_myprofile','version','2016120500'),(445,'block_navigation','version','2016120500'),(446,'block_news_items','version','2016120500'),(447,'block_online_users','version','2016120500'),(448,'block_participants','version','2016120500'),(449,'block_private_files','version','2016120500'),(450,'block_quiz_results','version','2016120500'),(452,'block_recent_activity','version','2016120500'),(453,'block_rss_client','version','2016120500'),(454,'block_search_forums','version','2016120500'),(455,'block_section_links','version','2016120500'),(456,'block_selfcompletion','version','2016120500'),(457,'block_settings','version','2016120500'),(458,'block_site_main_menu','version','2016120500'),(459,'block_social_activities','version','2016120500'),(460,'block_tag_flickr','version','2016120500'),(461,'block_tag_youtube','version','2016120500'),(463,'block_tags','version','2016120500'),(464,'media_html5audio','version','2016120500'),(465,'media_html5video','version','2016120500'),(466,'media_swf','version','2016120500'),(467,'media_videojs','version','2016120500'),(468,'media_vimeo','version','2016120500'),(469,'media_youtube','version','2016120500'),(470,'filter_activitynames','version','2016120500'),(472,'filter_algebra','version','2016120500'),(473,'filter_censor','version','2016120500'),(474,'filter_data','version','2016120500'),(476,'filter_emailprotect','version','2016120500'),(477,'filter_emoticon','version','2016120500'),(478,'filter_glossary','version','2016120500'),(480,'filter_mathjaxloader','version','2016120500'),(482,'filter_mediaplugin','version','2016120500'),(484,'filter_multilang','version','2016120500'),(485,'filter_tex','version','2016120500'),(487,'filter_tidy','version','2016120500'),(488,'filter_urltolink','version','2016120500'),(489,'editor_atto','version','2016120500'),(491,'editor_textarea','version','2016120500'),(492,'editor_tinymce','version','2016120500'),(493,'format_singleactivity','version','2016120500'),(494,'format_social','version','2016120500'),(495,'format_topics','version','2016120500'),(496,'format_weeks','version','2016120500'),(497,'dataformat_csv','version','2016120500'),(498,'dataformat_excel','version','2016120500'),(499,'dataformat_html','version','2016120500'),(500,'dataformat_json','version','2016120500'),(501,'dataformat_ods','version','2016120500'),(502,'profilefield_checkbox','version','2016120500'),(503,'profilefield_datetime','version','2016120500'),(504,'profilefield_menu','version','2016120500'),(505,'profilefield_text','version','2016120500'),(506,'profilefield_textarea','version','2016120500'),(507,'report_backups','version','2016120500'),(508,'report_competency','version','2016120500'),(509,'report_completion','version','2016120500'),(511,'report_configlog','version','2016120500'),(512,'report_courseoverview','version','2016120500'),(513,'report_eventlist','version','2016120500'),(514,'report_log','version','2016120500'),(516,'report_loglive','version','2016120500'),(517,'report_outline','version','2016120500'),(519,'report_participation','version','2016120500'),(521,'report_performance','version','2016120500'),(522,'report_progress','version','2016120500'),(524,'report_questioninstances','version','2016120500'),(525,'report_security','version','2016120500'),(526,'report_stats','version','2016120500'),(528,'report_usersessions','version','2016120500'),(529,'gradeexport_ods','version','2016120500'),(530,'gradeexport_txt','version','2016120500'),(531,'gradeexport_xls','version','2016120500'),(532,'gradeexport_xml','version','2016120500'),(533,'gradeimport_csv','version','2016120500'),(534,'gradeimport_direct','version','2016120500'),(535,'gradeimport_xml','version','2016120500'),(536,'gradereport_grader','version','2016120500'),(537,'gradereport_history','version','2016120500'),(538,'gradereport_outcomes','version','2016120500'),(539,'gradereport_overview','version','2016120500'),(540,'gradereport_singleview','version','2016120500'),(541,'gradereport_user','version','2016120500'),(542,'gradingform_guide','version','2016120500'),(543,'gradingform_rubric','version','2016120500'),(544,'mnetservice_enrol','version','2016120500'),(545,'webservice_rest','version','2016120500'),(546,'webservice_soap','version','2016120500'),(547,'webservice_xmlrpc','version','2016120500'),(548,'repository_areafiles','version','2016120500'),(550,'areafiles','enablecourseinstances','0'),(551,'areafiles','enableuserinstances','0'),(552,'repository_boxnet','version','2016120500'),(553,'repository_coursefiles','version','2016120500'),(554,'repository_dropbox','version','2016120500'),(555,'repository_equella','version','2016120500'),(556,'repository_filesystem','version','2016120500'),(557,'repository_flickr','version','2016120500'),(558,'repository_flickr_public','version','2016120500'),(559,'repository_googledocs','version','2016120500'),(560,'repository_local','version','2016120500'),(562,'local','enablecourseinstances','0'),(563,'local','enableuserinstances','0'),(564,'repository_merlot','version','2016120500'),(565,'repository_picasa','version','2016120500'),(566,'repository_recent','version','2016120500'),(568,'recent','enablecourseinstances','0'),(569,'recent','enableuserinstances','0'),(570,'repository_s3','version','2016120500'),(571,'repository_skydrive','version','2016120500'),(572,'repository_upload','version','2016120500'),(574,'upload','enablecourseinstances','0'),(575,'upload','enableuserinstances','0'),(576,'repository_url','version','2016120500'),(578,'url','enablecourseinstances','0'),(579,'url','enableuserinstances','0'),(580,'repository_user','version','2016120500'),(582,'user','enablecourseinstances','0'),(583,'user','enableuserinstances','0'),(584,'repository_webdav','version','2016120500'),(585,'repository_wikimedia','version','2016120500'),(587,'wikimedia','enablecourseinstances','0'),(588,'wikimedia','enableuserinstances','0'),(589,'repository_youtube','version','2016120500'),(591,'portfolio_boxnet','version','2016120500'),(592,'portfolio_download','version','2016120500'),(593,'portfolio_flickr','version','2016120500'),(594,'portfolio_googledocs','version','2016120500'),(595,'portfolio_mahara','version','2016120500'),(596,'portfolio_picasa','version','2016120500'),(597,'search_solr','version','2016120500'),(598,'qbehaviour_adaptive','version','2016120500'),(599,'qbehaviour_adaptivenopenalty','version','2016120500'),(600,'qbehaviour_deferredcbm','version','2016120500'),(601,'qbehaviour_deferredfeedback','version','2016120500'),(602,'qbehaviour_immediatecbm','version','2016120500'),(603,'qbehaviour_immediatefeedback','version','2016120500'),(604,'qbehaviour_informationitem','version','2016120500'),(605,'qbehaviour_interactive','version','2016120500'),(606,'qbehaviour_interactivecountback','version','2016120500'),(607,'qbehaviour_manualgraded','version','2016120500'),(609,'question','disabledbehaviours','manualgraded'),(610,'qbehaviour_missing','version','2016120500'),(611,'qformat_aiken','version','2016120500'),(612,'qformat_blackboard_six','version','2016120500'),(613,'qformat_examview','version','2016120500'),(614,'qformat_gift','version','2016120500'),(615,'qformat_missingword','version','2016120500'),(616,'qformat_multianswer','version','2016120500'),(617,'qformat_webct','version','2016120500'),(618,'qformat_xhtml','version','2016120500'),(619,'qformat_xml','version','2016120500'),(620,'tool_assignmentupgrade','version','2016120500'),(621,'tool_availabilityconditions','version','2016120500'),(622,'tool_behat','version','2016120500'),(623,'tool_capability','version','2016120500'),(624,'tool_cohortroles','version','2016120500'),(625,'tool_customlang','version','2016120500'),(627,'tool_dbtransfer','version','2016120500'),(628,'tool_filetypes','version','2016120500'),(629,'tool_generator','version','2016120500'),(630,'tool_health','version','2016120500'),(631,'tool_innodb','version','2016120500'),(632,'tool_installaddon','version','2016120500'),(633,'tool_langimport','version','2016120500'),(634,'tool_log','version','2016120500'),(636,'tool_log','enabled_stores','logstore_standard'),(637,'tool_lp','version','2016120500'),(638,'tool_lpimportcsv','version','2016120500'),(639,'tool_lpmigrate','version','2016120500'),(640,'tool_messageinbound','version','2016120500'),(641,'message','airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(642,'message','email_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(643,'message','jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(644,'message','popup_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(645,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedin','email'),(646,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff','email'),(647,'message','airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(648,'message','email_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(649,'message','jabber_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(650,'message','popup_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(651,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedin','email'),(652,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedoff','email'),(653,'message','airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(654,'message','email_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(655,'message','jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(656,'message','popup_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(657,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedin','email'),(658,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff','email'),(659,'tool_mobile','version','2016120500'),(660,'tool_monitor','version','2016120500'),(661,'message','airnotifier_provider_tool_monitor_notification_permitted','permitted'),(662,'message','email_provider_tool_monitor_notification_permitted','permitted'),(663,'message','jabber_provider_tool_monitor_notification_permitted','permitted'),(664,'message','popup_provider_tool_monitor_notification_permitted','permitted'),(665,'message','message_provider_tool_monitor_notification_loggedin','email'),(666,'message','message_provider_tool_monitor_notification_loggedoff','email'),(667,'tool_multilangupgrade','version','2016120500'),(668,'tool_phpunit','version','2016120500'),(669,'tool_profiling','version','2016120500'),(670,'tool_recyclebin','version','2016120500'),(671,'tool_replace','version','2016120500'),(672,'tool_spamcleaner','version','2016120500'),(673,'tool_task','version','2016120500'),(674,'tool_templatelibrary','version','2016120500'),(675,'tool_unsuproles','version','2016120500'),(677,'tool_uploadcourse','version','2016120500'),(678,'tool_uploaduser','version','2016120500'),(679,'tool_usertours','version','2016120501'),(681,'tool_xmldb','version','2016120500'),(682,'cachestore_apcu','version','2016120500'),(683,'cachestore_file','version','2016120500'),(684,'cachestore_memcache','version','2016120500'),(685,'cachestore_memcached','version','2016120500'),(686,'cachestore_mongodb','version','2016120500'),(687,'cachestore_redis','version','2016120500'),(688,'cachestore_session','version','2016120500'),(689,'cachestore_static','version','2016120500'),(690,'cachelock_file','version','2016120500'),(691,'theme_boost','version','2016120500'),(692,'theme_bootstrapbase','version','2016120500'),(693,'theme_clean','version','2016120500'),(694,'theme_more','version','2016120500'),(696,'assignsubmission_comments','version','2016120500'),(698,'assignsubmission_file','sortorder','1'),(699,'assignsubmission_comments','sortorder','2'),(700,'assignsubmission_onlinetext','sortorder','0'),(701,'assignsubmission_file','version','2016120500'),(702,'assignsubmission_onlinetext','version','2016120500'),(704,'assignfeedback_comments','version','2016120500'),(706,'assignfeedback_comments','sortorder','0'),(707,'assignfeedback_editpdf','sortorder','1'),(708,'assignfeedback_file','sortorder','3'),(709,'assignfeedback_offline','sortorder','2'),(710,'assignfeedback_editpdf','version','2016120500'),(712,'assignfeedback_file','version','2016120500'),(714,'assignfeedback_offline','version','2016120500'),(715,'assignment_offline','version','2016120500'),(716,'assignment_online','version','2016120500'),(717,'assignment_upload','version','2016120500'),(718,'assignment_uploadsingle','version','2016120500'),(719,'booktool_exportimscp','version','2016120500'),(720,'booktool_importhtml','version','2016120500'),(721,'booktool_print','version','2016120500'),(722,'datafield_checkbox','version','2016120500'),(723,'datafield_date','version','2016120500'),(724,'datafield_file','version','2016120500'),(725,'datafield_latlong','version','2016120500'),(726,'datafield_menu','version','2016120500'),(727,'datafield_multimenu','version','2016120500'),(728,'datafield_number','version','2016120500'),(729,'datafield_picture','version','2016120500'),(730,'datafield_radiobutton','version','2016120500'),(731,'datafield_text','version','2016120500'),(732,'datafield_textarea','version','2016120500'),(733,'datafield_url','version','2016120500'),(734,'datapreset_imagegallery','version','2016120500'),(735,'ltiservice_memberships','version','2016120500'),(736,'ltiservice_profile','version','2016120500'),(737,'ltiservice_toolproxy','version','2016120500'),(738,'ltiservice_toolsettings','version','2016120500'),(739,'quiz_grading','version','2016120500'),(741,'quiz_overview','version','2016120500'),(743,'quiz_responses','version','2016120500'),(745,'quiz_statistics','version','2016120500'),(747,'quizaccess_delaybetweenattempts','version','2016120500'),(748,'quizaccess_ipaddress','version','2016120500'),(749,'quizaccess_numattempts','version','2016120500'),(750,'quizaccess_offlineattempts','version','2016120500'),(751,'quizaccess_openclosedate','version','2016120500'),(752,'quizaccess_password','version','2016120500'),(753,'quizaccess_safebrowser','version','2016120500'),(754,'quizaccess_securewindow','version','2016120500'),(755,'quizaccess_timelimit','version','2016120500'),(756,'scormreport_basic','version','2016120500'),(757,'scormreport_graphs','version','2016120500'),(758,'scormreport_interactions','version','2016120500'),(759,'scormreport_objectives','version','2016120500'),(760,'workshopform_accumulative','version','2016120500'),(762,'workshopform_comments','version','2016120500'),(764,'workshopform_numerrors','version','2016120500'),(766,'workshopform_rubric','version','2016120500'),(768,'workshopallocation_manual','version','2016120500'),(769,'workshopallocation_random','version','2016120500'),(770,'workshopallocation_scheduled','version','2016120500'),(771,'workshopeval_best','version','2016120500'),(772,'atto_accessibilitychecker','version','2016120500'),(773,'atto_accessibilityhelper','version','2016120500'),(774,'atto_align','version','2016120500'),(775,'atto_backcolor','version','2016120500'),(776,'atto_bold','version','2016120500'),(777,'atto_charmap','version','2016120500'),(778,'atto_clear','version','2016120500'),(779,'atto_collapse','version','2016120500'),(780,'atto_emoticon','version','2016120500'),(781,'atto_equation','version','2016120500'),(782,'atto_fontcolor','version','2016120500'),(783,'atto_html','version','2016120500'),(784,'atto_image','version','2016120500'),(785,'atto_indent','version','2016120500'),(786,'atto_italic','version','2016120500'),(787,'atto_link','version','2016120500'),(788,'atto_managefiles','version','2016120500'),(789,'atto_media','version','2016120500'),(790,'atto_noautolink','version','2016120500'),(791,'atto_orderedlist','version','2016120500'),(792,'atto_rtl','version','2016120500'),(793,'atto_strike','version','2016120500'),(794,'atto_subscript','version','2016120500'),(795,'atto_superscript','version','2016120500'),(796,'atto_table','version','2016120500'),(797,'atto_title','version','2016120500'),(798,'atto_underline','version','2016120500'),(799,'atto_undo','version','2016120500'),(800,'atto_unorderedlist','version','2016120500'),(801,'tinymce_ctrlhelp','version','2016120500'),(802,'tinymce_managefiles','version','2016120500'),(803,'tinymce_moodleemoticon','version','2016120500'),(804,'tinymce_moodleimage','version','2016120500'),(805,'tinymce_moodlemedia','version','2016120500'),(806,'tinymce_moodlenolink','version','2016120500'),(807,'tinymce_pdw','version','2016120500'),(808,'tinymce_spellchecker','version','2016120500'),(810,'tinymce_wrap','version','2016120500'),(811,'logstore_database','version','2016120500'),(812,'logstore_legacy','version','2016120500'),(813,'logstore_standard','version','2016120500'),(814,'resource','framesize','130'),(815,'resource','displayoptions','0,1,4,5,6'),(816,'resource','printintro','1'),(817,'resource','display','0'),(818,'resource','showsize','0'),(819,'resource','showtype','0'),(820,'resource','showdate','0'),(821,'resource','popupwidth','620'),(822,'resource','popupheight','450'),(823,'resource','filterfiles','0'),(824,'imscp','keepold','1'),(825,'imscp','keepold_adv',''),(826,'workshop','grade','80'),(827,'workshop','gradinggrade','20'),(828,'workshop','gradedecimals','0'),(829,'workshop','maxbytes','0'),(830,'workshop','strategy','accumulative'),(831,'workshop','examplesmode','0'),(832,'workshopallocation_random','numofreviews','5'),(833,'workshopform_numerrors','grade0','Não'),(834,'workshopform_numerrors','grade1','Sim'),(835,'workshopeval_best','comparison','5'),(836,'mod_lesson','mediafile',''),(837,'mod_lesson','mediafile_adv','1'),(838,'mod_lesson','mediawidth','640'),(839,'mod_lesson','mediaheight','480'),(840,'mod_lesson','mediaclose','0'),(841,'mod_lesson','progressbar','0'),(842,'mod_lesson','progressbar_adv',''),(843,'mod_lesson','ongoing','0'),(844,'mod_lesson','ongoing_adv','1'),(845,'mod_lesson','displayleftmenu','0'),(846,'mod_lesson','displayleftmenu_adv',''),(847,'mod_lesson','displayleftif','0'),(848,'mod_lesson','displayleftif_adv','1'),(849,'mod_lesson','slideshow','0'),(850,'mod_lesson','slideshow_adv','1'),(851,'mod_lesson','slideshowwidth','640'),(852,'mod_lesson','slideshowheight','480'),(853,'mod_lesson','slideshowbgcolor','#FFFFFF'),(854,'mod_lesson','maxanswers','5'),(855,'mod_lesson','maxanswers_adv','1'),(856,'mod_lesson','defaultfeedback','0'),(857,'mod_lesson','defaultfeedback_adv','1'),(858,'mod_lesson','activitylink',''),(859,'mod_lesson','activitylink_adv','1'),(860,'mod_lesson','timelimit','0'),(861,'mod_lesson','timelimit_adv',''),(862,'mod_lesson','password','0'),(863,'mod_lesson','password_adv','1'),(864,'mod_lesson','modattempts','0'),(865,'mod_lesson','modattempts_adv',''),(866,'mod_lesson','displayreview','0'),(867,'mod_lesson','displayreview_adv',''),(868,'mod_lesson','maximumnumberofattempts','1'),(869,'mod_lesson','maximumnumberofattempts_adv',''),(870,'mod_lesson','defaultnextpage','0'),(871,'mod_lesson','defaultnextpage_adv','1'),(872,'mod_lesson','numberofpagestoshow','1'),(873,'mod_lesson','numberofpagestoshow_adv','1'),(874,'mod_lesson','practice','0'),(875,'mod_lesson','practice_adv',''),(876,'mod_lesson','customscoring','1'),(877,'mod_lesson','customscoring_adv','1'),(878,'mod_lesson','retakesallowed','0'),(879,'mod_lesson','retakesallowed_adv',''),(880,'mod_lesson','handlingofretakes','0'),(881,'mod_lesson','handlingofretakes_adv','1'),(882,'mod_lesson','minimumnumberofquestions','0'),(883,'mod_lesson','minimumnumberofquestions_adv','1'),(884,'book','numberingoptions','0,1,2,3'),(885,'book','navoptions','0,1,2'),(886,'book','numbering','1'),(887,'book','navstyle','1'),(888,'scorm','displaycoursestructure','0'),(889,'scorm','displaycoursestructure_adv',''),(890,'scorm','popup','0'),(891,'scorm','popup_adv',''),(892,'scorm','displayactivityname','1'),(893,'scorm','framewidth','100'),(894,'scorm','framewidth_adv','1'),(895,'scorm','frameheight','500'),(896,'scorm','frameheight_adv','1'),(897,'scorm','winoptgrp_adv','1'),(898,'scorm','scrollbars','0'),(899,'scorm','directories','0'),(900,'scorm','location','0'),(901,'scorm','menubar','0'),(902,'scorm','toolbar','0'),(903,'scorm','status','0'),(904,'scorm','skipview','0'),(905,'scorm','skipview_adv','1'),(906,'scorm','hidebrowse','0'),(907,'scorm','hidebrowse_adv','1'),(908,'scorm','hidetoc','0'),(909,'scorm','hidetoc_adv','1'),(910,'scorm','nav','1'),(911,'scorm','nav_adv','1'),(912,'scorm','navpositionleft','-100'),(913,'scorm','navpositionleft_adv','1'),(914,'scorm','navpositiontop','-100'),(915,'scorm','navpositiontop_adv','1'),(916,'scorm','collapsetocwinsize','767'),(917,'scorm','collapsetocwinsize_adv','1'),(918,'scorm','displayattemptstatus','1'),(919,'scorm','displayattemptstatus_adv',''),(920,'scorm','grademethod','1'),(921,'scorm','maxgrade','100'),(922,'scorm','maxattempt','0'),(923,'scorm','whatgrade','0'),(924,'scorm','forcecompleted','0'),(925,'scorm','forcenewattempt','0'),(926,'scorm','autocommit','0'),(927,'scorm','masteryoverride','1'),(928,'scorm','lastattemptlock','0'),(929,'scorm','auto','0'),(930,'scorm','updatefreq','0'),(931,'scorm','scorm12standard','1'),(932,'scorm','allowtypeexternal','0'),(933,'scorm','allowtypelocalsync','0'),(934,'scorm','allowtypeexternalaicc','0'),(935,'scorm','allowaicchacp','0'),(936,'scorm','aicchacptimeout','30'),(937,'scorm','aicchacpkeepsessiondata','1'),(938,'scorm','aiccuserid','1'),(939,'scorm','forcejavascript','1'),(940,'scorm','allowapidebug','0'),(941,'scorm','apidebugmask','.*'),(942,'scorm','protectpackagedownloads','0'),(943,'page','displayoptions','5'),(944,'page','printheading','1'),(945,'page','printintro','0'),(946,'page','display','5'),(947,'page','popupwidth','620'),(948,'page','popupheight','450'),(949,'folder','showexpanded','1'),(950,'folder','maxsizetodownload','0'),(951,'quiz','timelimit','0'),(952,'quiz','timelimit_adv',''),(953,'quiz','overduehandling','autosubmit'),(954,'quiz','overduehandling_adv',''),(955,'quiz','graceperiod','86400'),(956,'quiz','graceperiod_adv',''),(957,'quiz','graceperiodmin','60'),(958,'quiz','attempts','0'),(959,'quiz','attempts_adv',''),(960,'quiz','grademethod','1'),(961,'quiz','grademethod_adv',''),(962,'quiz','maximumgrade','10'),(963,'quiz','questionsperpage','1'),(964,'quiz','questionsperpage_adv',''),(965,'quiz','navmethod','free'),(966,'quiz','navmethod_adv','1'),(967,'quiz','shuffleanswers','1'),(968,'quiz','shuffleanswers_adv',''),(969,'quiz','preferredbehaviour','deferredfeedback'),(970,'quiz','canredoquestions','0'),(971,'quiz','canredoquestions_adv','1'),(972,'quiz','attemptonlast','0'),(973,'quiz','attemptonlast_adv','1'),(974,'quiz','reviewattempt','69904'),(975,'quiz','reviewcorrectness','69904'),(976,'quiz','reviewmarks','69904'),(977,'quiz','reviewspecificfeedback','69904'),(978,'quiz','reviewgeneralfeedback','69904'),(979,'quiz','reviewrightanswer','69904'),(980,'quiz','reviewoverallfeedback','4368'),(981,'quiz','showuserpicture','0'),(982,'quiz','showuserpicture_adv',''),(983,'quiz','decimalpoints','2'),(984,'quiz','decimalpoints_adv',''),(985,'quiz','questiondecimalpoints','-1'),(986,'quiz','questiondecimalpoints_adv','1'),(987,'quiz','showblocks','0'),(988,'quiz','showblocks_adv','1'),(989,'quiz','password',''),(990,'quiz','password_adv',''),(991,'quiz','subnet',''),(992,'quiz','subnet_adv','1'),(993,'quiz','delay1','0'),(994,'quiz','delay1_adv','1'),(995,'quiz','delay2','0'),(996,'quiz','delay2_adv','1'),(997,'quiz','browsersecurity','-'),(998,'quiz','browsersecurity_adv','1'),(999,'quiz','initialnumfeedbacks','2'),(1000,'quiz','autosaveperiod','60'),(1001,'label','dndmedia','1'),(1002,'label','dndresizewidth','400'),(1003,'label','dndresizeheight','400'),(1004,'assign','feedback_plugin_for_gradebook','assignfeedback_comments'),(1005,'assign','showrecentsubmissions','0'),(1006,'assign','submissionreceipts','1'),(1007,'assign','submissionstatement','Esta tarefa é meu próprio trabalho, exceto onde eu reconheço o uso do trabalho de outras pessoas.'),(1008,'assign','maxperpage','-1'),(1009,'assign','alwaysshowdescription','1'),(1010,'assign','alwaysshowdescription_adv',''),(1011,'assign','alwaysshowdescription_locked',''),(1012,'assign','allowsubmissionsfromdate','0'),(1013,'assign','allowsubmissionsfromdate_enabled','1'),(1014,'assign','allowsubmissionsfromdate_adv',''),(1015,'assign','duedate','604800'),(1016,'assign','duedate_enabled','1'),(1017,'assign','duedate_adv',''),(1018,'assign','cutoffdate','1209600'),(1019,'assign','cutoffdate_enabled',''),(1020,'assign','cutoffdate_adv',''),(1021,'assign','submissiondrafts','0'),(1022,'assign','submissiondrafts_adv',''),(1023,'assign','submissiondrafts_locked',''),(1024,'assign','requiresubmissionstatement','0'),(1025,'assign','requiresubmissionstatement_adv',''),(1026,'assign','requiresubmissionstatement_locked',''),(1027,'assign','attemptreopenmethod','none'),(1028,'assign','attemptreopenmethod_adv',''),(1029,'assign','attemptreopenmethod_locked',''),(1030,'assign','maxattempts','-1'),(1031,'assign','maxattempts_adv',''),(1032,'assign','maxattempts_locked',''),(1033,'assign','teamsubmission','0'),(1034,'assign','teamsubmission_adv',''),(1035,'assign','teamsubmission_locked',''),(1036,'assign','preventsubmissionnotingroup','0'),(1037,'assign','preventsubmissionnotingroup_adv',''),(1038,'assign','preventsubmissionnotingroup_locked',''),(1039,'assign','requireallteammemberssubmit','0'),(1040,'assign','requireallteammemberssubmit_adv',''),(1041,'assign','requireallteammemberssubmit_locked',''),(1042,'assign','teamsubmissiongroupingid',''),(1043,'assign','teamsubmissiongroupingid_adv',''),(1044,'assign','sendnotifications','0'),(1045,'assign','sendnotifications_adv',''),(1046,'assign','sendnotifications_locked',''),(1047,'assign','sendlatenotifications','0'),(1048,'assign','sendlatenotifications_adv',''),(1049,'assign','sendlatenotifications_locked',''),(1050,'assign','sendstudentnotifications','1'),(1051,'assign','sendstudentnotifications_adv',''),(1052,'assign','sendstudentnotifications_locked',''),(1053,'assign','blindmarking','0'),(1054,'assign','blindmarking_adv',''),(1055,'assign','blindmarking_locked',''),(1056,'assign','markingworkflow','0'),(1057,'assign','markingworkflow_adv',''),(1058,'assign','markingworkflow_locked',''),(1059,'assign','markingallocation','0'),(1060,'assign','markingallocation_adv',''),(1061,'assign','markingallocation_locked',''),(1062,'assignsubmission_file','default','1'),(1063,'assignsubmission_file','maxfiles','20'),(1064,'assignsubmission_file','maxbytes','0'),(1065,'assignsubmission_onlinetext','default','0'),(1066,'assignfeedback_comments','default','1'),(1067,'assignfeedback_comments','inline','0'),(1068,'assignfeedback_comments','inline_adv',''),(1069,'assignfeedback_comments','inline_locked',''),(1070,'assignfeedback_editpdf','stamps',''),(1071,'assignfeedback_file','default','0'),(1072,'assignfeedback_offline','default','0'),(1073,'url','framesize','130'),(1074,'url','secretphrase',''),(1075,'url','rolesinparams','0'),(1076,'url','displayoptions','0,1,5,6'),(1077,'url','printintro','1'),(1078,'url','display','0'),(1079,'url','popupwidth','620'),(1080,'url','popupheight','450'),(1081,'block_section_links','numsections1','22'),(1082,'block_section_links','incby1','2'),(1083,'block_section_links','numsections2','40'),(1084,'block_section_links','incby2','5'),(1085,'block_activity_results','config_showbest','3'),(1086,'block_activity_results','config_showbest_locked',''),(1087,'block_activity_results','config_showworst','0'),(1088,'block_activity_results','config_showworst_locked',''),(1089,'block_activity_results','config_usegroups','0'),(1090,'block_activity_results','config_usegroups_locked',''),(1091,'block_activity_results','config_nameformat','1'),(1092,'block_activity_results','config_nameformat_locked',''),(1093,'block_activity_results','config_gradeformat','1'),(1094,'block_activity_results','config_gradeformat_locked',''),(1095,'block_activity_results','config_decimalpoints','2'),(1096,'block_activity_results','config_decimalpoints_locked',''),(1097,'block_course_overview','defaultmaxcourses','10'),(1098,'block_course_overview','forcedefaultmaxcourses','0'),(1099,'block_course_overview','showchildren','0'),(1100,'block_course_overview','showwelcomearea','0'),(1101,'block_course_overview','showcategories','0'),(1102,'block_tag_youtube','apikey',''),(1103,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),(1104,'editor_atto','autosavefrequency','60'),(1105,'atto_collapse','showgroups','5'),(1106,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),(1107,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),(1108,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),(1109,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),(1110,'atto_table','allowborders','0'),(1111,'atto_table','allowbackgroundcolour','0'),(1112,'atto_table','allowwidth','0'),(1113,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),(1114,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(1115,'editor_tinymce','customconfig',''),(1116,'tinymce_moodleemoticon','requireemoticon','1'),(1117,'tinymce_spellchecker','spellengine',''),(1118,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(1119,'tool_recyclebin','coursebinenable','1'),(1120,'tool_recyclebin','coursebinexpiry','604800'),(1121,'tool_recyclebin','categorybinenable','1'),(1122,'tool_recyclebin','categorybinexpiry','604800'),(1123,'tool_recyclebin','autohide','1'),(1124,'filter_urltolink','formats','0'),(1125,'filter_urltolink','embedimages','1'),(1126,'filter_emoticon','formats','1,4,0'),(1127,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.7-latest/MathJax.js'),(1128,'filter_mathjaxloader','texfiltercompatibility','0'),(1129,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n'),(1130,'filter_mathjaxloader','additionaldelimiters',''),(1131,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(1132,'filter_tex','latexbackground','#FFFFFF'),(1133,'filter_tex','density','120'),(1134,'filter_tex','pathlatex','/usr/bin/latex'),(1135,'filter_tex','pathdvips','/usr/bin/dvips'),(1136,'filter_tex','pathconvert','/usr/bin/convert'),(1137,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm'),(1138,'filter_tex','pathmimetex',''),(1139,'filter_tex','convertformat','gif'),(1140,'format_singleactivity','activitytype','forum'),(1141,'enrol_guest','requirepassword','0'),(1142,'enrol_guest','usepasswordpolicy','0'),(1143,'enrol_guest','showhint','0'),(1144,'enrol_guest','defaultenrol','1'),(1145,'enrol_guest','status','1'),(1146,'enrol_guest','status_adv',''),(1147,'enrol_imsenterprise','imsfilelocation',''),(1148,'enrol_imsenterprise','logtolocation',''),(1149,'enrol_imsenterprise','mailadmins','0'),(1150,'enrol_imsenterprise','createnewusers','0'),(1151,'enrol_imsenterprise','imsupdateusers','0'),(1152,'enrol_imsenterprise','imsdeleteusers','0'),(1153,'enrol_imsenterprise','fixcaseusernames','0'),(1154,'enrol_imsenterprise','fixcasepersonalnames','0'),(1155,'enrol_imsenterprise','imssourcedidfallback','0'),(1156,'enrol_imsenterprise','imsrolemap01','5'),(1157,'enrol_imsenterprise','imsrolemap02','3'),(1158,'enrol_imsenterprise','imsrolemap03','3'),(1159,'enrol_imsenterprise','imsrolemap04','5'),(1160,'enrol_imsenterprise','imsrolemap05','0'),(1161,'enrol_imsenterprise','imsrolemap06','4'),(1162,'enrol_imsenterprise','imsrolemap07','0'),(1163,'enrol_imsenterprise','imsrolemap08','4'),(1164,'enrol_imsenterprise','truncatecoursecodes','0'),(1165,'enrol_imsenterprise','createnewcourses','0'),(1166,'enrol_imsenterprise','updatecourses','0'),(1167,'enrol_imsenterprise','createnewcategories','0'),(1168,'enrol_imsenterprise','nestedcategories','0'),(1169,'enrol_imsenterprise','categoryidnumber','0'),(1170,'enrol_imsenterprise','categoryseparator',''),(1171,'enrol_imsenterprise','imsunenrol','0'),(1172,'enrol_imsenterprise','imscoursemapshortname','coursecode'),(1173,'enrol_imsenterprise','imscoursemapfullname','short'),(1174,'enrol_imsenterprise','imscoursemapsummary','ignore'),(1175,'enrol_imsenterprise','imsrestricttarget',''),(1176,'enrol_imsenterprise','imscapitafix','0'),(1177,'enrol_flatfile','location',''),(1178,'enrol_flatfile','encoding','UTF-8'),(1179,'enrol_flatfile','mailstudents','0'),(1180,'enrol_flatfile','mailteachers','0'),(1181,'enrol_flatfile','mailadmins','0'),(1182,'enrol_flatfile','unenrolaction','3'),(1183,'enrol_flatfile','expiredaction','3'),(1184,'enrol_self','requirepassword','0'),(1185,'enrol_self','usepasswordpolicy','0'),(1186,'enrol_self','showhint','0'),(1187,'enrol_self','expiredaction','1'),(1188,'enrol_self','expirynotifyhour','6'),(1189,'enrol_self','defaultenrol','1'),(1190,'enrol_self','status','1'),(1191,'enrol_self','newenrols','1'),(1192,'enrol_self','groupkey','0'),(1193,'enrol_self','roleid','5'),(1194,'enrol_self','enrolperiod','0'),(1195,'enrol_self','expirynotify','0'),(1196,'enrol_self','expirythreshold','86400'),(1197,'enrol_self','longtimenosee','0'),(1198,'enrol_self','maxenrolled','0'),(1199,'enrol_self','sendcoursewelcomemessage','1'),(1200,'enrol_database','dbtype',''),(1201,'enrol_database','dbhost','localhost'),(1202,'enrol_database','dbuser',''),(1203,'enrol_database','dbpass',''),(1204,'enrol_database','dbname',''),(1205,'enrol_database','dbencoding','utf-8'),(1206,'enrol_database','dbsetupsql',''),(1207,'enrol_database','dbsybasequoting','0'),(1208,'enrol_database','debugdb','0'),(1209,'enrol_database','localcoursefield','idnumber'),(1210,'enrol_database','localuserfield','idnumber'),(1211,'enrol_database','localrolefield','shortname'),(1212,'enrol_database','localcategoryfield','id'),(1213,'enrol_database','remoteenroltable',''),(1214,'enrol_database','remotecoursefield',''),(1215,'enrol_database','remoteuserfield',''),(1216,'enrol_database','remoterolefield',''),(1217,'enrol_database','remoteotheruserfield',''),(1218,'enrol_database','defaultrole','5'),(1219,'enrol_database','ignorehiddencourses','0'),(1220,'enrol_database','unenrolaction','0'),(1221,'enrol_database','newcoursetable',''),(1222,'enrol_database','newcoursefullname','fullname'),(1223,'enrol_database','newcourseshortname','shortname'),(1224,'enrol_database','newcourseidnumber','idnumber'),(1225,'enrol_database','newcoursecategory',''),(1226,'enrol_database','defaultcategory','1'),(1227,'enrol_database','templatecourse',''),(1228,'enrol_meta','nosyncroleids',''),(1229,'enrol_meta','syncall','1'),(1230,'enrol_meta','unenrolaction','3'),(1231,'enrol_meta','coursesort','sortorder'),(1232,'enrol_manual','expiredaction','1'),(1233,'enrol_manual','expirynotifyhour','6'),(1234,'enrol_manual','defaultenrol','1'),(1235,'enrol_manual','status','0'),(1236,'enrol_manual','roleid','5'),(1237,'enrol_manual','enrolstart','4'),(1238,'enrol_manual','enrolperiod','0'),(1239,'enrol_manual','expirynotify','0'),(1240,'enrol_manual','expirythreshold','86400'),(1241,'enrol_mnet','roleid','5'),(1242,'enrol_mnet','roleid_adv','1'),(1243,'enrol_paypal','paypalbusiness',''),(1244,'enrol_paypal','mailstudents','0'),(1245,'enrol_paypal','mailteachers','0'),(1246,'enrol_paypal','mailadmins','0'),(1247,'enrol_paypal','expiredaction','3'),(1248,'enrol_paypal','status','1'),(1249,'enrol_paypal','cost','0'),(1250,'enrol_paypal','currency','USD'),(1251,'enrol_paypal','roleid','5'),(1252,'enrol_paypal','enrolperiod','0'),(1253,'enrol_lti','emaildisplay','2'),(1254,'enrol_lti','city',''),(1255,'enrol_lti','country',''),(1256,'enrol_lti','timezone','99'),(1257,'enrol_lti','lang','pt_br'),(1258,'enrol_lti','institution',''),(1259,'enrol_cohort','roleid','5'),(1260,'enrol_cohort','unenrolaction','0'),(1261,'logstore_database','dbdriver',''),(1262,'logstore_database','dbhost',''),(1263,'logstore_database','dbuser',''),(1264,'logstore_database','dbpass',''),(1265,'logstore_database','dbname',''),(1266,'logstore_database','dbtable',''),(1267,'logstore_database','dbpersist','0'),(1268,'logstore_database','dbsocket',''),(1269,'logstore_database','dbport',''),(1270,'logstore_database','dbschema',''),(1271,'logstore_database','dbcollation',''),(1272,'logstore_database','buffersize','50'),(1273,'logstore_database','logguests','0'),(1274,'logstore_database','includelevels','1,2,0'),(1275,'logstore_database','includeactions','c,r,u,d'),(1276,'logstore_legacy','loglegacy','0'),(1277,'logstore_standard','logguests','1'),(1278,'logstore_standard','loglifetime','0'),(1279,'logstore_standard','buffersize','50'),(1280,'media_videojs','videoextensions','.mov, .mp4, .m4v, .ogv, .webm, .flv, .f4v'),(1281,'media_videojs','audioextensions','.aac, .flac, .mp3, .m4a, .oga, .ogg, .wav'),(1282,'media_videojs','useflash','0'),(1283,'media_videojs','youtube','1'),(1284,'media_videojs','videocssclass','video-js'),(1285,'media_videojs','audiocssclass','video-js'),(1286,'media_videojs','limitsize','1'),(1287,'antivirus_clamav','runningmethod','commandline'),(1288,'antivirus_clamav','pathtoclam',''),(1289,'antivirus_clamav','pathtounixsocket',''),(1290,'antivirus_clamav','clamfailureonupload','donothing'),(1291,'core_plugin','recentfetch','1485998224'),(1292,'core_plugin','recentresponse','{\"status\":\"OK\",\"provider\":\"https:\\/\\/download.moodle.org\\/api\\/1.3\\/updates.php\",\"apiver\":\"1.3\",\"timegenerated\":1485998255,\"ticket\":\"JUM5JTkxNiVBRCUzRiVENS16JUIwJTkyJThCJURCJUI0Z0ElRTFNJTlCJUM4JUZCX2YlQzElN0YlMkElQkMlRkVMZyVGQXRUJUQ3RiUxQiU4NSU3QiU4QyU4OUw=\",\"forbranch\":\"3.2\",\"forversion\":\"2016120501\",\"updates\":{\"core\":[{\"version\":2016120501.02,\"release\":\"3.2.1+ (Build: 20170119)\",\"branch\":\"3.2\",\"maturity\":200,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable32\\/moodle-latest-32.zip\"},{\"version\":2017011900,\"release\":\"3.3dev (Build: 20170119)\",\"branch\":\"3.3\",\"maturity\":50,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/moodle\\/moodle-latest.zip\"}]}}'),(1293,'enrol_ldap','objectclass','(objectClass=*)');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/6',2),(7,80,2,'/1/7',2),(8,80,3,'/1/8',2),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(13,80,8,'/1/13',2),(14,80,9,'/1/5/14',3),(15,80,10,'/1/5/15',3),(16,80,11,'/1/5/16',3),(17,80,12,'/1/5/17',3),(18,80,13,'/1/5/18',3),(19,80,14,'/1/5/19',3),(20,80,15,'/1/5/20',3),(21,70,1,'/1/2/21',3),(31,30,5,'/1/31',2),(32,80,23,'/1/31/32',3),(33,80,24,'/1/31/33',3),(34,80,25,'/1/31/34',3),(35,80,26,'/1/31/35',3),(36,80,27,'/1/31/36',3),(37,80,28,'/1/31/37',3),(38,80,29,'/1/31/38',3),(39,30,6,'/1/39',2),(40,80,30,'/1/39/40',3),(41,80,31,'/1/39/41',3),(42,80,32,'/1/39/42',3),(43,80,33,'/1/39/43',3),(44,80,34,'/1/39/44',3),(45,80,35,'/1/39/45',3),(46,80,36,'/1/39/46',3),(47,40,2,'/1/47',2),(48,50,2,'/1/47/48',3),(49,70,2,'/1/47/48/49',4),(50,50,3,'/1/47/50',3),(51,50,4,'/1/3/51',3),(52,70,4,'/1/3/51/52',4);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `enddate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,1,'Instituto Conhecer e Transformar Mestre Guiga','ICTMG','','<p>O INSTITUTO CONHECER E TRANSFORMAR MESTRE GUIGA - ICTMG, constituído em 20/02/2010, é uma associação sem fins lucrativos regida por seu Estatuto Social, pelo Regimento Interno e pela legislação em vigor, com atuação no estado de Minas&nbsp;</p><p>Gerais, Brasil, podendo estender suas atividades ao âmbito nacional e internacional. Tem por finalidade engendrar e estimular meios de desenvolvimento humano, social, cultural, através de atividades calcadas em informações, em produção e difusão de conhecimentos e em conscientização e exercício de direitos e deveres, também favorecendo o acesso e viabilização a eles, de forma afim a planejamentos e&nbsp;</p><p>propostas de políticas públicas, fortalecendo a democracia, a participação e a justiça social na sociedade brasileira, primando pela sustentabilidade e a transversalidade de ações.</p>',0,'site',1,3,0,0,0,0,0,0,1,1,0,0,0,'','','',1484792637,1484874884,0,0,0,1484874884),(2,2,20002,'curso de teste','cdt','cdt01','<p>hDGDGAJGDAdclass=\'list-group-item\',&nbsp;</p>',1,'topics',1,5,1487037600,1518573600,0,0,0,0,1,1,0,0,0,'pt_br','','',1486953621,1486953621,0,0,0,1486953708),(3,2,20001,'curso 01','cst2','cst2','<p>dfvsdfs</p>',1,'topics',1,5,1487037600,1518573600,0,0,0,0,1,1,0,0,0,'','','',1486953950,1486953950,0,0,0,1486953952),(4,1,10001,'curso da miscelanea','cdml','cdm1','<p>sadasdasdasd</p>',1,'topics',1,5,1487037600,1518573600,0,0,0,0,1,1,0,0,0,'','','',1486954002,1486954002,0,0,0,1486954004);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscelânea',NULL,NULL,0,0,10000,1,1,1,1484792637,1,'/1',NULL),(2,'teste','teste01','<p>categoria de teste</p>',1,0,20000,2,1,1,1486953375,1,'/2',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'numsections','1'),(2,2,'topics',0,'numsections','4'),(3,2,'topics',0,'hiddensections','0'),(4,2,'topics',0,'coursedisplay','0'),(5,3,'topics',0,'numsections','4'),(6,3,'topics',0,'hiddensections','0'),(7,3,'topics',0,'coursedisplay','0'),(8,4,'topics',0,'numsections','4'),(9,4,'topics',0,'hiddensections','0'),(10,4,'topics',0,'coursedisplay','0');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext COLLATE utf8_unicode_ci,
  `deletioninprogress` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
INSERT INTO `mdl_course_modules` VALUES (1,1,9,1,1,NULL,1484874538,0,0,1,1,0,0,0,NULL,0,0,0,NULL,0),(2,2,9,2,2,NULL,1486953621,0,0,1,1,0,0,0,NULL,0,0,0,NULL,0),(3,3,9,3,7,NULL,1486953950,0,0,1,1,0,0,0,NULL,0,0,0,NULL,0),(4,4,9,4,8,NULL,1486954002,0,0,1,1,0,0,0,NULL,0,0,0,NULL,0);
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
INSERT INTO `mdl_course_sections` VALUES (1,1,0,NULL,'',1,'1',1,NULL),(2,2,0,NULL,'',1,'2',1,NULL),(3,2,1,NULL,'',1,'',1,NULL),(4,2,2,NULL,'',1,'',1,NULL),(5,2,3,NULL,'',1,'',1,NULL),(6,2,4,NULL,'',1,'',1,NULL),(7,3,0,NULL,'',1,'3',1,NULL),(8,4,0,NULL,'',1,'4',1,NULL);
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `config` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_editor_atto_autosave`
--

DROP TABLE IF EXISTS `mdl_editor_atto_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Draft text that is auto-saved every 5 seconds while an edito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

LOCK TABLES `mdl_editor_atto_autosave` WRITE;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` DISABLE KEYS */;
INSERT INTO `mdl_editor_atto_autosave` VALUES (1,'id_s__summary',1,'66e5704ee120b3a71f814cf52d11452b802f953f',2,'',-1,'yui_3_17_2_1_1484792909582_43',1484792916),(8,'id_description_editor',22,'1323853bd55ab75aac71bbf1d591c49342dd9650',2,'',730935049,'yui_3_17_2_1_1484875659755_117',1484875655),(12,'id_description',2,'eebf76620694b57cc7e76d2bda21e9c627c98626',2,'',512306723,'yui_3_17_2_1_1487542713944_269',1487542699);
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
INSERT INTO `mdl_enrol` VALUES (1,'manual',0,2,0,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953621,1486953621),(2,'guest',1,2,1,NULL,0,0,0,0,0,0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953621,1486953621),(3,'self',1,2,2,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,0,0,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953621,1486953621),(4,'manual',0,3,0,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953950,1486953950),(5,'guest',1,3,1,NULL,0,0,0,0,0,0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953950,1486953950),(6,'self',1,3,2,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,0,0,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486953950,1486953950),(7,'manual',0,4,0,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486954002,1486954002),(8,'guest',1,4,1,NULL,0,0,0,0,0,0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486954002,1486954002),(9,'self',1,4,2,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,0,0,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1486954002,1486954002);
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_consumer`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_consumer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `consumerkey256` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `consumerkey` longtext COLLATE utf8_unicode_ci,
  `secret` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ltiversion` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumerversion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumerguid` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` longtext COLLATE utf8_unicode_ci,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `settings` longtext COLLATE utf8_unicode_ci,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enablefrom` bigint(10) DEFAULT NULL,
  `enableuntil` bigint(10) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2cons_con_uix` (`consumerkey256`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI consumers interacting with moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_consumer`
--

LOCK TABLES `mdl_enrol_lti_lti2_consumer` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_context`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_context` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `consumerid` bigint(11) NOT NULL,
  `lticontextkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2cont_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about a specific LTI contexts from the consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_context`
--

LOCK TABLES `mdl_enrol_lti_lti2_context` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_nonce`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_nonce` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `consumerid` bigint(11) NOT NULL,
  `value` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2nonc_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Nonce used for authentication between moodle and a consumer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_nonce`
--

LOCK TABLES `mdl_enrol_lti_lti2_nonce` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_resource_link`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_resource_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_resource_link` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(11) DEFAULT NULL,
  `consumerid` bigint(11) DEFAULT NULL,
  `ltiresourcelinkkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` longtext COLLATE utf8_unicode_ci,
  `primaryresourcelinkid` bigint(11) DEFAULT NULL,
  `shareapproved` tinyint(1) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2resolink_con_ix` (`contextid`),
  KEY `mdl_enroltilti2resolink_pri_ix` (`primaryresourcelinkid`),
  KEY `mdl_enroltilti2resolink_co2_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link from the consumer to the tool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_resource_link`
--

LOCK TABLES `mdl_enrol_lti_lti2_resource_link` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_resource_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_resource_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_share_key`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_share_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_share_key` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sharekey` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resourcelinkid` bigint(11) NOT NULL,
  `autoapprove` tinyint(1) NOT NULL,
  `expires` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2sharkey_sha_uix` (`sharekey`),
  UNIQUE KEY `mdl_enroltilti2sharkey_res_uix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource link share key';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_share_key`
--

LOCK TABLES `mdl_enrol_lti_lti2_share_key` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_share_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_share_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_tool_proxy`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_tool_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_tool_proxy` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `toolproxykey` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `consumerid` bigint(11) NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2toolprox_to_uix` (`toolproxykey`),
  KEY `mdl_enroltilti2toolprox_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A tool proxy between moodle and a consumer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_tool_proxy`
--

LOCK TABLES `mdl_enrol_lti_lti2_tool_proxy` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_tool_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_tool_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_lti2_user_result`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_user_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_lti2_user_result` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `resourcelinkid` bigint(11) NOT NULL,
  `ltiuserkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ltiresultsourcedid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2userresu_res_ix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Results for each user for each resource link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_lti2_user_result`
--

LOCK TABLES `mdl_enrol_lti_lti2_user_result` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_user_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_lti2_user_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_tool_consumer_map`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_tool_consumer_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_tool_consumer_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolid` bigint(11) NOT NULL,
  `consumerid` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitoolconsmap_too_ix` (`toolid`),
  KEY `mdl_enroltitoolconsmap_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table that maps the published tool to tool consumers.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_tool_consumer_map`
--

LOCK TABLES `mdl_enrol_lti_tool_consumer_map` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_tool_consumer_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_tool_consumer_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_tools`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_tools` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrolid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `maxenrolled` bigint(10) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint(10) NOT NULL,
  `rolelearner` bigint(10) NOT NULL,
  `secret` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  KEY `mdl_enroltitool_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of tools provided to the remote system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_tools`
--

LOCK TABLES `mdl_enrol_lti_tools` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_users`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `toolid` bigint(10) NOT NULL,
  `serviceurl` longtext COLLATE utf8_unicode_ci,
  `sourceid` longtext COLLATE utf8_unicode_ci,
  `consumerkey` longtext COLLATE utf8_unicode_ci,
  `consumersecret` longtext COLLATE utf8_unicode_ci,
  `membershipsurl` longtext COLLATE utf8_unicode_ci,
  `membershipsid` longtext COLLATE utf8_unicode_ci,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltiuser_use_ix` (`userid`),
  KEY `mdl_enroltiuser_too_ix` (`toolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User access log and gradeback data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_users`
--

LOCK TABLES `mdl_enrol_lti_users` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
INSERT INTO `mdl_event` VALUES (1,'evento do usuario','<p>este é um evento de teste onde os usuario irão participar</p>',1,0,0,2,0,'0',0,'user',1487542200,0,1,'',1,1487542580,NULL),(2,'evento do site','<p>evento de teste para o site..</p>',1,1,0,2,0,'0',0,'site',1487628900,0,1,'',1,1487542671,NULL),(3,'asdasdas','<p>asdasdasdasda</p>',1,0,0,2,0,'0',0,'user',1488164400,0,1,'',1,1487542776,NULL),(4,'asdasd','<p>asdasd</p>',1,1,0,2,0,'0',0,'site',1487542500,0,1,'',1,1487542832,NULL);
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `services` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'core_auth_confirm_user','core_auth_external','confirm_user',NULL,'moodle','',NULL),(2,'core_badges_get_user_badges','core_badges_external','get_user_badges',NULL,'moodle','moodle/badges:viewotherbadges','moodle_mobile_app'),(3,'core_calendar_create_calendar_events','core_calendar_external','create_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries',NULL),(4,'core_calendar_delete_calendar_events','core_calendar_external','delete_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries',NULL),(5,'core_calendar_get_calendar_events','core_calendar_external','get_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries','moodle_mobile_app'),(6,'core_cohort_add_cohort_members','core_cohort_external','add_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign',NULL),(7,'core_cohort_create_cohorts','core_cohort_external','create_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(8,'core_cohort_delete_cohort_members','core_cohort_external','delete_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign',NULL),(9,'core_cohort_delete_cohorts','core_cohort_external','delete_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(10,'core_cohort_get_cohort_members','core_cohort_external','get_cohort_members','cohort/externallib.php','moodle','moodle/cohort:view',NULL),(11,'core_cohort_get_cohorts','core_cohort_external','get_cohorts','cohort/externallib.php','moodle','moodle/cohort:view',NULL),(12,'core_cohort_update_cohorts','core_cohort_external','update_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(13,'core_comment_get_comments','core_comment_external','get_comments',NULL,'moodle','moodle/comment:view','moodle_mobile_app'),(14,'core_completion_get_activities_completion_status','core_completion_external','get_activities_completion_status',NULL,'moodle','','moodle_mobile_app'),(15,'core_completion_get_course_completion_status','core_completion_external','get_course_completion_status',NULL,'moodle','report/completion:view','moodle_mobile_app'),(16,'core_completion_mark_course_self_completed','core_completion_external','mark_course_self_completed',NULL,'moodle','','moodle_mobile_app'),(17,'core_completion_update_activity_completion_status_manually','core_completion_external','update_activity_completion_status_manually',NULL,'moodle','','moodle_mobile_app'),(18,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(19,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create, moodle/course:visibility',NULL),(20,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(21,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete',NULL),(22,'core_course_delete_modules','core_course_external','delete_modules','course/externallib.php','moodle','moodle/course:manageactivities',NULL),(23,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse, moodle/restore:restorecourse, moodle/course:create',NULL),(24,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories','moodle_mobile_app'),(25,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update, moodle/course:viewhiddencourses','moodle_mobile_app'),(26,'core_course_get_course_module','core_course_external','get_course_module','course/externallib.php','moodle','','moodle_mobile_app'),(27,'core_course_get_course_module_by_instance','core_course_external','get_course_module_by_instance','course/externallib.php','moodle','','moodle_mobile_app'),(28,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view, moodle/course:update, moodle/course:viewhiddencourses','moodle_mobile_app'),(29,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport',NULL),(30,'core_course_search_courses','core_course_external','search_courses','course/externallib.php','moodle','','moodle_mobile_app'),(31,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(32,'core_course_update_courses','core_course_external','update_courses','course/externallib.php','moodle','moodle/course:update, moodle/course:changecategory, moodle/course:changefullname, moodle/course:changeshortname, moodle/course:changeidnumber, moodle/course:changesummary, moodle/course:visibility',NULL),(33,'core_course_view_course','core_course_external','view_course','course/externallib.php','moodle','','moodle_mobile_app'),(34,'core_course_get_activities_overview','core_course_external','get_activities_overview','course/externallib.php','moodle','','moodle_mobile_app'),(35,'core_course_get_user_navigation_options','core_course_external','get_user_navigation_options','course/externallib.php','moodle','','moodle_mobile_app'),(36,'core_course_get_user_administration_options','core_course_external','get_user_administration_options','course/externallib.php','moodle','','moodle_mobile_app'),(37,'core_course_get_courses_by_field','core_course_external','get_courses_by_field','course/externallib.php','moodle','','moodle_mobile_app'),(38,'core_course_check_updates','core_course_external','check_updates','course/externallib.php','moodle','','moodle_mobile_app'),(39,'core_enrol_get_course_enrolment_methods','core_enrol_external','get_course_enrolment_methods','enrol/externallib.php','moodle','','moodle_mobile_app'),(40,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups','moodle_mobile_app'),(41,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle','',NULL),(42,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants','moodle_mobile_app'),(43,'core_fetch_notifications','core_external','fetch_notifications','lib/external/externallib.php','moodle','',NULL),(44,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle','','moodle_mobile_app'),(45,'core_files_upload','core_files_external','upload','files/externallib.php','moodle','',NULL),(46,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle','','moodle_mobile_app'),(47,'core_get_fragment','core_external','get_fragment','lib/external/externallib.php','moodle','',NULL),(48,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle','',NULL),(49,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle','',NULL),(50,'core_grades_get_grades','core_grades_external','get_grades',NULL,'moodle','moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden',NULL),(51,'core_grades_update_grades','core_grades_external','update_grades',NULL,'moodle','',NULL),(52,'core_grading_get_definitions','core_grading_external','get_definitions',NULL,'moodle','',NULL),(53,'core_grading_get_gradingform_instances','core_grading_external','get_gradingform_instances',NULL,'moodle','',NULL),(54,'core_grading_save_definitions','core_grading_external','save_definitions',NULL,'moodle','',NULL),(55,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(56,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle','',NULL),(57,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle','',NULL),(58,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(59,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(60,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle','',NULL),(61,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(62,'core_group_get_activity_allowed_groups','core_group_external','get_activity_allowed_groups','group/externallib.php','moodle','','moodle_mobile_app'),(63,'core_group_get_activity_groupmode','core_group_external','get_activity_groupmode','group/externallib.php','moodle','','moodle_mobile_app'),(64,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle','',NULL),(65,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(66,'core_group_get_course_user_groups','core_group_external','get_course_user_groups','group/externallib.php','moodle','moodle/course:managegroups','moodle_mobile_app'),(67,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(68,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle','',NULL),(69,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(70,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle','',NULL),(71,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle','',NULL),(72,'core_message_block_contacts','core_message_external','block_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(73,'core_message_create_contacts','core_message_external','create_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(74,'core_message_delete_contacts','core_message_external','delete_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(75,'core_message_delete_conversation','core_message_external','delete_conversation','message/externallib.php','moodle','moodle/site:deleteownmessage','moodle_mobile_app'),(76,'core_message_delete_message','core_message_external','delete_message','message/externallib.php','moodle','moodle/site:deleteownmessage','moodle_mobile_app'),(77,'core_message_get_blocked_users','core_message_external','get_blocked_users','message/externallib.php','moodle','','moodle_mobile_app'),(78,'core_message_data_for_messagearea_search_messages','core_message_external','data_for_messagearea_search_messages','message/externallib.php','moodle','','moodle_mobile_app'),(79,'core_message_data_for_messagearea_search_users','core_message_external','data_for_messagearea_search_users','message/externallib.php','moodle','',NULL),(80,'core_message_data_for_messagearea_search_users_in_course','core_message_external','data_for_messagearea_search_users_in_course','message/externallib.php','moodle','',NULL),(81,'core_message_data_for_messagearea_conversations','core_message_external','data_for_messagearea_conversations','message/externallib.php','moodle','',NULL),(82,'core_message_data_for_messagearea_contacts','core_message_external','data_for_messagearea_contacts','message/externallib.php','moodle','',NULL),(83,'core_message_data_for_messagearea_messages','core_message_external','data_for_messagearea_messages','message/externallib.php','moodle','',NULL),(84,'core_message_data_for_messagearea_get_most_recent_message','core_message_external','data_for_messagearea_get_most_recent_message','message/externallib.php','moodle','',NULL),(85,'core_message_data_for_messagearea_get_profile','core_message_external','data_for_messagearea_get_profile','message/externallib.php','moodle','',NULL),(86,'core_message_get_contacts','core_message_external','get_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(87,'core_message_get_messages','core_message_external','get_messages','message/externallib.php','moodle','','moodle_mobile_app'),(88,'core_message_get_unread_conversations_count','core_message_external','get_unread_conversations_count','message/externallib.php','moodle','','moodle_mobile_app'),(89,'core_message_mark_all_notifications_as_read','core_message_external','mark_all_notifications_as_read','message/externallib.php','moodle','','moodle_mobile_app'),(90,'core_message_mark_all_messages_as_read','core_message_external','mark_all_messages_as_read','message/externallib.php','moodle','','moodle_mobile_app'),(91,'core_message_mark_message_read','core_message_external','mark_message_read','message/externallib.php','moodle','','moodle_mobile_app'),(92,'core_message_message_processor_config_form','core_message_external','message_processor_config_form','message/externallib.php','moodle','','moodle_mobile_app'),(93,'core_message_get_message_processor','core_message_external','get_message_processor','message/externallib.php','moodle','',NULL),(94,'core_message_search_contacts','core_message_external','search_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(95,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage','moodle_mobile_app'),(96,'core_message_unblock_contacts','core_message_external','unblock_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(97,'core_message_get_user_notification_preferences','core_message_external','get_user_notification_preferences','message/externallib.php','moodle','moodle/user:editownmessageprofile','moodle_mobile_app'),(98,'core_message_get_user_message_preferences','core_message_external','get_user_message_preferences','message/externallib.php','moodle','moodle/user:editownmessageprofile','moodle_mobile_app'),(99,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage','moodle_mobile_app'),(100,'core_notes_delete_notes','core_notes_external','delete_notes','notes/externallib.php','moodle','moodle/notes:manage','moodle_mobile_app'),(101,'core_notes_get_course_notes','core_notes_external','get_course_notes','notes/externallib.php','moodle','moodle/notes:view','moodle_mobile_app'),(102,'core_notes_get_notes','core_notes_external','get_notes','notes/externallib.php','moodle','moodle/notes:view',NULL),(103,'core_notes_update_notes','core_notes_external','update_notes','notes/externallib.php','moodle','moodle/notes:manage',NULL),(104,'core_notes_view_notes','core_notes_external','view_notes','notes/externallib.php','moodle','moodle/notes:view','moodle_mobile_app'),(105,'core_output_load_template','core\\output\\external','load_template',NULL,'moodle','',NULL),(106,'core_question_update_flag','core_question_external','update_flag',NULL,'moodle','moodle/question:flag','moodle_mobile_app'),(107,'core_rating_get_item_ratings','core_rating_external','get_item_ratings',NULL,'moodle','moodle/rating:view','moodle_mobile_app'),(108,'core_rating_add_rating','core_rating_external','add_rating',NULL,'moodle','moodle/rating:rate','moodle_mobile_app'),(109,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign',NULL),(110,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign',NULL),(111,'core_tag_get_tagindex','core_tag_external','get_tagindex',NULL,'moodle','',NULL),(112,'core_tag_get_tags','core_tag_external','get_tags',NULL,'moodle','',NULL),(113,'core_tag_update_tags','core_tag_external','update_tags',NULL,'moodle','',NULL),(114,'core_update_inplace_editable','core_external','update_inplace_editable','lib/external/externallib.php','moodle','',NULL),(115,'core_user_add_user_device','core_user_external','add_user_device','user/externallib.php','moodle','','moodle_mobile_app'),(116,'core_user_add_user_private_files','core_user_external','add_user_private_files','user/externallib.php','moodle','moodle/user:manageownfiles','moodle_mobile_app'),(117,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create',NULL),(118,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete',NULL),(119,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups','moodle_mobile_app'),(120,'core_user_get_users','core_user_external','get_users','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update',NULL),(121,'core_user_get_users_by_field','core_user_external','get_users_by_field','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update','moodle_mobile_app'),(122,'core_user_remove_user_device','core_user_external','remove_user_device','user/externallib.php','moodle','','moodle_mobile_app'),(123,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update',NULL),(124,'core_user_update_user_preferences','core_user_external','update_user_preferences','user/externallib.php','moodle','moodle/user:editownmessageprofile, moodle/user:editmessageprofile','moodle_mobile_app'),(125,'core_user_view_user_list','core_user_external','view_user_list','user/externallib.php','moodle','moodle/course:viewparticipants','moodle_mobile_app'),(126,'core_user_view_user_profile','core_user_external','view_user_profile','user/externallib.php','moodle','moodle/user:viewdetails','moodle_mobile_app'),(127,'core_user_get_user_preferences','core_user_external','get_user_preferences','user/externallib.php','moodle','','moodle_mobile_app'),(128,'core_user_update_picture','core_user_external','update_picture','user/externallib.php','moodle','moodle/user:editownprofile, moodle/user:editprofile','moodle_mobile_app'),(129,'core_user_set_user_preferences','core_user_external','set_user_preferences','user/externallib.php','moodle','moodle/site:config',NULL),(130,'core_user_agree_site_policy','core_user_external','agree_site_policy','user/externallib.php','moodle','','moodle_mobile_app'),(131,'core_competency_create_competency_framework','core_competency\\external','create_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(132,'core_competency_read_competency_framework','core_competency\\external','read_competency_framework',NULL,'moodle','moodle/competency:competencyview',NULL),(133,'core_competency_duplicate_competency_framework','core_competency\\external','duplicate_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(134,'core_competency_delete_competency_framework','core_competency\\external','delete_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(135,'core_competency_update_competency_framework','core_competency\\external','update_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(136,'core_competency_list_competency_frameworks','core_competency\\external','list_competency_frameworks',NULL,'moodle','moodle/competency:competencyview',NULL),(137,'core_competency_count_competency_frameworks','core_competency\\external','count_competency_frameworks',NULL,'moodle','moodle/competency:competencyview',NULL),(138,'core_competency_competency_framework_viewed','core_competency\\external','competency_framework_viewed',NULL,'moodle','moodle/competency:competencyview',NULL),(139,'core_competency_create_competency','core_competency\\external','create_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(140,'core_competency_read_competency','core_competency\\external','read_competency',NULL,'moodle','moodle/competency:competencyview',NULL),(141,'core_competency_competency_viewed','core_competency\\external','competency_viewed',NULL,'moodle','moodle/competency:competencyview','moodle_mobile_app'),(142,'core_competency_delete_competency','core_competency\\external','delete_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(143,'core_competency_update_competency','core_competency\\external','update_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(144,'core_competency_list_competencies','core_competency\\external','list_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(145,'core_competency_list_competencies_in_template','core_competency\\external','list_competencies_in_template',NULL,'moodle','moodle/competency:competencyview',NULL),(146,'core_competency_count_competencies','core_competency\\external','count_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(147,'core_competency_count_competencies_in_template','core_competency\\external','count_competencies_in_template',NULL,'moodle','moodle/competency:competencyview',NULL),(148,'core_competency_search_competencies','core_competency\\external','search_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(149,'core_competency_set_parent_competency','core_competency\\external','set_parent_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(150,'core_competency_move_up_competency','core_competency\\external','move_up_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(151,'core_competency_move_down_competency','core_competency\\external','move_down_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(152,'core_competency_list_course_competencies','core_competency\\external','list_course_competencies',NULL,'moodle','moodle/competency:coursecompetencyview','moodle_mobile_app'),(153,'core_competency_count_competencies_in_course','core_competency\\external','count_competencies_in_course',NULL,'moodle','moodle/competency:coursecompetencyview',NULL),(154,'core_competency_count_courses_using_competency','core_competency\\external','count_courses_using_competency',NULL,'moodle','moodle/competency:coursecompetencyview',NULL),(155,'core_competency_add_competency_to_course','core_competency\\external','add_competency_to_course',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(156,'core_competency_add_competency_to_template','core_competency\\external','add_competency_to_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(157,'core_competency_remove_competency_from_course','core_competency\\external','remove_competency_from_course',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(158,'core_competency_set_course_competency_ruleoutcome','core_competency\\external','set_course_competency_ruleoutcome',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(159,'core_competency_remove_competency_from_template','core_competency\\external','remove_competency_from_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(160,'core_competency_reorder_course_competency','core_competency\\external','reorder_course_competency',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(161,'core_competency_reorder_template_competency','core_competency\\external','reorder_template_competency',NULL,'moodle','moodle/competency:templatemanage',NULL),(162,'core_competency_create_template','core_competency\\external','create_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(163,'core_competency_duplicate_template','core_competency\\external','duplicate_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(164,'core_competency_read_template','core_competency\\external','read_template',NULL,'moodle','moodle/competency:templateview',NULL),(165,'core_competency_delete_template','core_competency\\external','delete_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(166,'core_competency_update_template','core_competency\\external','update_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(167,'core_competency_list_templates','core_competency\\external','list_templates',NULL,'moodle','moodle/competency:templateview',NULL),(168,'core_competency_list_templates_using_competency','core_competency\\external','list_templates_using_competency',NULL,'moodle','moodle/competency:templateview',NULL),(169,'core_competency_count_templates','core_competency\\external','count_templates',NULL,'moodle','moodle/competency:templateview',NULL),(170,'core_competency_count_templates_using_competency','core_competency\\external','count_templates_using_competency',NULL,'moodle','moodle/competency:templateview',NULL),(171,'core_competency_create_plan','core_competency\\external','create_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(172,'core_competency_update_plan','core_competency\\external','update_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(173,'core_competency_complete_plan','core_competency\\external','complete_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(174,'core_competency_reopen_plan','core_competency\\external','reopen_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(175,'core_competency_read_plan','core_competency\\external','read_plan',NULL,'moodle','moodle/competency:planviewown',NULL),(176,'core_competency_delete_plan','core_competency\\external','delete_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(177,'core_competency_list_user_plans','core_competency\\external','list_user_plans',NULL,'moodle','moodle/competency:planviewown',NULL),(178,'core_competency_list_plan_competencies','core_competency\\external','list_plan_competencies',NULL,'moodle','moodle/competency:planviewown',NULL),(179,'core_competency_add_competency_to_plan','core_competency\\external','add_competency_to_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(180,'core_competency_remove_competency_from_plan','core_competency\\external','remove_competency_from_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(181,'core_competency_reorder_plan_competency','core_competency\\external','reorder_plan_competency',NULL,'moodle','moodle/competency:planmanage',NULL),(182,'core_competency_plan_request_review','core_competency\\external','plan_request_review',NULL,'moodle','moodle/competency:planmanagedraft',NULL),(183,'core_competency_plan_start_review','core_competency\\external','plan_start_review',NULL,'moodle','moodle/competency:planmanage',NULL),(184,'core_competency_plan_stop_review','core_competency\\external','plan_stop_review',NULL,'moodle','moodle/competency:planmanage',NULL),(185,'core_competency_plan_cancel_review_request','core_competency\\external','plan_cancel_review_request',NULL,'moodle','moodle/competency:planmanagedraft',NULL),(186,'core_competency_approve_plan','core_competency\\external','approve_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(187,'core_competency_unapprove_plan','core_competency\\external','unapprove_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(188,'core_competency_template_has_related_data','core_competency\\external','template_has_related_data',NULL,'moodle','moodle/competency:templateview',NULL),(189,'core_competency_get_scale_values','core_competency\\external','get_scale_values',NULL,'moodle','moodle/competency:competencymanage','moodle_mobile_app'),(190,'core_competency_add_related_competency','core_competency\\external','add_related_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(191,'core_competency_remove_related_competency','core_competency\\external','remove_related_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(192,'core_competency_read_user_evidence','core_competency\\external','read_user_evidence',NULL,'moodle','moodle/competency:userevidenceview',NULL),(193,'core_competency_delete_user_evidence','core_competency\\external','delete_user_evidence',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(194,'core_competency_create_user_evidence_competency','core_competency\\external','create_user_evidence_competency',NULL,'moodle','moodle/competency:userevidencemanageown, moodle/competency:competencyview',NULL),(195,'core_competency_delete_user_evidence_competency','core_competency\\external','delete_user_evidence_competency',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(196,'core_competency_user_competency_cancel_review_request','core_competency\\external','user_competency_cancel_review_request',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(197,'core_competency_user_competency_request_review','core_competency\\external','user_competency_request_review',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(198,'core_competency_user_competency_start_review','core_competency\\external','user_competency_start_review',NULL,'moodle','moodle/competency:competencygrade',NULL),(199,'core_competency_user_competency_stop_review','core_competency\\external','user_competency_stop_review',NULL,'moodle','moodle/competency:competencygrade',NULL),(200,'core_competency_user_competency_viewed','core_competency\\external','user_competency_viewed',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(201,'core_competency_user_competency_viewed_in_plan','core_competency\\external','user_competency_viewed_in_plan',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(202,'core_competency_user_competency_viewed_in_course','core_competency\\external','user_competency_viewed_in_course',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(203,'core_competency_user_competency_plan_viewed','core_competency\\external','user_competency_plan_viewed',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(204,'core_competency_grade_competency','core_competency\\external','grade_competency',NULL,'moodle','moodle/competency:competencygrade',NULL),(205,'core_competency_grade_competency_in_plan','core_competency\\external','grade_competency_in_plan',NULL,'moodle','moodle/competency:competencygrade',NULL),(206,'core_competency_grade_competency_in_course','core_competency\\external','grade_competency_in_course',NULL,'moodle','moodle/competency:competencygrade','moodle_mobile_app'),(207,'core_competency_unlink_plan_from_template','core_competency\\external','unlink_plan_from_template',NULL,'moodle','moodle/competency:planmanage',NULL),(208,'core_competency_template_viewed','core_competency\\external','template_viewed',NULL,'moodle','moodle/competency:templateview',NULL),(209,'core_competency_request_review_of_user_evidence_linked_competencies','core_competency\\external','request_review_of_user_evidence_linked_competencies',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(210,'core_competency_update_course_competency_settings','core_competency\\external','update_course_competency_settings',NULL,'moodle','moodle/competency:coursecompetencyconfigure',NULL),(211,'core_competency_delete_evidence','core_competency\\external','delete_evidence',NULL,'moodle','moodle/competency:evidencedelete','moodle_mobile_app'),(212,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle','','moodle_mobile_app'),(213,'mod_assign_copy_previous_attempt','mod_assign_external','copy_previous_attempt','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:submit',NULL),(214,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(215,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(216,'mod_assign_get_submissions','mod_assign_external','get_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(217,'mod_assign_get_user_flags','mod_assign_external','get_user_flags','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(218,'mod_assign_set_user_flags','mod_assign_external','set_user_flags','mod/assign/externallib.php','mod_assign','mod/assign:grade','moodle_mobile_app'),(219,'mod_assign_get_user_mappings','mod_assign_external','get_user_mappings','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(220,'mod_assign_revert_submissions_to_draft','mod_assign_external','revert_submissions_to_draft','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(221,'mod_assign_lock_submissions','mod_assign_external','lock_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(222,'mod_assign_unlock_submissions','mod_assign_external','unlock_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(223,'mod_assign_save_submission','mod_assign_external','save_submission','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(224,'mod_assign_submit_for_grading','mod_assign_external','submit_for_grading','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(225,'mod_assign_save_grade','mod_assign_external','save_grade','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(226,'mod_assign_save_grades','mod_assign_external','save_grades','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(227,'mod_assign_save_user_extensions','mod_assign_external','save_user_extensions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(228,'mod_assign_reveal_identities','mod_assign_external','reveal_identities','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(229,'mod_assign_view_grading_table','mod_assign_external','view_grading_table','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades','moodle_mobile_app'),(230,'mod_assign_view_submission_status','mod_assign_external','view_submission_status','mod/assign/externallib.php','mod_assign','mod/assign:view','moodle_mobile_app'),(231,'mod_assign_get_submission_status','mod_assign_external','get_submission_status','mod/assign/externallib.php','mod_assign','mod/assign:view','moodle_mobile_app'),(232,'mod_assign_list_participants','mod_assign_external','list_participants','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades','moodle_mobile_app'),(233,'mod_assign_submit_grading_form','mod_assign_external','submit_grading_form','mod/assign/externallib.php','mod_assign','mod/assign:grade','moodle_mobile_app'),(234,'mod_assign_get_participant','mod_assign_external','get_participant','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades','moodle_mobile_app'),(235,'mod_assign_view_assign','mod_assign_external','view_assign','mod/assign/externallib.php','mod_assign','mod/assign:view','moodle_mobile_app'),(236,'mod_book_view_book','mod_book_external','view_book',NULL,'mod_book','mod/book:read','moodle_mobile_app'),(237,'mod_book_get_books_by_courses','mod_book_external','get_books_by_courses',NULL,'mod_book','','moodle_mobile_app'),(238,'mod_chat_login_user','mod_chat_external','login_user',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(239,'mod_chat_get_chat_users','mod_chat_external','get_chat_users',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(240,'mod_chat_send_chat_message','mod_chat_external','send_chat_message',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(241,'mod_chat_get_chat_latest_messages','mod_chat_external','get_chat_latest_messages',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(242,'mod_chat_view_chat','mod_chat_external','view_chat',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(243,'mod_chat_get_chats_by_courses','mod_chat_external','get_chats_by_courses',NULL,'mod_chat','','moodle_mobile_app'),(244,'mod_choice_get_choice_results','mod_choice_external','get_choice_results',NULL,'mod_choice','','moodle_mobile_app'),(245,'mod_choice_get_choice_options','mod_choice_external','get_choice_options',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(246,'mod_choice_submit_choice_response','mod_choice_external','submit_choice_response',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(247,'mod_choice_view_choice','mod_choice_external','view_choice',NULL,'mod_choice','','moodle_mobile_app'),(248,'mod_choice_get_choices_by_courses','mod_choice_external','get_choices_by_courses',NULL,'mod_choice','','moodle_mobile_app'),(249,'mod_choice_delete_choice_responses','mod_choice_external','delete_choice_responses',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(250,'mod_data_get_databases_by_courses','mod_data_external','get_databases_by_courses',NULL,'mod_data','mod/data:viewentry','moodle_mobile_app'),(251,'mod_folder_view_folder','mod_folder_external','view_folder',NULL,'mod_folder','mod/folder:view','moodle_mobile_app'),(252,'mod_forum_get_forums_by_courses','mod_forum_external','get_forums_by_courses','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(253,'mod_forum_get_forum_discussion_posts','mod_forum_external','get_forum_discussion_posts','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting','moodle_mobile_app'),(254,'mod_forum_get_forum_discussions_paginated','mod_forum_external','get_forum_discussions_paginated','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting','moodle_mobile_app'),(255,'mod_forum_view_forum','mod_forum_external','view_forum','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(256,'mod_forum_view_forum_discussion','mod_forum_external','view_forum_discussion','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(257,'mod_forum_add_discussion_post','mod_forum_external','add_discussion_post','mod/forum/externallib.php','mod_forum','mod/forum:replypost','moodle_mobile_app'),(258,'mod_forum_add_discussion','mod_forum_external','add_discussion','mod/forum/externallib.php','mod_forum','mod/forum:startdiscussion','moodle_mobile_app'),(259,'mod_forum_can_add_discussion','mod_forum_external','can_add_discussion','mod/forum/externallib.php','mod_forum','','moodle_mobile_app'),(260,'mod_glossary_get_glossaries_by_courses','mod_glossary_external','get_glossaries_by_courses',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(261,'mod_glossary_view_glossary','mod_glossary_external','view_glossary',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(262,'mod_glossary_view_entry','mod_glossary_external','view_entry',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(263,'mod_glossary_get_entries_by_letter','mod_glossary_external','get_entries_by_letter',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(264,'mod_glossary_get_entries_by_date','mod_glossary_external','get_entries_by_date',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(265,'mod_glossary_get_categories','mod_glossary_external','get_categories',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(266,'mod_glossary_get_entries_by_category','mod_glossary_external','get_entries_by_category',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(267,'mod_glossary_get_authors','mod_glossary_external','get_authors',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(268,'mod_glossary_get_entries_by_author','mod_glossary_external','get_entries_by_author',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(269,'mod_glossary_get_entries_by_author_id','mod_glossary_external','get_entries_by_author_id',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(270,'mod_glossary_get_entries_by_search','mod_glossary_external','get_entries_by_search',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(271,'mod_glossary_get_entries_by_term','mod_glossary_external','get_entries_by_term',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(272,'mod_glossary_get_entries_to_approve','mod_glossary_external','get_entries_to_approve',NULL,'mod_glossary','mod/glossary:approve','moodle_mobile_app'),(273,'mod_glossary_get_entry_by_id','mod_glossary_external','get_entry_by_id',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(274,'mod_glossary_add_entry','mod_glossary_external','add_entry',NULL,'mod_glossary','mod/glossary:write','moodle_mobile_app'),(275,'mod_imscp_view_imscp','mod_imscp_external','view_imscp',NULL,'mod_imscp','mod/imscp:view','moodle_mobile_app'),(276,'mod_imscp_get_imscps_by_courses','mod_imscp_external','get_imscps_by_courses',NULL,'mod_imscp','mod/imscp:view','moodle_mobile_app'),(277,'mod_lti_get_tool_launch_data','mod_lti_external','get_tool_launch_data',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(278,'mod_lti_get_ltis_by_courses','mod_lti_external','get_ltis_by_courses',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(279,'mod_lti_view_lti','mod_lti_external','view_lti',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(280,'mod_lti_get_tool_proxies','mod_lti_external','get_tool_proxies',NULL,'mod_lti','moodle/site:config',NULL),(281,'mod_lti_create_tool_proxy','mod_lti_external','create_tool_proxy',NULL,'mod_lti','moodle/site:config',NULL),(282,'mod_lti_delete_tool_proxy','mod_lti_external','delete_tool_proxy',NULL,'mod_lti','moodle/site:config',NULL),(283,'mod_lti_get_tool_proxy_registration_request','mod_lti_external','get_tool_proxy_registration_request',NULL,'mod_lti','moodle/site:config',NULL),(284,'mod_lti_get_tool_types','mod_lti_external','get_tool_types',NULL,'mod_lti','moodle/site:config',NULL),(285,'mod_lti_create_tool_type','mod_lti_external','create_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(286,'mod_lti_update_tool_type','mod_lti_external','update_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(287,'mod_lti_delete_tool_type','mod_lti_external','delete_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(288,'mod_lti_is_cartridge','mod_lti_external','is_cartridge',NULL,'mod_lti','moodle/site:config',NULL),(289,'mod_page_view_page','mod_page_external','view_page',NULL,'mod_page','mod/page:view','moodle_mobile_app'),(290,'mod_quiz_get_quizzes_by_courses','mod_quiz_external','get_quizzes_by_courses',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(291,'mod_quiz_view_quiz','mod_quiz_external','view_quiz',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(292,'mod_quiz_get_user_attempts','mod_quiz_external','get_user_attempts',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(293,'mod_quiz_get_user_best_grade','mod_quiz_external','get_user_best_grade',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(294,'mod_quiz_get_combined_review_options','mod_quiz_external','get_combined_review_options',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(295,'mod_quiz_start_attempt','mod_quiz_external','start_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(296,'mod_quiz_get_attempt_data','mod_quiz_external','get_attempt_data',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(297,'mod_quiz_get_attempt_summary','mod_quiz_external','get_attempt_summary',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(298,'mod_quiz_save_attempt','mod_quiz_external','save_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(299,'mod_quiz_process_attempt','mod_quiz_external','process_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(300,'mod_quiz_get_attempt_review','mod_quiz_external','get_attempt_review',NULL,'mod_quiz','mod/quiz:reviewmyattempts','moodle_mobile_app'),(301,'mod_quiz_view_attempt','mod_quiz_external','view_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(302,'mod_quiz_view_attempt_summary','mod_quiz_external','view_attempt_summary',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(303,'mod_quiz_view_attempt_review','mod_quiz_external','view_attempt_review',NULL,'mod_quiz','mod/quiz:reviewmyattempts','moodle_mobile_app'),(304,'mod_quiz_get_quiz_feedback_for_grade','mod_quiz_external','get_quiz_feedback_for_grade',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(305,'mod_quiz_get_quiz_access_information','mod_quiz_external','get_quiz_access_information',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(306,'mod_quiz_get_attempt_access_information','mod_quiz_external','get_attempt_access_information',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(307,'mod_quiz_get_quiz_required_qtypes','mod_quiz_external','get_quiz_required_qtypes',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(308,'mod_resource_view_resource','mod_resource_external','view_resource',NULL,'mod_resource','mod/resource:view','moodle_mobile_app'),(309,'mod_scorm_view_scorm','mod_scorm_external','view_scorm',NULL,'mod_scorm','','moodle_mobile_app'),(310,'mod_scorm_get_scorm_attempt_count','mod_scorm_external','get_scorm_attempt_count',NULL,'mod_scorm','','moodle_mobile_app'),(311,'mod_scorm_get_scorm_scoes','mod_scorm_external','get_scorm_scoes',NULL,'mod_scorm','','moodle_mobile_app'),(312,'mod_scorm_get_scorm_user_data','mod_scorm_external','get_scorm_user_data',NULL,'mod_scorm','','moodle_mobile_app'),(313,'mod_scorm_insert_scorm_tracks','mod_scorm_external','insert_scorm_tracks',NULL,'mod_scorm','mod/scorm:savetrack','moodle_mobile_app'),(314,'mod_scorm_get_scorm_sco_tracks','mod_scorm_external','get_scorm_sco_tracks',NULL,'mod_scorm','','moodle_mobile_app'),(315,'mod_scorm_get_scorms_by_courses','mod_scorm_external','get_scorms_by_courses',NULL,'mod_scorm','','moodle_mobile_app'),(316,'mod_scorm_launch_sco','mod_scorm_external','launch_sco',NULL,'mod_scorm','','moodle_mobile_app'),(317,'mod_survey_get_surveys_by_courses','mod_survey_external','get_surveys_by_courses',NULL,'mod_survey','','moodle_mobile_app'),(318,'mod_survey_view_survey','mod_survey_external','view_survey',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(319,'mod_survey_get_questions','mod_survey_external','get_questions',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(320,'mod_survey_submit_answers','mod_survey_external','submit_answers',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(321,'mod_url_view_url','mod_url_external','view_url',NULL,'mod_url','mod/url:view','moodle_mobile_app'),(322,'mod_wiki_get_wikis_by_courses','mod_wiki_external','get_wikis_by_courses',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(323,'mod_wiki_view_wiki','mod_wiki_external','view_wiki',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(324,'mod_wiki_view_page','mod_wiki_external','view_page',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(325,'mod_wiki_get_subwikis','mod_wiki_external','get_subwikis',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(326,'mod_wiki_get_subwiki_pages','mod_wiki_external','get_subwiki_pages',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(327,'mod_wiki_get_subwiki_files','mod_wiki_external','get_subwiki_files',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(328,'mod_wiki_get_page_contents','mod_wiki_external','get_page_contents',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(329,'mod_wiki_get_page_for_editing','mod_wiki_external','get_page_for_editing',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(330,'mod_wiki_new_page','mod_wiki_external','new_page',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(331,'mod_wiki_edit_page','mod_wiki_external','edit_page',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(332,'auth_email_get_signup_settings','auth_email_external','get_signup_settings',NULL,'auth_email','',NULL),(333,'auth_email_signup_user','auth_email_external','signup_user',NULL,'auth_email','',NULL),(334,'enrol_guest_get_instance_info','enrol_guest_external','get_instance_info',NULL,'enrol_guest','','moodle_mobile_app'),(335,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol',NULL),(336,'enrol_manual_unenrol_users','enrol_manual_external','unenrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:unenrol',NULL),(337,'enrol_self_get_instance_info','enrol_self_external','get_instance_info','enrol/self/externallib.php','enrol_self','','moodle_mobile_app'),(338,'enrol_self_enrol_user','enrol_self_external','enrol_user','enrol/self/externallib.php','enrol_self','','moodle_mobile_app'),(339,'message_airnotifier_is_system_configured','message_airnotifier_external','is_system_configured','message/output/airnotifier/externallib.php','message_airnotifier','','moodle_mobile_app'),(340,'message_airnotifier_are_notification_preferences_configured','message_airnotifier_external','are_notification_preferences_configured','message/output/airnotifier/externallib.php','message_airnotifier','','moodle_mobile_app'),(341,'message_airnotifier_get_user_devices','message_airnotifier_external','get_user_devices','message/output/airnotifier/externallib.php','message_airnotifier','','moodle_mobile_app'),(342,'message_airnotifier_enable_device','message_airnotifier_external','enable_device','message/output/airnotifier/externallib.php','message_airnotifier','message/airnotifier:managedevice','moodle_mobile_app'),(343,'message_popup_get_popup_notifications','message_popup_external','get_popup_notifications','message/output/popup/externallib.php','message_popup','','moodle_mobile_app'),(344,'message_popup_get_unread_popup_notification_count','message_popup_external','get_unread_popup_notification_count','message/output/popup/externallib.php','message_popup','','moodle_mobile_app'),(345,'report_competency_data_for_report','report_competency\\external','data_for_report',NULL,'report_competency','moodle/competency:coursecompetencyview',NULL),(346,'gradereport_overview_get_course_grades','gradereport_overview_external','get_course_grades',NULL,'gradereport_overview','','moodle_mobile_app'),(347,'gradereport_overview_view_grade_report','gradereport_overview_external','view_grade_report',NULL,'gradereport_overview','gradereport/overview:view','moodle_mobile_app'),(348,'gradereport_user_get_grades_table','gradereport_user_external','get_grades_table','grade/report/user/externallib.php','gradereport_user','gradereport/user:view','moodle_mobile_app'),(349,'gradereport_user_view_grade_report','gradereport_user_external','view_grade_report','grade/report/user/externallib.php','gradereport_user','gradereport/user:view','moodle_mobile_app'),(350,'gradereport_user_get_grade_items','gradereport_user_external','get_grade_items','grade/report/user/externallib.php','gradereport_user','gradereport/user:view','moodle_mobile_app'),(351,'tool_lp_data_for_competency_frameworks_manage_page','tool_lp\\external','data_for_competency_frameworks_manage_page',NULL,'tool_lp','moodle/competency:competencyview',NULL),(352,'tool_lp_data_for_competency_summary','tool_lp\\external','data_for_competency_summary',NULL,'tool_lp','moodle/competency:competencyview',NULL),(353,'tool_lp_data_for_competencies_manage_page','tool_lp\\external','data_for_competencies_manage_page',NULL,'tool_lp','moodle/competency:competencyview',NULL),(354,'tool_lp_list_courses_using_competency','tool_lp\\external','list_courses_using_competency',NULL,'tool_lp','moodle/competency:coursecompetencyview',NULL),(355,'tool_lp_data_for_course_competencies_page','tool_lp\\external','data_for_course_competencies_page',NULL,'tool_lp','moodle/competency:coursecompetencyview','moodle_mobile_app'),(356,'tool_lp_data_for_template_competencies_page','tool_lp\\external','data_for_template_competencies_page',NULL,'tool_lp','moodle/competency:templateview',NULL),(357,'tool_lp_data_for_templates_manage_page','tool_lp\\external','data_for_templates_manage_page',NULL,'tool_lp','moodle/competency:templateview',NULL),(358,'tool_lp_data_for_plans_page','tool_lp\\external','data_for_plans_page',NULL,'tool_lp','moodle/competency:planviewown','moodle_mobile_app'),(359,'tool_lp_data_for_plan_page','tool_lp\\external','data_for_plan_page',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(360,'tool_lp_data_for_related_competencies_section','tool_lp\\external','data_for_related_competencies_section',NULL,'tool_lp','moodle/competency:competencyview',NULL),(361,'tool_lp_search_users','tool_lp\\external','search_users',NULL,'tool_lp','',NULL),(362,'tool_lp_search_cohorts','tool_lp\\external','search_cohorts',NULL,'tool_lp','moodle/cohort:view',NULL),(363,'tool_lp_data_for_user_evidence_list_page','tool_lp\\external','data_for_user_evidence_list_page',NULL,'tool_lp','moodle/competency:userevidenceview','moodle_mobile_app'),(364,'tool_lp_data_for_user_evidence_page','tool_lp\\external','data_for_user_evidence_page',NULL,'tool_lp','moodle/competency:userevidenceview','moodle_mobile_app'),(365,'tool_lp_data_for_user_competency_summary','tool_lp\\external','data_for_user_competency_summary',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(366,'tool_lp_data_for_user_competency_summary_in_plan','tool_lp\\external','data_for_user_competency_summary_in_plan',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(367,'tool_lp_data_for_user_competency_summary_in_course','tool_lp\\external','data_for_user_competency_summary_in_course',NULL,'tool_lp','moodle/competency:coursecompetencyview','moodle_mobile_app'),(368,'tool_mobile_get_plugins_supporting_mobile','tool_mobile\\external','get_plugins_supporting_mobile',NULL,'tool_mobile','','moodle_mobile_app'),(369,'tool_mobile_get_public_config','tool_mobile\\external','get_public_config',NULL,'tool_mobile','','moodle_mobile_app'),(370,'tool_mobile_get_config','tool_mobile\\external','get_config',NULL,'tool_mobile','','moodle_mobile_app'),(371,'tool_mobile_get_autologin_key','tool_mobile\\external','get_autologin_key',NULL,'tool_mobile','','moodle_mobile_app'),(372,'tool_templatelibrary_list_templates','tool_templatelibrary\\external','list_templates',NULL,'tool_templatelibrary','',NULL),(373,'tool_templatelibrary_load_canonical_template','tool_templatelibrary\\external','load_canonical_template',NULL,'tool_templatelibrary','',NULL),(374,'tool_usertours_fetch_and_start_tour','tool_usertours\\external\\tour','fetch_and_start_tour',NULL,'tool_usertours','',NULL),(375,'tool_usertours_step_shown','tool_usertours\\external\\tour','step_shown',NULL,'tool_usertours','',NULL),(376,'tool_usertours_complete_tour','tool_usertours\\external\\tour','complete_tour',NULL,'tool_usertours','',NULL),(377,'tool_usertours_reset_tour','tool_usertours\\external\\tour','reset_tour',NULL,'tool_usertours','',NULL);
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1484792640,1484792907,'moodle_mobile_app',1,1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'core_badges_get_user_badges'),(2,1,'core_calendar_get_calendar_events'),(3,1,'core_comment_get_comments'),(4,1,'core_completion_get_activities_completion_status'),(5,1,'core_completion_get_course_completion_status'),(6,1,'core_completion_mark_course_self_completed'),(7,1,'core_completion_update_activity_completion_status_manually'),(8,1,'core_course_get_categories'),(9,1,'core_course_get_contents'),(10,1,'core_course_get_course_module'),(11,1,'core_course_get_course_module_by_instance'),(12,1,'core_course_get_courses'),(13,1,'core_course_search_courses'),(14,1,'core_course_view_course'),(15,1,'core_course_get_activities_overview'),(16,1,'core_course_get_user_navigation_options'),(17,1,'core_course_get_user_administration_options'),(18,1,'core_course_get_courses_by_field'),(19,1,'core_course_check_updates'),(20,1,'core_enrol_get_course_enrolment_methods'),(21,1,'core_enrol_get_enrolled_users'),(22,1,'core_enrol_get_users_courses'),(23,1,'core_files_get_files'),(24,1,'core_get_component_strings'),(25,1,'core_group_get_activity_allowed_groups'),(26,1,'core_group_get_activity_groupmode'),(27,1,'core_group_get_course_user_groups'),(28,1,'core_message_block_contacts'),(29,1,'core_message_create_contacts'),(30,1,'core_message_delete_contacts'),(31,1,'core_message_delete_conversation'),(32,1,'core_message_delete_message'),(33,1,'core_message_get_blocked_users'),(34,1,'core_message_data_for_messagearea_search_messages'),(35,1,'core_message_get_contacts'),(36,1,'core_message_get_messages'),(37,1,'core_message_get_unread_conversations_count'),(38,1,'core_message_mark_all_notifications_as_read'),(39,1,'core_message_mark_all_messages_as_read'),(40,1,'core_message_mark_message_read'),(41,1,'core_message_message_processor_config_form'),(42,1,'core_message_search_contacts'),(43,1,'core_message_send_instant_messages'),(44,1,'core_message_unblock_contacts'),(45,1,'core_message_get_user_notification_preferences'),(46,1,'core_message_get_user_message_preferences'),(47,1,'core_notes_create_notes'),(48,1,'core_notes_delete_notes'),(49,1,'core_notes_get_course_notes'),(50,1,'core_notes_view_notes'),(51,1,'core_question_update_flag'),(52,1,'core_rating_get_item_ratings'),(53,1,'core_rating_add_rating'),(54,1,'core_user_add_user_device'),(55,1,'core_user_add_user_private_files'),(56,1,'core_user_get_course_user_profiles'),(57,1,'core_user_get_users_by_field'),(58,1,'core_user_remove_user_device'),(59,1,'core_user_update_user_preferences'),(60,1,'core_user_view_user_list'),(61,1,'core_user_view_user_profile'),(62,1,'core_user_get_user_preferences'),(63,1,'core_user_update_picture'),(64,1,'core_user_agree_site_policy'),(65,1,'core_competency_competency_viewed'),(66,1,'core_competency_list_course_competencies'),(67,1,'core_competency_get_scale_values'),(68,1,'core_competency_user_competency_viewed'),(69,1,'core_competency_user_competency_viewed_in_plan'),(70,1,'core_competency_user_competency_viewed_in_course'),(71,1,'core_competency_user_competency_plan_viewed'),(72,1,'core_competency_grade_competency_in_course'),(73,1,'core_competency_delete_evidence'),(74,1,'core_webservice_get_site_info'),(75,1,'mod_assign_get_grades'),(76,1,'mod_assign_get_assignments'),(77,1,'mod_assign_get_submissions'),(78,1,'mod_assign_get_user_flags'),(79,1,'mod_assign_set_user_flags'),(80,1,'mod_assign_get_user_mappings'),(81,1,'mod_assign_revert_submissions_to_draft'),(82,1,'mod_assign_lock_submissions'),(83,1,'mod_assign_unlock_submissions'),(84,1,'mod_assign_save_submission'),(85,1,'mod_assign_submit_for_grading'),(86,1,'mod_assign_save_grade'),(87,1,'mod_assign_save_grades'),(88,1,'mod_assign_save_user_extensions'),(89,1,'mod_assign_reveal_identities'),(90,1,'mod_assign_view_grading_table'),(91,1,'mod_assign_view_submission_status'),(92,1,'mod_assign_get_submission_status'),(93,1,'mod_assign_list_participants'),(94,1,'mod_assign_submit_grading_form'),(95,1,'mod_assign_get_participant'),(96,1,'mod_assign_view_assign'),(97,1,'mod_book_view_book'),(98,1,'mod_book_get_books_by_courses'),(99,1,'mod_chat_login_user'),(100,1,'mod_chat_get_chat_users'),(101,1,'mod_chat_send_chat_message'),(102,1,'mod_chat_get_chat_latest_messages'),(103,1,'mod_chat_view_chat'),(104,1,'mod_chat_get_chats_by_courses'),(105,1,'mod_choice_get_choice_results'),(106,1,'mod_choice_get_choice_options'),(107,1,'mod_choice_submit_choice_response'),(108,1,'mod_choice_view_choice'),(109,1,'mod_choice_get_choices_by_courses'),(110,1,'mod_choice_delete_choice_responses'),(111,1,'mod_data_get_databases_by_courses'),(112,1,'mod_folder_view_folder'),(113,1,'mod_forum_get_forums_by_courses'),(114,1,'mod_forum_get_forum_discussion_posts'),(115,1,'mod_forum_get_forum_discussions_paginated'),(116,1,'mod_forum_view_forum'),(117,1,'mod_forum_view_forum_discussion'),(118,1,'mod_forum_add_discussion_post'),(119,1,'mod_forum_add_discussion'),(120,1,'mod_forum_can_add_discussion'),(121,1,'mod_glossary_get_glossaries_by_courses'),(122,1,'mod_glossary_view_glossary'),(123,1,'mod_glossary_view_entry'),(124,1,'mod_glossary_get_entries_by_letter'),(125,1,'mod_glossary_get_entries_by_date'),(126,1,'mod_glossary_get_categories'),(127,1,'mod_glossary_get_entries_by_category'),(128,1,'mod_glossary_get_authors'),(129,1,'mod_glossary_get_entries_by_author'),(130,1,'mod_glossary_get_entries_by_author_id'),(131,1,'mod_glossary_get_entries_by_search'),(132,1,'mod_glossary_get_entries_by_term'),(133,1,'mod_glossary_get_entries_to_approve'),(134,1,'mod_glossary_get_entry_by_id'),(135,1,'mod_glossary_add_entry'),(136,1,'mod_imscp_view_imscp'),(137,1,'mod_imscp_get_imscps_by_courses'),(138,1,'mod_lti_get_tool_launch_data'),(139,1,'mod_lti_get_ltis_by_courses'),(140,1,'mod_lti_view_lti'),(141,1,'mod_page_view_page'),(142,1,'mod_quiz_get_quizzes_by_courses'),(143,1,'mod_quiz_view_quiz'),(144,1,'mod_quiz_get_user_attempts'),(145,1,'mod_quiz_get_user_best_grade'),(146,1,'mod_quiz_get_combined_review_options'),(147,1,'mod_quiz_start_attempt'),(148,1,'mod_quiz_get_attempt_data'),(149,1,'mod_quiz_get_attempt_summary'),(150,1,'mod_quiz_save_attempt'),(151,1,'mod_quiz_process_attempt'),(152,1,'mod_quiz_get_attempt_review'),(153,1,'mod_quiz_view_attempt'),(154,1,'mod_quiz_view_attempt_summary'),(155,1,'mod_quiz_view_attempt_review'),(156,1,'mod_quiz_get_quiz_feedback_for_grade'),(157,1,'mod_quiz_get_quiz_access_information'),(158,1,'mod_quiz_get_attempt_access_information'),(159,1,'mod_quiz_get_quiz_required_qtypes'),(160,1,'mod_resource_view_resource'),(161,1,'mod_scorm_view_scorm'),(162,1,'mod_scorm_get_scorm_attempt_count'),(163,1,'mod_scorm_get_scorm_scoes'),(164,1,'mod_scorm_get_scorm_user_data'),(165,1,'mod_scorm_insert_scorm_tracks'),(166,1,'mod_scorm_get_scorm_sco_tracks'),(167,1,'mod_scorm_get_scorms_by_courses'),(168,1,'mod_scorm_launch_sco'),(169,1,'mod_survey_get_surveys_by_courses'),(170,1,'mod_survey_view_survey'),(171,1,'mod_survey_get_questions'),(172,1,'mod_survey_submit_answers'),(173,1,'mod_url_view_url'),(174,1,'mod_wiki_get_wikis_by_courses'),(175,1,'mod_wiki_view_wiki'),(176,1,'mod_wiki_view_page'),(177,1,'mod_wiki_get_subwikis'),(178,1,'mod_wiki_get_subwiki_pages'),(179,1,'mod_wiki_get_subwiki_files'),(180,1,'mod_wiki_get_page_contents'),(181,1,'mod_wiki_get_page_for_editing'),(182,1,'mod_wiki_new_page'),(183,1,'mod_wiki_edit_page'),(184,1,'enrol_guest_get_instance_info'),(185,1,'enrol_self_get_instance_info'),(186,1,'enrol_self_enrol_user'),(187,1,'message_airnotifier_is_system_configured'),(188,1,'message_airnotifier_are_notification_preferences_configured'),(189,1,'message_airnotifier_get_user_devices'),(190,1,'message_airnotifier_enable_device'),(191,1,'message_popup_get_popup_notifications'),(192,1,'message_popup_get_unread_popup_notification_count'),(193,1,'gradereport_overview_get_course_grades'),(194,1,'gradereport_overview_view_grade_report'),(195,1,'gradereport_user_get_grades_table'),(196,1,'gradereport_user_view_grade_report'),(197,1,'gradereport_user_get_grade_items'),(198,1,'tool_lp_data_for_course_competencies_page'),(199,1,'tool_lp_data_for_plans_page'),(200,1,'tool_lp_data_for_plan_page'),(201,1,'tool_lp_data_for_user_evidence_list_page'),(202,1,'tool_lp_data_for_user_evidence_page'),(203,1,'tool_lp_data_for_user_competency_summary'),(204,1,'tool_lp_data_for_user_competency_summary_in_plan'),(205,1,'tool_lp_data_for_user_competency_summary_in_course'),(206,1,'tool_mobile_get_plugins_supporting_mobile'),(207,1,'tool_mobile_get_public_config'),(208,1,'tool_mobile_get_config'),(209,1,'tool_mobile_get_autologin_key');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `privatetoken` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
INSERT INTO `mdl_files` VALUES (1,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','a48e186a2cc853a9e94e9305f4e9bc086391212d',1,'theme_more','backgroundimage',0,'/','background.jpg',2,4451,'image/jpeg',0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(2,'da39a3ee5e6b4b0d3255bfef95601890afd80709','d1da7ab1bb9c08a926037367bf8ce9a838034ead',1,'theme_more','backgroundimage',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(3,'5f8e911d0da441e36f47c5c46f4393269211ca56','508e674d49c30d4fde325fe6c7f6fd3d56b247e1',1,'assignfeedback_editpdf','stamps',0,'/','smile.png',2,1085,'image/png',0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(4,'da39a3ee5e6b4b0d3255bfef95601890afd80709','70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5',1,'assignfeedback_editpdf','stamps',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(5,'75c101cb8cb34ea573cd25ac38f8157b1de901b8','68317eab56c67d32aeaee5acf509a0c4aa828b6b',1,'assignfeedback_editpdf','stamps',0,'/','sad.png',2,966,'image/png',0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(6,'0c5190a24c3943966541401c883eacaa20ca20cb','695a55ff780e61c9e59428aa425430b0d6bde53b',1,'assignfeedback_editpdf','stamps',0,'/','tick.png',2,1039,'image/png',0,NULL,NULL,NULL,1484792666,1484792666,0,NULL),(7,'8c96a486d5801e0f4ab8c411f561f1c687e1f865','373e63af262a9b8466ba8632551520be793c37ff',1,'assignfeedback_editpdf','stamps',0,'/','cross.png',2,861,'image/png',0,NULL,NULL,NULL,1484792666,1484792666,0,NULL);
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'activitynames',1,1,2),(2,'mathjaxloader',1,1,1),(3,'mediaplugin',1,1,3);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  `lockdiscussionafter` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
INSERT INTO `mdl_forum` VALUES (1,1,'news','Site announcements','General news and announcements',0,0,0,0,0,0,1,0,1,0,0,1484874538,0,0,0,0,0,0,0,0),(2,2,'news','Fórum de notícias','Notícias e avisos',0,0,0,0,0,0,1,1,1,0,0,1486953621,0,0,0,0,0,0,0,0),(3,3,'news','Fórum de notícias','Notícias e avisos',0,0,0,0,0,0,1,1,1,0,0,1486953950,0,0,0,0,0,0,0,0),(4,4,'news','Fórum de notícias','Notícias e avisos',0,0,0,0,0,0,1,1,1,0,0,1486954002,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_digests`
--

DROP TABLE IF EXISTS `mdl_forum_digests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of user mail delivery preferences for each forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_digests`
--

LOCK TABLES `mdl_forum_digests` WRITE;
/*!40000 ALTER TABLE `mdl_forum_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_digests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussion_subs`
--

DROP TABLE IF EXISTS `mdl_forum_discussion_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users may choose to subscribe and unsubscribe from specific ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussion_subs`
--

LOCK TABLES `mdl_forum_discussion_subs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (1,'continuous','continuous',1,1,'standard,category,date','','','',''),(2,'dictionary','dictionary',1,1,'standard','','','',''),(3,'encyclopedia','encyclopedia',1,1,'standard,category,date,author','','','',''),(4,'entrylist','entrylist',1,1,'standard,category,date,author','','','',''),(5,'faq','faq',1,1,'standard,category,date,author','','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'standard,category,date,author','','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'standard,category,date','','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories` VALUES (1,1,NULL,1,'/1/','?',13,0,0,1,0,1485310838,1485310838,0),(2,2,NULL,1,'/2/','?',13,0,0,1,0,1486953773,1486953773,0);
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories_history` VALUES (1,1,1,'system',1485310838,4,1,NULL,0,NULL,'?',13,0,0,1,0,0,0),(2,2,1,'system',1485310838,4,1,NULL,1,'/1/','?',13,0,0,1,0,0,0),(3,1,2,'system',1486953773,2,2,NULL,0,NULL,'?',13,0,0,1,0,0,0),(4,2,2,'system',1486953773,2,2,NULL,1,'/2/','?',13,0,0,1,0,0,0);
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
INSERT INTO `mdl_grade_items` VALUES (1,1,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,0.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,NULL,0,0,0,0,0,1485310838,1485310838),(2,2,NULL,NULL,'course',NULL,2,NULL,NULL,NULL,NULL,1,0.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,NULL,0,0,0,0,0,1486953773,1486953773);
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_items_history` VALUES (1,1,1,'system',1485310838,4,1,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,100.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,0,0,1,0,NULL,0),(2,2,1,'aggregation',1485310838,4,1,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,0.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,0,0,1,0,NULL,0),(3,1,2,'system',1486953773,2,2,NULL,NULL,'course',NULL,2,NULL,NULL,NULL,NULL,1,100.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,0,0,1,0,NULL,0),(4,2,2,'aggregation',1486953773,2,2,NULL,NULL,'course',NULL,2,NULL,NULL,NULL,NULL,1,0.00000,0.00000,NULL,NULL,0.00000,1.00000,0.00000,0.00000,0.00000,1,0,0,0,1,0,NULL,0);
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_overrides`
--

DROP TABLE IF EXISTS `mdl_lesson_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to lesson settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_overrides`
--

LOCK TABLES `mdl_lesson_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nc/3.0/',1,2013051500),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lock_db`
--

DROP TABLE IF EXISTS `mdl_lock_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores active and inactive lock types for db locking method.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lock_db`
--

LOCK TABLES `mdl_lock_db` WRITE;
/*!40000 ALTER TABLE `mdl_lock_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lock_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','hide','course','fullname','moodle'),(6,'course','show','course','fullname','moodle'),(7,'course','move','course','fullname','moodle'),(8,'course','enrol','course','fullname','moodle'),(9,'course','unenrol','course','fullname','moodle'),(10,'course','report log','course','fullname','moodle'),(11,'course','report live','course','fullname','moodle'),(12,'course','report outline','course','fullname','moodle'),(13,'course','report participation','course','fullname','moodle'),(14,'course','report stats','course','fullname','moodle'),(15,'category','add','course_categories','name','moodle'),(16,'category','hide','course_categories','name','moodle'),(17,'category','move','course_categories','name','moodle'),(18,'category','show','course_categories','name','moodle'),(19,'category','update','course_categories','name','moodle'),(20,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(21,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(23,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(24,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(25,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(26,'group','view','groups','name','moodle'),(27,'tag','update','tag','name','moodle'),(28,'tag','flag','tag','name','moodle'),(29,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(30,'assign','add','assign','name','mod_assign'),(31,'assign','delete mod','assign','name','mod_assign'),(32,'assign','download all submissions','assign','name','mod_assign'),(33,'assign','grade submission','assign','name','mod_assign'),(34,'assign','lock submission','assign','name','mod_assign'),(35,'assign','reveal identities','assign','name','mod_assign'),(36,'assign','revert submission to draft','assign','name','mod_assign'),(37,'assign','set marking workflow state','assign','name','mod_assign'),(38,'assign','submission statement accepted','assign','name','mod_assign'),(39,'assign','submit','assign','name','mod_assign'),(40,'assign','submit for grading','assign','name','mod_assign'),(41,'assign','unlock submission','assign','name','mod_assign'),(42,'assign','update','assign','name','mod_assign'),(43,'assign','upload','assign','name','mod_assign'),(44,'assign','view','assign','name','mod_assign'),(45,'assign','view all','course','fullname','mod_assign'),(46,'assign','view confirm submit assignment form','assign','name','mod_assign'),(47,'assign','view grading form','assign','name','mod_assign'),(48,'assign','view submission','assign','name','mod_assign'),(49,'assign','view submission grading table','assign','name','mod_assign'),(50,'assign','view submit assignment form','assign','name','mod_assign'),(51,'assign','view feedback','assign','name','mod_assign'),(52,'assign','view batch set marking workflow state','assign','name','mod_assign'),(53,'assignment','view','assignment','name','mod_assignment'),(54,'assignment','add','assignment','name','mod_assignment'),(55,'assignment','update','assignment','name','mod_assignment'),(56,'assignment','view submission','assignment','name','mod_assignment'),(57,'assignment','upload','assignment','name','mod_assignment'),(58,'book','add','book','name','mod_book'),(59,'book','update','book','name','mod_book'),(60,'book','view','book','name','mod_book'),(61,'book','add chapter','book_chapters','title','mod_book'),(62,'book','update chapter','book_chapters','title','mod_book'),(63,'book','view chapter','book_chapters','title','mod_book'),(64,'chat','view','chat','name','mod_chat'),(65,'chat','add','chat','name','mod_chat'),(66,'chat','update','chat','name','mod_chat'),(67,'chat','report','chat','name','mod_chat'),(68,'chat','talk','chat','name','mod_chat'),(69,'choice','view','choice','name','mod_choice'),(70,'choice','update','choice','name','mod_choice'),(71,'choice','add','choice','name','mod_choice'),(72,'choice','report','choice','name','mod_choice'),(73,'choice','choose','choice','name','mod_choice'),(74,'choice','choose again','choice','name','mod_choice'),(75,'data','view','data','name','mod_data'),(76,'data','add','data','name','mod_data'),(77,'data','update','data','name','mod_data'),(78,'data','record delete','data','name','mod_data'),(79,'data','fields add','data_fields','name','mod_data'),(80,'data','fields update','data_fields','name','mod_data'),(81,'data','templates saved','data','name','mod_data'),(82,'data','templates def','data','name','mod_data'),(83,'feedback','startcomplete','feedback','name','mod_feedback'),(84,'feedback','submit','feedback','name','mod_feedback'),(85,'feedback','delete','feedback','name','mod_feedback'),(86,'feedback','view','feedback','name','mod_feedback'),(87,'feedback','view all','course','shortname','mod_feedback'),(88,'folder','view','folder','name','mod_folder'),(89,'folder','view all','folder','name','mod_folder'),(90,'folder','update','folder','name','mod_folder'),(91,'folder','add','folder','name','mod_folder'),(92,'forum','add','forum','name','mod_forum'),(93,'forum','update','forum','name','mod_forum'),(94,'forum','add discussion','forum_discussions','name','mod_forum'),(95,'forum','add post','forum_posts','subject','mod_forum'),(96,'forum','update post','forum_posts','subject','mod_forum'),(97,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(98,'forum','move discussion','forum_discussions','name','mod_forum'),(99,'forum','view subscribers','forum','name','mod_forum'),(100,'forum','view discussion','forum_discussions','name','mod_forum'),(101,'forum','view forum','forum','name','mod_forum'),(102,'forum','subscribe','forum','name','mod_forum'),(103,'forum','unsubscribe','forum','name','mod_forum'),(104,'forum','pin discussion','forum_discussions','name','mod_forum'),(105,'forum','unpin discussion','forum_discussions','name','mod_forum'),(106,'glossary','add','glossary','name','mod_glossary'),(107,'glossary','update','glossary','name','mod_glossary'),(108,'glossary','view','glossary','name','mod_glossary'),(109,'glossary','view all','glossary','name','mod_glossary'),(110,'glossary','add entry','glossary','name','mod_glossary'),(111,'glossary','update entry','glossary','name','mod_glossary'),(112,'glossary','add category','glossary','name','mod_glossary'),(113,'glossary','update category','glossary','name','mod_glossary'),(114,'glossary','delete category','glossary','name','mod_glossary'),(115,'glossary','approve entry','glossary','name','mod_glossary'),(116,'glossary','disapprove entry','glossary','name','mod_glossary'),(117,'glossary','view entry','glossary_entries','concept','mod_glossary'),(118,'imscp','view','imscp','name','mod_imscp'),(119,'imscp','view all','imscp','name','mod_imscp'),(120,'imscp','update','imscp','name','mod_imscp'),(121,'imscp','add','imscp','name','mod_imscp'),(122,'label','add','label','name','mod_label'),(123,'label','update','label','name','mod_label'),(124,'lesson','start','lesson','name','mod_lesson'),(125,'lesson','end','lesson','name','mod_lesson'),(126,'lesson','view','lesson_pages','title','mod_lesson'),(127,'lti','view','lti','name','mod_lti'),(128,'lti','launch','lti','name','mod_lti'),(129,'lti','view all','lti','name','mod_lti'),(130,'page','view','page','name','mod_page'),(131,'page','view all','page','name','mod_page'),(132,'page','update','page','name','mod_page'),(133,'page','add','page','name','mod_page'),(134,'quiz','add','quiz','name','mod_quiz'),(135,'quiz','update','quiz','name','mod_quiz'),(136,'quiz','view','quiz','name','mod_quiz'),(137,'quiz','report','quiz','name','mod_quiz'),(138,'quiz','attempt','quiz','name','mod_quiz'),(139,'quiz','submit','quiz','name','mod_quiz'),(140,'quiz','review','quiz','name','mod_quiz'),(141,'quiz','editquestions','quiz','name','mod_quiz'),(142,'quiz','preview','quiz','name','mod_quiz'),(143,'quiz','start attempt','quiz','name','mod_quiz'),(144,'quiz','close attempt','quiz','name','mod_quiz'),(145,'quiz','continue attempt','quiz','name','mod_quiz'),(146,'quiz','edit override','quiz','name','mod_quiz'),(147,'quiz','delete override','quiz','name','mod_quiz'),(148,'quiz','view summary','quiz','name','mod_quiz'),(149,'resource','view','resource','name','mod_resource'),(150,'resource','view all','resource','name','mod_resource'),(151,'resource','update','resource','name','mod_resource'),(152,'resource','add','resource','name','mod_resource'),(153,'scorm','view','scorm','name','mod_scorm'),(154,'scorm','review','scorm','name','mod_scorm'),(155,'scorm','update','scorm','name','mod_scorm'),(156,'scorm','add','scorm','name','mod_scorm'),(157,'survey','add','survey','name','mod_survey'),(158,'survey','update','survey','name','mod_survey'),(159,'survey','download','survey','name','mod_survey'),(160,'survey','view form','survey','name','mod_survey'),(161,'survey','view graph','survey','name','mod_survey'),(162,'survey','view report','survey','name','mod_survey'),(163,'survey','submit','survey','name','mod_survey'),(164,'url','view','url','name','mod_url'),(165,'url','view all','url','name','mod_url'),(166,'url','update','url','name','mod_url'),(167,'url','add','url','name','mod_url'),(168,'workshop','add','workshop','name','mod_workshop'),(169,'workshop','update','workshop','name','mod_workshop'),(170,'workshop','view','workshop','name','mod_workshop'),(171,'workshop','view all','workshop','name','mod_workshop'),(172,'workshop','add submission','workshop_submissions','title','mod_workshop'),(173,'workshop','update submission','workshop_submissions','title','mod_workshop'),(174,'workshop','view submission','workshop_submissions','title','mod_workshop'),(175,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(176,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(177,'workshop','add example','workshop_submissions','title','mod_workshop'),(178,'workshop','update example','workshop_submissions','title','mod_workshop'),(179,'workshop','view example','workshop_submissions','title','mod_workshop'),(180,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(181,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(182,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(183,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(184,'workshop','update aggregate grades','workshop','name','mod_workshop'),(185,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(186,'workshop','update clear assessments','workshop','name','mod_workshop'),(187,'book','exportimscp','book','name','booktool_exportimscp'),(188,'book','print','book','name','booktool_print'),(189,'book','print chapter','book_chapters','title','booktool_print');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_logstore_standard_log`
--

DROP TABLE IF EXISTS `mdl_logstore_standard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Standard log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

LOCK TABLES `mdl_logstore_standard_log` WRITE;
/*!40000 ALTER TABLE `mdl_logstore_standard_log` DISABLE KEYS */;
INSERT INTO `mdl_logstore_standard_log` VALUES (1,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484792709,'web','179.179.207.42',NULL),(2,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,5,30,2,2,0,2,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1484792904,'web','179.179.207.42',NULL),(3,'\\core\\event\\user_updated','core','updated','user','user',2,'u',0,5,30,2,2,0,2,0,'N;',1484792904,'web','179.179.207.42',NULL),(4,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793127,'web','179.179.207.42',NULL),(5,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793145,'web','179.179.207.42',NULL),(6,'\\tool_usertours\\event\\tour_started','tool_usertours','started','tour','tool_usertours_tours',1,'r',2,2,50,1,2,1,NULL,0,'a:1:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";}',1484793147,'web','179.179.207.42',NULL),(7,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',1,'r',2,2,50,1,2,1,NULL,0,'a:3:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";s:6:\"tourid\";i:1;s:9:\"stepindex\";i:0;}',1484793148,'web','179.179.207.42',NULL),(8,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',2,'r',2,2,50,1,2,1,NULL,0,'a:3:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";s:6:\"tourid\";i:1;s:9:\"stepindex\";i:1;}',1484793151,'web','179.179.207.42',NULL),(9,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',3,'r',2,2,50,1,2,1,NULL,0,'a:3:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";s:6:\"tourid\";i:1;s:9:\"stepindex\";i:2;}',1484793153,'web','179.179.207.42',NULL),(10,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',6,'r',2,2,50,1,2,1,NULL,0,'a:3:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";s:6:\"tourid\";i:1;s:9:\"stepindex\";i:5;}',1484793155,'web','179.179.207.42',NULL),(11,'\\tool_usertours\\event\\tour_ended','tool_usertours','ended','tour','tool_usertours_tours',1,'c',2,2,50,1,2,1,NULL,0,'a:3:{s:7:\"pageurl\";s:39:\"http://50.112.26.194/moodle/?redirect=0\";s:6:\"stepid\";i:6;s:9:\"stepindex\";i:5;}',1484793159,'web','179.179.207.42',NULL),(12,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"urqnlt8slbmkgvdprrfg6b3eo0\";}',1484793211,'web','179.179.207.42',NULL),(13,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484793211,'web','179.179.207.42',NULL),(14,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484793216,'web','179.179.207.42',NULL),(15,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484793220,'web','179.179.207.42',NULL),(16,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484793242,'web','179.179.207.42',NULL),(17,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793244,'web','179.179.207.42',NULL),(18,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793300,'web','179.179.207.42',NULL),(19,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793303,'web','179.179.207.42',NULL),(20,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"rehbbrrgkskun8pk3cruvblbd4\";}',1484793322,'web','179.179.207.42',NULL),(21,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484793322,'web','179.179.207.42',NULL),(22,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484793329,'web','179.179.207.42',NULL),(23,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484793340,'web','179.179.207.42',NULL),(24,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793343,'web','179.179.207.42',NULL),(25,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793394,'web','179.179.207.42',NULL),(26,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,2,0,NULL,0,'N;',1484793522,'web','179.179.207.42',NULL),(27,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793530,'web','179.179.207.42',NULL),(28,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793533,'web','179.179.207.42',NULL),(29,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793537,'web','179.179.207.42',NULL),(30,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793570,'web','179.179.207.42',NULL),(31,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793571,'web','179.179.207.42',NULL),(32,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793574,'web','179.179.207.42',NULL),(33,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484793948,'web','179.179.207.42',NULL),(34,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484793951,'web','179.179.207.42',NULL),(35,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484873447,'web','179.179.207.42',NULL),(36,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484873478,'web','179.179.207.42',NULL),(37,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484873508,'web','179.179.207.42',NULL),(38,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484873509,'web','179.179.207.42',NULL),(39,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"6ajmr5nrbq5l280oaabmf9a797\";}',1484874538,'web','179.179.207.42',NULL),(40,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484874538,'web','179.179.207.42',NULL),(41,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484874544,'web','179.179.207.42',NULL),(42,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484874558,'web','179.179.207.42',NULL),(43,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484874573,'web','179.179.207.42',NULL),(44,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484874574,'web','179.179.207.42',NULL),(45,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484874581,'web','179.179.207.42',NULL),(46,'\\core\\event\\user_updated','core','updated','user','user',2,'u',0,5,30,2,2,0,2,0,'N;',1484874612,'web','179.179.207.42',NULL),(47,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484874663,'web','179.179.207.42',NULL),(48,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,22,30,3,2,0,3,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1484875306,'web','179.179.207.42',NULL),(49,'\\core\\event\\email_failed','core','failed','email',NULL,NULL,'c',0,1,10,0,2,0,3,0,'a:3:{s:7:\"subject\";s:69:\"Instituto Conhecer e Transformar Mestre Guiga: Nova conta de usuário\";s:7:\"message\";s:693:\"Oi Celio Guiga,\n\nUma nova conta foi criada para você em  \'Instituto Conhecer e Transformar Mestre Guiga\'.\n\nOs seus dados atuais para o login são:\nusuário: celio.guiga\nsenha: 36U$4omP;g\n(a primeira vez que você fizer o login será necessário alterar a senha)\n\nPara começar a utilizar o \'Instituto Conhecer e Transformar Mestre Guiga\', faça o login em http://50.112.26.194/moodle/login/\n\nNa maior parte dos programas de email a frase anterior aparece como um link azul que você pode clicar. Se este não é o seu caso, copie o endereço para a barra de endereços do seu navegador.\n\nSaudações do administrador do \'Instituto Conhecer e Transformar Mestre Guiga\',\n\nAdministrador Usuário\";s:9:\"errorinfo\";s:36:\"Could not instantiate mail function.\";}',1484875306,'web','179.179.207.42',NULL),(50,'\\core\\event\\user_created','core','created','user','user',3,'c',0,22,30,3,2,0,3,0,'N;',1484875306,'web','179.179.207.42',NULL),(51,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"505o85cigj4i7sp6bj0k87sug1\";}',1484875497,'web','179.179.207.42',NULL),(52,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875498,'web','179.179.207.42',NULL),(53,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875533,'web','104.209.188.207',NULL),(54,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875536,'web','40.78.146.128',NULL),(55,'\\core\\event\\email_failed','core','failed','email',NULL,NULL,'c',0,1,10,0,2,0,3,0,'a:3:{s:7:\"subject\";s:69:\"Instituto Conhecer e Transformar Mestre Guiga: Password reset request\";s:7:\"message\";s:557:\"Hi Celio,\n\nA password reset was requested for your account \'celio.guiga\' at Instituto Conhecer e Transformar Mestre Guiga.\n\nTo confirm this request, and set a new password for your account, please\ngo to the following web address:\n\nhttp://50.112.26.194/moodle/login/forgot_password.php?token=TyapDvjQ7JHFOuW9ErzKWRs04F15xKWx\n(This link is valid for 30 minutes from the time this reset was first requested)\n\nIf this password reset was not requested by you, no action is needed.\n\nIf you need help, please contact the site administrator,\n\nAdministrador Usuário\";s:9:\"errorinfo\";s:36:\"Could not instantiate mail function.\";}',1484875561,'web','179.179.207.42',NULL),(56,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875580,'web','131.108.26.30',NULL),(57,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875583,'web','179.179.207.42',NULL),(58,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1484875604,'web','179.179.207.42',NULL),(59,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484875606,'web','179.179.207.42',NULL),(60,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875614,'web','131.108.26.30',NULL),(61,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875642,'web','131.108.26.30',NULL),(62,'\\core\\event\\user_deleted','core','deleted','user','user',3,'d',0,22,30,3,2,0,3,0,'a:5:{s:8:\"username\";s:11:\"celio.guiga\";s:5:\"email\";s:22:\"celinhoguiga@gmail.com\";s:8:\"idnumber\";s:0:\"\";s:7:\"picture\";s:1:\"0\";s:10:\"mnethostid\";s:1:\"1\";}',1484875668,'web','179.179.207.42',NULL),(63,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1484875676,'web','131.108.26.30',NULL),(64,'\\core\\event\\user_created','core','created','user','user',4,'c',0,23,30,4,2,0,4,0,'N;',1484875750,'web','179.179.207.42',NULL),(65,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484875778,'web','179.179.207.42',NULL),(66,'\\core\\event\\user_loggedin','core','loggedin','user','user',4,'r',0,1,10,0,4,0,NULL,0,'a:1:{s:8:\"username\";s:11:\"celio.guiga\";}',1484875778,'web','131.108.26.30',NULL),(67,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484875823,'web','179.179.207.42',NULL),(68,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,2,0,4,0,'N;',1484875829,'web','179.179.207.42',NULL),(69,'\\core\\event\\message_sent','core','sent','message',NULL,NULL,'c',0,1,10,0,2,0,4,0,'a:2:{s:9:\"messageid\";i:1;s:8:\"courseid\";i:1;}',1484875837,'web','179.179.207.42',NULL),(70,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484875866,'web','179.179.207.42',NULL),(71,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,23,30,4,4,0,4,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1484875866,'web','131.108.26.30',NULL),(72,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,2,0,4,0,'N;',1484875902,'web','179.179.207.42',NULL),(73,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,2,0,4,0,'N;',1484875919,'web','179.179.207.42',NULL),(74,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1484875945,'web','131.108.26.30',NULL),(75,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1484875985,'web','131.108.26.30',NULL),(76,'\\core\\event\\message_viewed','core','viewed','message','message_read',1,'c',0,23,30,4,4,0,2,0,'a:1:{s:9:\"messageid\";s:1:\"1\";}',1484876016,'web','131.108.26.30',NULL),(77,'\\core\\event\\message_sent','core','sent','message',NULL,NULL,'c',0,1,10,0,4,0,2,0,'a:2:{s:9:\"messageid\";i:2;s:8:\"courseid\";i:1;}',1484876053,'web','131.108.26.30',NULL),(78,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484876061,'web','179.179.207.42',NULL),(79,'\\core\\event\\message_viewed','core','viewed','message','message_read',2,'c',0,5,30,2,2,0,4,0,'a:1:{s:9:\"messageid\";s:1:\"2\";}',1484876075,'web','179.179.207.42',NULL),(80,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484876096,'web','179.179.207.42',NULL),(81,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484877870,'web','187.114.46.69',NULL),(82,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1484877951,'web','187.114.46.69',NULL),(83,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1484879596,'web','187.114.46.69',NULL),(84,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485031548,'web','191.249.49.75',NULL),(85,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485031548,'web','191.249.49.75',NULL),(86,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485031566,'web','191.249.49.75',NULL),(87,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485215941,'web','131.108.26.30',NULL),(88,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485215941,'web','131.108.26.30',NULL),(89,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485215987,'web','131.108.26.30',NULL),(90,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,4,0,NULL,0,'a:2:{s:8:\"username\";s:11:\"celio.guiga\";s:6:\"reason\";i:3;}',1485216042,'web','131.108.26.30',NULL),(91,'\\core\\event\\user_loggedin','core','loggedin','user','user',4,'r',0,1,10,0,4,0,NULL,0,'a:1:{s:8:\"username\";s:11:\"celio.guiga\";}',1485216074,'web','131.108.26.30',NULL),(92,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485216076,'web','131.108.26.30',NULL),(93,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485216119,'web','131.108.26.30',NULL),(94,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485216145,'web','131.108.26.30',NULL),(95,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485216148,'web','131.108.26.30',NULL),(96,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485216155,'web','131.108.26.30',NULL),(97,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485216223,'web','131.108.26.30',NULL),(98,'\\core\\event\\user_loggedout','core','loggedout','user','user',4,'r',0,1,10,0,4,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"ocenjkd61k18a7ep03j7jm5352\";}',1485223165,'web','131.108.26.30',NULL),(99,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485223165,'web','131.108.26.30',NULL),(100,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485301780,'web','131.108.26.30',NULL),(101,'\\core\\event\\user_loggedin','core','loggedin','user','user',4,'r',0,1,10,0,4,0,NULL,0,'a:1:{s:8:\"username\";s:11:\"celio.guiga\";}',1485303697,'web','131.108.26.30',NULL),(102,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485303697,'web','131.108.26.30',NULL),(103,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485306202,'web','131.108.26.30',NULL),(104,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485310800,'web','131.108.26.30',NULL),(105,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485310814,'web','131.108.26.30',NULL),(106,'\\gradereport_overview\\event\\grade_report_viewed','gradereport_overview','viewed','grade_report',NULL,NULL,'r',2,2,50,1,4,1,4,0,'N;',1485310838,'web','131.108.26.30',NULL),(107,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485310846,'web','131.108.26.30',NULL),(108,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485310855,'web','131.108.26.30',NULL),(109,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485310875,'web','131.108.26.30',NULL),(110,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485311009,'web','131.108.26.30',NULL),(111,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485311012,'web','131.108.26.30',NULL),(112,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485311022,'web','131.108.26.30',NULL),(113,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,4,0,NULL,0,'N;',1485311165,'web','131.108.26.30',NULL),(114,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,4,1,NULL,0,'N;',1485311180,'web','131.108.26.30',NULL),(115,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485311582,'web','131.108.26.30',NULL),(116,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485311591,'web','131.108.26.30',NULL),(117,'\\core\\event\\blog_entries_viewed','core','viewed','blog_entries',NULL,NULL,'r',2,1,10,0,4,0,4,0,'a:8:{s:7:\"entryid\";N;s:5:\"tagid\";N;s:6:\"userid\";i:4;s:5:\"modid\";N;s:7:\"groupid\";N;s:6:\"search\";N;s:9:\"fromstart\";i:0;s:8:\"courseid\";i:0;}',1485311632,'web','131.108.26.30',NULL),(118,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485311637,'web','131.108.26.30',NULL),(119,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485311639,'web','131.108.26.30',NULL),(120,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485311656,'web','131.108.26.30',NULL),(121,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,23,30,4,4,0,4,0,'N;',1485311674,'web','131.108.26.30',NULL),(122,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485311680,'web','131.108.26.30',NULL),(123,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485314739,'web','131.108.26.30',NULL),(124,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485314750,'web','131.108.26.30',NULL),(125,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',4,'r',0,23,30,4,4,0,4,0,'N;',1485314753,'web','131.108.26.30',NULL),(126,'\\core\\event\\user_loggedout','core','loggedout','user','user',4,'r',0,1,10,0,4,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"226jedk6bf070nt0iirrbq0je6\";}',1485314780,'web','131.108.26.30',NULL),(127,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485314781,'web','131.108.26.30',NULL),(128,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485357873,'web','177.43.114.204',NULL),(129,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,2,0,NULL,0,'a:2:{s:8:\"username\";s:5:\"admin\";s:6:\"reason\";i:3;}',1485358043,'web','177.43.114.204',NULL),(130,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1485358053,'web','177.43.114.204',NULL),(131,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1485358054,'web','177.43.114.204',NULL),(132,'\\core\\event\\user_updated','core','updated','user','user',4,'u',0,23,30,4,2,0,4,0,'N;',1485358127,'web','177.43.114.204',NULL),(133,'\\core\\event\\user_deleted','core','deleted','user','user',4,'d',0,23,30,4,2,0,4,0,'a:5:{s:8:\"username\";s:11:\"celio.guiga\";s:5:\"email\";s:22:\"celinhoguiga@gmail.com\";s:8:\"idnumber\";s:0:\"\";s:7:\"picture\";s:1:\"0\";s:10:\"mnethostid\";s:1:\"1\";}',1485358137,'web','177.43.114.204',NULL),(134,'\\core\\event\\user_created','core','created','user','user',5,'c',0,31,30,5,2,0,5,0,'N;',1485358246,'web','177.43.114.204',NULL),(135,'\\core\\event\\user_profile_viewed','core','viewed','user_profile','user',5,'r',0,31,30,5,2,0,5,0,'N;',1485358400,'web','177.43.114.204',NULL),(136,'\\core\\event\\message_contact_added','core','added','message_contact','message_contacts',1,'c',0,5,30,2,2,0,5,0,'N;',1485358424,'web','177.43.114.204',NULL),(137,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485358670,'web','131.108.26.30',NULL),(138,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,5,0,NULL,0,'a:2:{s:8:\"username\";s:11:\"celio.guiga\";s:6:\"reason\";i:3;}',1485358824,'web','131.108.26.30',NULL),(139,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,5,0,NULL,0,'a:2:{s:8:\"username\";s:11:\"celio.guiga\";s:6:\"reason\";i:3;}',1485358854,'web','131.108.26.30',NULL),(140,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,5,0,NULL,0,'a:2:{s:8:\"username\";s:11:\"celio.guiga\";s:6:\"reason\";i:3;}',1485359059,'web','131.108.26.30',NULL),(141,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,5,0,NULL,0,'a:2:{s:8:\"username\";s:11:\"celio.guiga\";s:6:\"reason\";i:3;}',1485359248,'web','131.108.26.30',NULL),(142,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,31,30,5,2,0,5,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1485361485,'web','177.43.114.204',NULL),(143,'\\core\\event\\user_updated','core','updated','user','user',5,'u',0,31,30,5,2,0,5,0,'N;',1485361485,'web','177.43.114.204',NULL),(144,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485363385,'web','131.108.26.30',NULL),(145,'\\core\\event\\user_loggedin','core','loggedin','user','user',5,'r',0,1,10,0,5,0,NULL,0,'a:1:{s:8:\"username\";s:11:\"celio.guiga\";}',1485363413,'web','131.108.26.30',NULL),(146,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,31,30,5,5,0,5,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1485363574,'web','131.108.26.30',NULL),(147,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,31,30,5,5,0,5,0,'N;',1485363579,'web','131.108.26.30',NULL),(148,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485396969,'web','200.141.139.74',NULL),(149,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1485396992,'web','200.141.139.74',NULL),(150,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1485396997,'web','200.141.139.74',NULL),(151,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1485396999,'web','200.141.139.74',NULL),(152,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1485397027,'web','200.141.139.74',NULL),(153,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1485397034,'web','200.141.139.74',NULL),(154,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,2,0,NULL,0,'a:2:{s:8:\"username\";s:5:\"admin\";s:6:\"reason\";i:3;}',1485530677,'web','177.43.114.204',NULL),(155,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1485530685,'web','177.43.114.204',NULL),(156,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485990418,'web','131.108.25.146',NULL),(157,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1485994771,'web','131.108.25.146',NULL),(158,'\\core\\event\\user_loggedin','core','loggedin','user','user',5,'r',0,1,10,0,5,0,NULL,0,'a:1:{s:8:\"username\";s:11:\"celio.guiga\";}',1485994820,'web','131.108.25.146',NULL),(159,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,31,30,5,5,0,5,0,'N;',1485994822,'web','131.108.25.146',NULL),(160,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,31,30,5,5,0,5,0,'N;',1485997885,'web','131.108.25.146',NULL),(161,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486078005,'web','131.108.25.128',NULL),(162,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486260220,'web','200.141.37.229',NULL),(163,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1486260266,'web','200.141.37.229',NULL),(164,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486260267,'web','200.141.37.229',NULL),(165,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486260320,'web','200.141.37.229',NULL),(166,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486263921,'web','200.141.37.229',NULL),(167,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486305275,'web','200.141.37.229',NULL),(168,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1486305295,'web','200.141.37.229',NULL),(169,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486305296,'web','200.141.37.229',NULL),(170,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486305875,'web','200.141.37.229',NULL),(171,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486333278,'web','200.141.37.229',NULL),(172,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486666573,'web','177.43.114.204',NULL),(173,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486666587,'web','177.43.114.204',NULL),(174,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1486666604,'web','177.43.114.204',NULL),(175,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486666604,'web','177.43.114.204',NULL),(176,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486666612,'web','177.43.114.204',NULL),(177,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486666628,'web','177.43.114.204',NULL),(178,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,0,0,NULL,0,'N;',1486666640,'web','177.43.114.204',NULL),(179,'\\core\\event\\user_loggedin','core','loggedin','user','user',1,'r',0,1,10,0,1,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"guest\";}',1486666649,'web','177.43.114.204',NULL),(180,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,1,0,NULL,0,'N;',1486666650,'web','177.43.114.204',NULL),(181,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,1,1,NULL,0,'N;',1486666653,'web','177.43.114.204',NULL),(182,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,1,0,NULL,0,'N;',1486666654,'web','177.43.114.204',NULL),(183,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486666675,'web','177.43.114.204',NULL),(184,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,1,1,NULL,0,'N;',1486666680,'web','177.43.114.204',NULL),(185,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,1,0,NULL,0,'N;',1486666681,'web','177.43.114.204',NULL),(186,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,1,0,NULL,0,'N;',1486666683,'web','177.43.114.204',NULL),(187,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,1,1,NULL,0,'N;',1486666733,'web','177.43.114.204',NULL),(188,'\\core\\event\\user_created','core','created','user','user',6,'c',0,39,30,6,2,0,6,0,'N;',1486666738,'web','177.43.114.204',NULL),(189,'\\core\\event\\user_loggedin','core','loggedin','user','user',6,'r',0,1,10,0,6,0,NULL,0,'a:1:{s:8:\"username\";s:10:\"visitante1\";}',1486666758,'web','177.43.114.204',NULL),(190,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,6,0,NULL,0,'N;',1486666759,'web','177.43.114.204',NULL),(191,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,6,1,NULL,0,'N;',1486666763,'web','177.43.114.204',NULL),(192,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,39,30,6,6,0,6,0,'N;',1486666773,'web','177.43.114.204',NULL),(193,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1486666776,'web','177.43.114.204',NULL),(194,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,39,30,6,6,0,6,0,'N;',1486666778,'web','177.43.114.204',NULL),(195,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,39,30,6,6,0,6,0,'N;',1486666785,'web','177.43.114.204',NULL),(196,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,39,30,6,6,0,6,0,'N;',1486666789,'web','177.43.114.204',NULL),(197,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,39,30,6,6,0,6,0,'N;',1486666793,'web','177.43.114.204',NULL),(198,'\\gradereport_overview\\event\\grade_report_viewed','gradereport_overview','viewed','grade_report',NULL,NULL,'r',2,2,50,1,6,1,6,0,'N;',1486666800,'web','177.43.114.204',NULL),(199,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,2,0,NULL,0,'N;',1486666818,'web','177.43.114.204',NULL),(200,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486951730,'web','200.149.71.221',NULL),(201,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1486953251,'web','200.149.71.221',NULL),(202,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486953252,'web','200.149.71.221',NULL),(203,'\\core\\event\\course_category_created','core','created','course_category','course_categories',2,'c',0,47,40,2,2,0,NULL,0,'N;',1486953375,'web','200.149.71.221',NULL),(204,'\\core\\event\\course_created','core','created','course','course',2,'c',1,48,50,2,2,2,NULL,0,'a:2:{s:9:\"shortname\";s:3:\"cdt\";s:8:\"fullname\";s:14:\"curso de teste\";}',1486953621,'web','200.149.71.221',NULL),(205,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',1,'c',0,48,50,2,2,2,NULL,0,'a:1:{s:5:\"enrol\";s:6:\"manual\";}',1486953621,'web','200.149.71.221',NULL),(206,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',2,'c',0,48,50,2,2,2,NULL,0,'a:1:{s:5:\"enrol\";s:5:\"guest\";}',1486953621,'web','200.149.71.221',NULL),(207,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',3,'c',0,48,50,2,2,2,NULL,0,'a:1:{s:5:\"enrol\";s:4:\"self\";}',1486953621,'web','200.149.71.221',NULL),(208,'\\core\\event\\tag_created','core','created','tag','tag',1,'c',0,1,10,0,2,0,2,0,'a:2:{s:4:\"name\";s:13:\"tags blablabl\";s:7:\"rawname\";s:13:\"tags blablabl\";}',1486953621,'web','200.149.71.221',NULL),(209,'\\core\\event\\tag_added','core','added','tag','tag_instance',1,'c',0,48,50,2,2,2,NULL,0,'a:5:{s:5:\"tagid\";i:1;s:7:\"tagname\";s:13:\"tags blablabl\";s:10:\"tagrawname\";s:13:\"tags blablabl\";s:6:\"itemid\";s:1:\"2\";s:8:\"itemtype\";s:6:\"course\";}',1486953621,'web','200.149.71.221',NULL),(210,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,48,50,2,2,2,NULL,0,'N;',1486953708,'web','200.149.71.221',NULL),(211,'\\tool_usertours\\event\\tour_started','tool_usertours','started','tour','tool_usertours_tours',2,'r',2,48,50,2,2,2,NULL,0,'a:1:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";}',1486953712,'web','200.149.71.221',NULL),(212,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',7,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:0;}',1486953714,'web','200.149.71.221',NULL),(213,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',8,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:1;}',1486953720,'web','200.149.71.221',NULL),(214,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',9,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:2;}',1486953722,'web','200.149.71.221',NULL),(215,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',11,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:4;}',1486953726,'web','200.149.71.221',NULL),(216,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',12,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:5;}',1486953730,'web','200.149.71.221',NULL),(217,'\\tool_usertours\\event\\step_shown','tool_usertours','shown','step','tool_usertours_steps',14,'r',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"tourid\";i:2;s:9:\"stepindex\";i:7;}',1486953735,'web','200.149.71.221',NULL),(218,'\\tool_usertours\\event\\tour_ended','tool_usertours','ended','tour','tool_usertours_tours',2,'c',2,48,50,2,2,2,NULL,0,'a:3:{s:7:\"pageurl\";s:48:\"http://50.112.26.194/moodle/course/view.php?id=2\";s:6:\"stepid\";i:14;s:9:\"stepindex\";i:7;}',1486953740,'web','200.149.71.221',NULL),(219,'\\mod_forum\\event\\course_module_viewed','mod_forum','viewed','course_module','forum',2,'r',2,49,70,2,2,2,NULL,0,'N;',1486953747,'web','200.149.71.221',NULL),(220,'\\mod_forum\\event\\course_module_viewed','mod_forum','viewed','course_module','forum',2,'r',2,49,70,2,2,2,NULL,0,'N;',1486953763,'web','200.149.71.221',NULL),(221,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,48,50,2,2,2,NULL,0,'N;',1486953770,'web','200.149.71.221',NULL),(222,'\\gradereport_grader\\event\\grade_report_viewed','gradereport_grader','viewed','grade_report',NULL,NULL,'r',1,48,50,2,2,2,NULL,0,'N;',1486953773,'web','200.149.71.221',NULL),(223,'\\core\\event\\user_list_viewed','core','viewed','user_list','course',2,'r',0,48,50,2,2,2,NULL,0,'a:2:{s:15:\"courseshortname\";s:3:\"cdt\";s:14:\"coursefullname\";s:14:\"curso de teste\";}',1486953785,'web','200.149.71.221',NULL),(224,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,48,50,2,2,2,NULL,0,'N;',1486953790,'web','200.149.71.221',NULL),(225,'\\core\\event\\user_list_viewed','core','viewed','user_list','course',2,'r',0,48,50,2,2,2,NULL,0,'a:2:{s:15:\"courseshortname\";s:3:\"cdt\";s:14:\"coursefullname\";s:14:\"curso de teste\";}',1486953818,'web','200.149.71.221',NULL),(226,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,48,50,2,2,2,NULL,0,'N;',1486953830,'web','200.149.71.221',NULL),(227,'\\core\\event\\course_created','core','created','course','course',3,'c',1,50,50,3,2,3,NULL,0,'a:2:{s:9:\"shortname\";s:4:\"cst2\";s:8:\"fullname\";s:8:\"curso 01\";}',1486953950,'web','200.149.71.221',NULL),(228,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',4,'c',0,50,50,3,2,3,NULL,0,'a:1:{s:5:\"enrol\";s:6:\"manual\";}',1486953950,'web','200.149.71.221',NULL),(229,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',5,'c',0,50,50,3,2,3,NULL,0,'a:1:{s:5:\"enrol\";s:5:\"guest\";}',1486953950,'web','200.149.71.221',NULL),(230,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',6,'c',0,50,50,3,2,3,NULL,0,'a:1:{s:5:\"enrol\";s:4:\"self\";}',1486953950,'web','200.149.71.221',NULL),(231,'\\core\\event\\course_created','core','created','course','course',4,'c',1,51,50,4,2,4,NULL,0,'a:2:{s:9:\"shortname\";s:4:\"cdml\";s:8:\"fullname\";s:19:\"curso da miscelanea\";}',1486954002,'web','200.149.71.221',NULL),(232,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',7,'c',0,51,50,4,2,4,NULL,0,'a:1:{s:5:\"enrol\";s:6:\"manual\";}',1486954002,'web','200.149.71.221',NULL),(233,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',8,'c',0,51,50,4,2,4,NULL,0,'a:1:{s:5:\"enrol\";s:5:\"guest\";}',1486954002,'web','200.149.71.221',NULL),(234,'\\core\\event\\enrol_instance_created','core','created','enrol_instance','enrol',9,'c',0,51,50,4,2,4,NULL,0,'a:1:{s:5:\"enrol\";s:4:\"self\";}',1486954002,'web','200.149.71.221',NULL),(235,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486954021,'web','200.149.71.221',NULL),(236,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1486954030,'web','200.149.71.221',NULL),(237,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1486954184,'web','200.149.71.221',NULL),(238,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1486954190,'web','200.149.71.221',NULL),(239,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"gr508pppdkp0bu9j7pp14uf1c1\";}',1486959902,'web','200.149.71.221',NULL),(240,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1486993279,'web','191.212.76.217',NULL),(241,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,0,0,NULL,0,'N;',1486993297,'web','191.212.76.217',NULL),(242,'\\core\\event\\course_category_viewed','core','viewed','course_category','course_categories',1,'r',0,3,40,1,0,0,NULL,0,'N;',1486993303,'web','191.212.76.217',NULL),(243,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1487039113,'web','200.149.71.221',NULL),(244,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487039115,'web','200.149.71.221',NULL),(245,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487039135,'web','200.149.71.221',NULL),(246,'\\core\\event\\user_loggedout','core','loggedout','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:9:\"sessionid\";s:26:\"dtfdfiehocoe91md6q5cfcv4h6\";}',1487039150,'web','200.149.71.221',NULL),(247,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487039150,'web','200.149.71.221',NULL),(248,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487114274,'web','186.248.79.125',NULL),(249,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1487114287,'web','186.248.79.125',NULL),(250,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487114288,'web','186.248.79.125',NULL),(251,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1487114312,'web','186.248.79.125',NULL),(252,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487114495,'web','186.248.79.125',NULL),(253,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487258613,'web','177.43.114.204',NULL),(254,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487258618,'web','177.43.114.204',NULL),(255,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487258662,'web','177.43.114.204',NULL),(256,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1487541952,'web','187.59.181.127',NULL),(257,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1487542301,'web','187.59.181.127',NULL),(258,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487542302,'web','187.59.181.127',NULL),(259,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487542376,'web','187.59.181.127',NULL),(260,'\\core\\event\\calendar_event_created','core','created','calendar_event','event',1,'c',0,5,30,2,2,0,2,0,'a:3:{s:8:\"repeatid\";i:0;s:9:\"timestart\";i:1487542200;s:4:\"name\";s:17:\"evento do usuario\";}',1487542580,'web','187.59.181.127',NULL),(261,'\\core\\event\\calendar_event_created','core','created','calendar_event','event',2,'c',0,2,50,1,2,1,NULL,0,'a:3:{s:8:\"repeatid\";i:0;s:9:\"timestart\";i:1487628900;s:4:\"name\";s:14:\"evento do site\";}',1487542671,'web','187.59.181.127',NULL),(262,'\\core\\event\\calendar_event_created','core','created','calendar_event','event',3,'c',0,5,30,2,2,0,2,0,'a:3:{s:8:\"repeatid\";i:0;s:9:\"timestart\";i:1488164400;s:4:\"name\";s:8:\"asdasdas\";}',1487542776,'web','187.59.181.127',NULL),(263,'\\core\\event\\calendar_event_created','core','created','calendar_event','event',4,'c',0,2,50,1,2,1,NULL,0,'a:3:{s:8:\"repeatid\";i:0;s:9:\"timestart\";i:1487542500;s:4:\"name\";s:6:\"asdasd\";}',1487542832,'web','187.59.181.127',NULL),(264,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1487542865,'web','187.59.181.127',NULL),(265,'\\core\\event\\dashboard_viewed','core','viewed','dashboard',NULL,NULL,'r',0,5,30,2,2,0,2,0,'N;',1487542871,'web','187.59.181.127',NULL);
/*!40000 ALTER TABLE `mdl_logstore_standard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_proxies`
--

DROP TABLE IF EXISTS `mdl_lti_tool_proxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `serviceoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool proxy registrations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_proxies`
--

LOCK TABLES `mdl_lti_tool_proxies` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_settings`
--

DROP TABLE IF EXISTS `mdl_lti_tool_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool setting values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_settings`
--

LOCK TABLES `mdl_lti_tool_settings` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext COLLATE utf8_unicode_ci,
  `parameter` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eventtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridto`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

DROP TABLE IF EXISTS `mdl_message_airnotifier_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store information about the devices registered in Airnotifie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_airnotifier_devices`
--

LOCK TABLES `mdl_message_airnotifier_devices` WRITE;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
INSERT INTO `mdl_message_contacts` VALUES (1,2,5,0);
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_popup`
--

DROP TABLE IF EXISTS `mdl_message_popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_popup` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` bigint(10) NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messpopu_mesisr_uix` (`messageid`,`isread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keep state of notifications for the popup message processor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_popup`
--

LOCK TABLES `mdl_message_popup` WRITE;
/*!40000 ALTER TABLE `mdl_message_popup` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_popup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'airnotifier',0),(2,'email',1),(3,'jabber',1),(4,'popup',1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'badgerecipientnotice','moodle','moodle/badges:earnbadge'),(10,'badgecreatornotice','moodle',NULL),(11,'competencyplancomment','moodle',NULL),(12,'competencyusercompcomment','moodle',NULL),(13,'assign_notification','mod_assign',NULL),(14,'assignment_updates','mod_assignment',NULL),(15,'submission','mod_feedback',NULL),(16,'message','mod_feedback',NULL),(17,'posts','mod_forum',NULL),(18,'digests','mod_forum',NULL),(19,'graded_essay','mod_lesson',NULL),(20,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(21,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(22,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(23,'flatfile_enrolment','enrol_flatfile',NULL),(24,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(25,'expiry_notification','enrol_manual',NULL),(26,'paypal_enrolment','enrol_paypal',NULL),(27,'expiry_notification','enrol_self',NULL),(28,'invalidrecipienthandler','tool_messageinbound',NULL),(29,'messageprocessingerror','tool_messageinbound',NULL),(30,'messageprocessingsuccess','tool_messageinbound',NULL),(31,'notification','tool_monitor','tool/monitor:subscribe');
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eventtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridto`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
INSERT INTO `mdl_message_read` VALUES (1,2,4,'Nova mensagem de Renato Neto','olá\n\n---------------------------------------------------------------------\nEste e-mail é a cópia de uma mensagem que foi enviada para você em \"ICTMG\". Clique http://50.112.26.194/moodle/message/index.php?user=4&id=2 para responder.',0,'','olá',0,NULL,NULL,1484875837,1484876015,0,0,'moodle','instantmessage'),(2,4,2,'Nova mensagem de Celio Guiga','fala aí meu...\n\n---------------------------------------------------------------------\nEste e-mail é a cópia de uma mensagem que foi enviada para você em \"ICTMG\". Clique http://50.112.26.194/moodle/message/index.php?user=2&id=4 para responder.',0,'','fala aí meu...',0,NULL,NULL,1484876053,1484876075,0,0,'moodle','instantmessage');
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

DROP TABLE IF EXISTS `mdl_messageinbound_datakeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message data item secret keys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_datakeys`
--

LOCK TABLES `mdl_messageinbound_datakeys` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_handlers`
--

DROP TABLE IF EXISTS `mdl_messageinbound_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message Handler definitions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

LOCK TABLES `mdl_messageinbound_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` DISABLE KEYS */;
INSERT INTO `mdl_messageinbound_handlers` VALUES (1,'core','\\core\\message\\inbound\\private_files_handler',0,1,0),(2,'mod_forum','\\mod_forum\\message\\inbound\\reply_handler',604800,1,0),(3,'tool_messageinbound','\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler',604800,0,1);
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

DROP TABLE IF EXISTS `mdl_messageinbound_messagelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of message IDs for existing replies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_messagelist`
--

LOCK TABLES `mdl_messageinbound_messagelist` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://50.112.26.194/moodle','172.31.1.39','','',0,0,0,0,0,0,NULL,1,0),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1,0);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"User Agent string.\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:11:\"false|array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:75:\"Assoc array of courses following the structure of mnetservice_enrol_courses\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:43:\"user details {@see mnet_fields_to_import()}\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"of our local course\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:12:\"string|array\";s:11:\"description\";s:58:\"comma separated list of role shortnames (or array of them)\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',60,0,'',1),(2,'assignment',60,0,'',0),(3,'book',0,0,'',1),(4,'chat',300,0,'',1),(5,'choice',0,0,'',1),(6,'data',0,0,'',1),(7,'feedback',0,0,'',1),(8,'folder',0,0,'',1),(9,'forum',0,0,'',1),(10,'glossary',0,0,'',1),(11,'imscp',0,0,'',1),(12,'label',0,0,'',1),(13,'lesson',0,0,'',1),(14,'lti',0,0,'',1),(15,'page',0,0,'',1),(16,'quiz',60,0,'',1),(17,'resource',0,0,'',1),(18,'scorm',300,0,'',1),(19,'survey',0,0,'',1),(20,'url',0,0,'',1),(21,'wiki',0,0,'',1),(22,'workshop',60,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0),(3,2,'__default',1,0),(4,4,'__default',0,0),(6,5,'__default',0,0),(7,5,'__default',1,0),(8,6,'__default',1,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext`
--

LOCK TABLES `mdl_qtype_ddimageortext` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Images to drag. Actual file names are not stored here we use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drags`
--

LOCK TABLES `mdl_qtype_ddimageortext_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Drop boxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drops`
--

LOCK TABLES `mdl_qtype_ddimageortext_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker`
--

LOCK TABLES `mdl_qtype_ddmarker` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Labels for markers to drag.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drags`
--

LOCK TABLES `mdl_qtype_ddmarker_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='drop regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drops`
--

LOCK TABLES `mdl_qtype_ddmarker_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_options`
--

LOCK TABLES `mdl_qtype_match_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

LOCK TABLES `mdl_qtype_match_subquestions` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

DROP TABLE IF EXISTS `mdl_qtype_multichoice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

LOCK TABLES `mdl_qtype_multichoice_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

DROP TABLE IF EXISTS `mdl_qtype_randomsamatch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_randomsamatch_options`
--

LOCK TABLES `mdl_qtype_randomsamatch_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_shortanswer_options`
--

LOCK TABLES `mdl_qtype_shortanswer_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quescate_consta_uix` (`contextid`,`stamp`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_ddwtos`
--

DROP TABLE IF EXISTS `mdl_question_ddwtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (words into sentences) questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_ddwtos`
--

LOCK TABLES `mdl_question_ddwtos` WRITE;
/*!40000 ALTER TABLE `mdl_question_ddwtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_ddwtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_gapselect`
--

DROP TABLE IF EXISTS `mdl_question_gapselect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines select missing words questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_gapselect`
--

LOCK TABLES `mdl_question_gapselect` WRITE;
/*!40000 ALTER TABLE `mdl_question_gapselect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_gapselect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_analysis`
--

DROP TABLE IF EXISTS `mdl_question_response_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Analysis of student responses given to questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_analysis`
--

LOCK TABLES `mdl_question_response_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_count`
--

DROP TABLE IF EXISTS `mdl_question_response_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Count for each responses for each try at a question.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_count`
--

LOCK TABLES `mdl_question_response_count` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_statistics`
--

DROP TABLE IF EXISTS `mdl_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Statistics for individual questions used in an activity.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_statistics`
--

LOCK TABLES `mdl_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timemodifiedoffline` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'grading',6000,'mod/quiz:grade'),(2,'overview',10000,NULL),(3,'responses',9000,NULL),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_sections`
--

DROP TABLE IF EXISTS `mdl_quiz_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores sections of a quiz with section name (heading), from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_sections`
--

LOCK TABLES `mdl_quiz_sections` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_slots`
--

DROP TABLE IF EXISTS `mdl_quiz_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the question used in a quiz, with the order, and for ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_slots`
--

LOCK TABLES `mdl_quiz_slots` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'areafiles',1,1),(2,'local',1,2),(3,'recent',1,3),(4,'upload',1,4),(5,'url',1,5),(6,'user',1,6),(7,'wikimedia',1,7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1484792661,1484792661,0),(2,'',2,0,1,NULL,NULL,1484792662,1484792662,0),(3,'',3,0,1,NULL,NULL,1484792662,1484792662,0),(4,'',4,0,1,NULL,NULL,1484792662,1484792662,0),(5,'',5,0,1,NULL,NULL,1484792662,1484792662,0),(6,'',6,0,1,NULL,NULL,1484792662,1484792662,0),(7,'',7,0,1,NULL,NULL,1484792662,1484792662,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'','manager','',1,'manager'),(2,'','coursecreator','',2,'coursecreator'),(3,'','editingteacher','',3,'editingteacher'),(4,'','teacher','',4,'teacher'),(5,'','student','',5,'student'),(6,'','guest','',6,'guest'),(7,'','user','',7,'user'),(8,'','frontpage','',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:configview',1,1484792638,0),(2,1,2,'moodle/site:configview',1,1484792638,0),(3,1,1,'moodle/site:readallmessages',1,1484792638,0),(4,1,3,'moodle/site:readallmessages',1,1484792638,0),(5,1,1,'moodle/site:manageallmessaging',1,1484792638,0),(6,1,1,'moodle/site:deleteanymessage',1,1484792638,0),(7,1,1,'moodle/site:sendmessage',1,1484792638,0),(8,1,7,'moodle/site:sendmessage',1,1484792638,0),(9,1,7,'moodle/site:deleteownmessage',1,1484792638,0),(10,1,1,'moodle/site:approvecourse',1,1484792638,0),(11,1,3,'moodle/backup:backupcourse',1,1484792638,0),(12,1,1,'moodle/backup:backupcourse',1,1484792638,0),(13,1,3,'moodle/backup:backupsection',1,1484792638,0),(14,1,1,'moodle/backup:backupsection',1,1484792638,0),(15,1,3,'moodle/backup:backupactivity',1,1484792638,0),(16,1,1,'moodle/backup:backupactivity',1,1484792638,0),(17,1,3,'moodle/backup:backuptargethub',1,1484792638,0),(18,1,1,'moodle/backup:backuptargethub',1,1484792638,0),(19,1,3,'moodle/backup:backuptargetimport',1,1484792638,0),(20,1,1,'moodle/backup:backuptargetimport',1,1484792638,0),(21,1,3,'moodle/backup:downloadfile',1,1484792638,0),(22,1,1,'moodle/backup:downloadfile',1,1484792638,0),(23,1,3,'moodle/backup:configure',1,1484792638,0),(24,1,1,'moodle/backup:configure',1,1484792638,0),(25,1,1,'moodle/backup:userinfo',1,1484792638,0),(26,1,1,'moodle/backup:anonymise',1,1484792638,0),(27,1,3,'moodle/restore:restorecourse',1,1484792638,0),(28,1,1,'moodle/restore:restorecourse',1,1484792638,0),(29,1,3,'moodle/restore:restoresection',1,1484792638,0),(30,1,1,'moodle/restore:restoresection',1,1484792638,0),(31,1,3,'moodle/restore:restoreactivity',1,1484792638,0),(32,1,1,'moodle/restore:restoreactivity',1,1484792638,0),(33,1,3,'moodle/restore:restoretargethub',1,1484792638,0),(34,1,1,'moodle/restore:restoretargethub',1,1484792638,0),(35,1,3,'moodle/restore:restoretargetimport',1,1484792638,0),(36,1,1,'moodle/restore:restoretargetimport',1,1484792638,0),(37,1,3,'moodle/restore:uploadfile',1,1484792638,0),(38,1,1,'moodle/restore:uploadfile',1,1484792638,0),(39,1,3,'moodle/restore:configure',1,1484792638,0),(40,1,1,'moodle/restore:configure',1,1484792638,0),(41,1,2,'moodle/restore:rolldates',1,1484792638,0),(42,1,1,'moodle/restore:rolldates',1,1484792638,0),(43,1,1,'moodle/restore:userinfo',1,1484792638,0),(44,1,1,'moodle/restore:createuser',1,1484792638,0),(45,1,3,'moodle/site:manageblocks',1,1484792638,0),(46,1,1,'moodle/site:manageblocks',1,1484792638,0),(47,1,3,'moodle/site:accessallgroups',1,1484792638,0),(48,1,1,'moodle/site:accessallgroups',1,1484792638,0),(49,1,4,'moodle/site:viewfullnames',1,1484792638,0),(50,1,3,'moodle/site:viewfullnames',1,1484792638,0),(51,1,1,'moodle/site:viewfullnames',1,1484792638,0),(52,1,4,'moodle/site:viewuseridentity',1,1484792638,0),(53,1,3,'moodle/site:viewuseridentity',1,1484792638,0),(54,1,1,'moodle/site:viewuseridentity',1,1484792638,0),(55,1,4,'moodle/site:viewreports',1,1484792638,0),(56,1,3,'moodle/site:viewreports',1,1484792638,0),(57,1,1,'moodle/site:viewreports',1,1484792638,0),(58,1,3,'moodle/site:trustcontent',1,1484792638,0),(59,1,1,'moodle/site:trustcontent',1,1484792638,0),(60,1,1,'moodle/site:uploadusers',1,1484792638,0),(61,1,3,'moodle/filter:manage',1,1484792638,0),(62,1,1,'moodle/filter:manage',1,1484792638,0),(63,1,1,'moodle/user:create',1,1484792638,0),(64,1,1,'moodle/user:delete',1,1484792638,0),(65,1,1,'moodle/user:update',1,1484792638,0),(66,1,6,'moodle/user:viewdetails',1,1484792638,0),(67,1,5,'moodle/user:viewdetails',1,1484792638,0),(68,1,4,'moodle/user:viewdetails',1,1484792638,0),(69,1,3,'moodle/user:viewdetails',1,1484792638,0),(70,1,1,'moodle/user:viewdetails',1,1484792638,0),(71,1,1,'moodle/user:viewalldetails',1,1484792638,0),(72,1,1,'moodle/user:viewlastip',1,1484792638,0),(73,1,4,'moodle/user:viewhiddendetails',1,1484792638,0),(74,1,3,'moodle/user:viewhiddendetails',1,1484792638,0),(75,1,1,'moodle/user:viewhiddendetails',1,1484792638,0),(76,1,1,'moodle/user:loginas',1,1484792638,0),(77,1,1,'moodle/user:managesyspages',1,1484792638,0),(78,1,7,'moodle/user:manageownblocks',1,1484792638,0),(79,1,7,'moodle/user:manageownfiles',1,1484792638,0),(80,1,1,'moodle/my:configsyspages',1,1484792638,0),(81,1,3,'moodle/role:assign',1,1484792638,0),(82,1,1,'moodle/role:assign',1,1484792638,0),(83,1,4,'moodle/role:review',1,1484792638,0),(84,1,3,'moodle/role:review',1,1484792638,0),(85,1,1,'moodle/role:review',1,1484792638,0),(86,1,1,'moodle/role:override',1,1484792638,0),(87,1,3,'moodle/role:safeoverride',1,1484792638,0),(88,1,1,'moodle/role:manage',1,1484792638,0),(89,1,3,'moodle/role:switchroles',1,1484792638,0),(90,1,1,'moodle/role:switchroles',1,1484792638,0),(91,1,1,'moodle/category:manage',1,1484792638,0),(92,1,2,'moodle/category:viewhiddencategories',1,1484792638,0),(93,1,1,'moodle/category:viewhiddencategories',1,1484792638,0),(94,1,1,'moodle/cohort:manage',1,1484792638,0),(95,1,1,'moodle/cohort:assign',1,1484792638,0),(96,1,3,'moodle/cohort:view',1,1484792638,0),(97,1,1,'moodle/cohort:view',1,1484792638,0),(98,1,2,'moodle/course:create',1,1484792638,0),(99,1,1,'moodle/course:create',1,1484792638,0),(100,1,7,'moodle/course:request',1,1484792638,0),(101,1,1,'moodle/course:delete',1,1484792638,0),(102,1,3,'moodle/course:update',1,1484792638,0),(103,1,1,'moodle/course:update',1,1484792638,0),(104,1,1,'moodle/course:view',1,1484792638,0),(105,1,3,'moodle/course:enrolreview',1,1484792638,0),(106,1,1,'moodle/course:enrolreview',1,1484792638,0),(107,1,3,'moodle/course:enrolconfig',1,1484792638,0),(108,1,1,'moodle/course:enrolconfig',1,1484792638,0),(109,1,3,'moodle/course:reviewotherusers',1,1484792638,0),(110,1,1,'moodle/course:reviewotherusers',1,1484792638,0),(111,1,4,'moodle/course:bulkmessaging',1,1484792638,0),(112,1,3,'moodle/course:bulkmessaging',1,1484792638,0),(113,1,1,'moodle/course:bulkmessaging',1,1484792638,0),(114,1,4,'moodle/course:viewhiddenuserfields',1,1484792638,0),(115,1,3,'moodle/course:viewhiddenuserfields',1,1484792638,0),(116,1,1,'moodle/course:viewhiddenuserfields',1,1484792638,0),(117,1,2,'moodle/course:viewhiddencourses',1,1484792638,0),(118,1,4,'moodle/course:viewhiddencourses',1,1484792638,0),(119,1,3,'moodle/course:viewhiddencourses',1,1484792638,0),(120,1,1,'moodle/course:viewhiddencourses',1,1484792638,0),(121,1,3,'moodle/course:visibility',1,1484792638,0),(122,1,1,'moodle/course:visibility',1,1484792638,0),(123,1,3,'moodle/course:managefiles',1,1484792638,0),(124,1,1,'moodle/course:managefiles',1,1484792638,0),(125,1,3,'moodle/course:manageactivities',1,1484792638,0),(126,1,1,'moodle/course:manageactivities',1,1484792638,0),(127,1,3,'moodle/course:activityvisibility',1,1484792638,0),(128,1,1,'moodle/course:activityvisibility',1,1484792638,0),(129,1,4,'moodle/course:viewhiddenactivities',1,1484792638,0),(130,1,3,'moodle/course:viewhiddenactivities',1,1484792638,0),(131,1,1,'moodle/course:viewhiddenactivities',1,1484792638,0),(132,1,5,'moodle/course:viewparticipants',1,1484792638,0),(133,1,4,'moodle/course:viewparticipants',1,1484792638,0),(134,1,3,'moodle/course:viewparticipants',1,1484792638,0),(135,1,1,'moodle/course:viewparticipants',1,1484792638,0),(136,1,3,'moodle/course:changefullname',1,1484792638,0),(137,1,1,'moodle/course:changefullname',1,1484792638,0),(138,1,3,'moodle/course:changeshortname',1,1484792638,0),(139,1,1,'moodle/course:changeshortname',1,1484792638,0),(140,1,3,'moodle/course:renameroles',1,1484792638,0),(141,1,1,'moodle/course:renameroles',1,1484792638,0),(142,1,3,'moodle/course:changeidnumber',1,1484792638,0),(143,1,1,'moodle/course:changeidnumber',1,1484792638,0),(144,1,3,'moodle/course:changecategory',1,1484792638,0),(145,1,1,'moodle/course:changecategory',1,1484792638,0),(146,1,3,'moodle/course:changesummary',1,1484792638,0),(147,1,1,'moodle/course:changesummary',1,1484792638,0),(148,1,1,'moodle/site:viewparticipants',1,1484792638,0),(149,1,5,'moodle/course:isincompletionreports',1,1484792638,0),(150,1,5,'moodle/course:viewscales',1,1484792638,0),(151,1,4,'moodle/course:viewscales',1,1484792638,0),(152,1,3,'moodle/course:viewscales',1,1484792638,0),(153,1,1,'moodle/course:viewscales',1,1484792638,0),(154,1,3,'moodle/course:managescales',1,1484792638,0),(155,1,1,'moodle/course:managescales',1,1484792638,0),(156,1,3,'moodle/course:managegroups',1,1484792638,0),(157,1,1,'moodle/course:managegroups',1,1484792638,0),(158,1,3,'moodle/course:reset',1,1484792638,0),(159,1,1,'moodle/course:reset',1,1484792638,0),(160,1,3,'moodle/course:viewsuspendedusers',1,1484792638,0),(161,1,1,'moodle/course:viewsuspendedusers',1,1484792638,0),(162,1,1,'moodle/course:tag',1,1484792638,0),(163,1,3,'moodle/course:tag',1,1484792638,0),(164,1,6,'moodle/blog:view',1,1484792638,0),(165,1,7,'moodle/blog:view',1,1484792638,0),(166,1,5,'moodle/blog:view',1,1484792638,0),(167,1,4,'moodle/blog:view',1,1484792638,0),(168,1,3,'moodle/blog:view',1,1484792638,0),(169,1,1,'moodle/blog:view',1,1484792638,0),(170,1,6,'moodle/blog:search',1,1484792638,0),(171,1,7,'moodle/blog:search',1,1484792638,0),(172,1,5,'moodle/blog:search',1,1484792638,0),(173,1,4,'moodle/blog:search',1,1484792638,0),(174,1,3,'moodle/blog:search',1,1484792638,0),(175,1,1,'moodle/blog:search',1,1484792638,0),(176,1,1,'moodle/blog:viewdrafts',1,1484792638,0),(177,1,7,'moodle/blog:create',1,1484792638,0),(178,1,1,'moodle/blog:create',1,1484792638,0),(179,1,4,'moodle/blog:manageentries',1,1484792638,0),(180,1,3,'moodle/blog:manageentries',1,1484792638,0),(181,1,1,'moodle/blog:manageentries',1,1484792638,0),(182,1,5,'moodle/blog:manageexternal',1,1484792638,0),(183,1,7,'moodle/blog:manageexternal',1,1484792638,0),(184,1,4,'moodle/blog:manageexternal',1,1484792638,0),(185,1,3,'moodle/blog:manageexternal',1,1484792638,0),(186,1,1,'moodle/blog:manageexternal',1,1484792638,0),(187,1,7,'moodle/calendar:manageownentries',1,1484792638,0),(188,1,1,'moodle/calendar:manageownentries',1,1484792638,0),(189,1,4,'moodle/calendar:managegroupentries',1,1484792638,0),(190,1,3,'moodle/calendar:managegroupentries',1,1484792638,0),(191,1,1,'moodle/calendar:managegroupentries',1,1484792638,0),(192,1,4,'moodle/calendar:manageentries',1,1484792638,0),(193,1,3,'moodle/calendar:manageentries',1,1484792638,0),(194,1,1,'moodle/calendar:manageentries',1,1484792638,0),(195,1,1,'moodle/user:editprofile',1,1484792638,0),(196,1,6,'moodle/user:editownprofile',-1000,1484792638,0),(197,1,7,'moodle/user:editownprofile',1,1484792638,0),(198,1,1,'moodle/user:editownprofile',1,1484792638,0),(199,1,6,'moodle/user:changeownpassword',-1000,1484792638,0),(200,1,7,'moodle/user:changeownpassword',1,1484792638,0),(201,1,1,'moodle/user:changeownpassword',1,1484792638,0),(202,1,5,'moodle/user:readuserposts',1,1484792638,0),(203,1,4,'moodle/user:readuserposts',1,1484792638,0),(204,1,3,'moodle/user:readuserposts',1,1484792638,0),(205,1,1,'moodle/user:readuserposts',1,1484792638,0),(206,1,5,'moodle/user:readuserblogs',1,1484792638,0),(207,1,4,'moodle/user:readuserblogs',1,1484792638,0),(208,1,3,'moodle/user:readuserblogs',1,1484792638,0),(209,1,1,'moodle/user:readuserblogs',1,1484792638,0),(210,1,1,'moodle/user:editmessageprofile',1,1484792638,0),(211,1,6,'moodle/user:editownmessageprofile',-1000,1484792638,0),(212,1,7,'moodle/user:editownmessageprofile',1,1484792638,0),(213,1,1,'moodle/user:editownmessageprofile',1,1484792638,0),(214,1,3,'moodle/question:managecategory',1,1484792639,0),(215,1,1,'moodle/question:managecategory',1,1484792639,0),(216,1,3,'moodle/question:add',1,1484792639,0),(217,1,1,'moodle/question:add',1,1484792639,0),(218,1,3,'moodle/question:editmine',1,1484792639,0),(219,1,1,'moodle/question:editmine',1,1484792639,0),(220,1,3,'moodle/question:editall',1,1484792639,0),(221,1,1,'moodle/question:editall',1,1484792639,0),(222,1,3,'moodle/question:viewmine',1,1484792639,0),(223,1,1,'moodle/question:viewmine',1,1484792639,0),(224,1,3,'moodle/question:viewall',1,1484792639,0),(225,1,1,'moodle/question:viewall',1,1484792639,0),(226,1,3,'moodle/question:usemine',1,1484792639,0),(227,1,1,'moodle/question:usemine',1,1484792639,0),(228,1,3,'moodle/question:useall',1,1484792639,0),(229,1,1,'moodle/question:useall',1,1484792639,0),(230,1,3,'moodle/question:movemine',1,1484792639,0),(231,1,1,'moodle/question:movemine',1,1484792639,0),(232,1,3,'moodle/question:moveall',1,1484792639,0),(233,1,1,'moodle/question:moveall',1,1484792639,0),(234,1,1,'moodle/question:config',1,1484792639,0),(235,1,5,'moodle/question:flag',1,1484792639,0),(236,1,4,'moodle/question:flag',1,1484792639,0),(237,1,3,'moodle/question:flag',1,1484792639,0),(238,1,1,'moodle/question:flag',1,1484792639,0),(239,1,4,'moodle/site:doclinks',1,1484792639,0),(240,1,3,'moodle/site:doclinks',1,1484792639,0),(241,1,1,'moodle/site:doclinks',1,1484792639,0),(242,1,3,'moodle/course:sectionvisibility',1,1484792639,0),(243,1,1,'moodle/course:sectionvisibility',1,1484792639,0),(244,1,3,'moodle/course:useremail',1,1484792639,0),(245,1,1,'moodle/course:useremail',1,1484792639,0),(246,1,3,'moodle/course:viewhiddensections',1,1484792639,0),(247,1,1,'moodle/course:viewhiddensections',1,1484792639,0),(248,1,3,'moodle/course:setcurrentsection',1,1484792639,0),(249,1,1,'moodle/course:setcurrentsection',1,1484792639,0),(250,1,3,'moodle/course:movesections',1,1484792639,0),(251,1,1,'moodle/course:movesections',1,1484792639,0),(252,1,4,'moodle/grade:viewall',1,1484792639,0),(253,1,3,'moodle/grade:viewall',1,1484792639,0),(254,1,1,'moodle/grade:viewall',1,1484792639,0),(255,1,5,'moodle/grade:view',1,1484792639,0),(256,1,4,'moodle/grade:viewhidden',1,1484792639,0),(257,1,3,'moodle/grade:viewhidden',1,1484792639,0),(258,1,1,'moodle/grade:viewhidden',1,1484792639,0),(259,1,3,'moodle/grade:import',1,1484792639,0),(260,1,1,'moodle/grade:import',1,1484792639,0),(261,1,4,'moodle/grade:export',1,1484792639,0),(262,1,3,'moodle/grade:export',1,1484792639,0),(263,1,1,'moodle/grade:export',1,1484792639,0),(264,1,3,'moodle/grade:manage',1,1484792639,0),(265,1,1,'moodle/grade:manage',1,1484792639,0),(266,1,3,'moodle/grade:edit',1,1484792639,0),(267,1,1,'moodle/grade:edit',1,1484792639,0),(268,1,3,'moodle/grade:managegradingforms',1,1484792639,0),(269,1,1,'moodle/grade:managegradingforms',1,1484792639,0),(270,1,1,'moodle/grade:sharegradingforms',1,1484792639,0),(271,1,1,'moodle/grade:managesharedforms',1,1484792639,0),(272,1,3,'moodle/grade:manageoutcomes',1,1484792639,0),(273,1,1,'moodle/grade:manageoutcomes',1,1484792639,0),(274,1,3,'moodle/grade:manageletters',1,1484792639,0),(275,1,1,'moodle/grade:manageletters',1,1484792639,0),(276,1,3,'moodle/grade:hide',1,1484792639,0),(277,1,1,'moodle/grade:hide',1,1484792639,0),(278,1,3,'moodle/grade:lock',1,1484792639,0),(279,1,1,'moodle/grade:lock',1,1484792639,0),(280,1,3,'moodle/grade:unlock',1,1484792639,0),(281,1,1,'moodle/grade:unlock',1,1484792639,0),(282,1,7,'moodle/my:manageblocks',1,1484792639,0),(283,1,4,'moodle/notes:view',1,1484792639,0),(284,1,3,'moodle/notes:view',1,1484792639,0),(285,1,1,'moodle/notes:view',1,1484792639,0),(286,1,4,'moodle/notes:manage',1,1484792639,0),(287,1,3,'moodle/notes:manage',1,1484792639,0),(288,1,1,'moodle/notes:manage',1,1484792639,0),(289,1,1,'moodle/tag:manage',1,1484792639,0),(290,1,1,'moodle/tag:edit',1,1484792639,0),(291,1,7,'moodle/tag:flag',1,1484792639,0),(292,1,4,'moodle/tag:editblocks',1,1484792639,0),(293,1,3,'moodle/tag:editblocks',1,1484792639,0),(294,1,1,'moodle/tag:editblocks',1,1484792639,0),(295,1,6,'moodle/block:view',1,1484792639,0),(296,1,7,'moodle/block:view',1,1484792639,0),(297,1,5,'moodle/block:view',1,1484792639,0),(298,1,4,'moodle/block:view',1,1484792639,0),(299,1,3,'moodle/block:view',1,1484792639,0),(300,1,3,'moodle/block:edit',1,1484792639,0),(301,1,1,'moodle/block:edit',1,1484792639,0),(302,1,7,'moodle/portfolio:export',1,1484792639,0),(303,1,5,'moodle/portfolio:export',1,1484792639,0),(304,1,4,'moodle/portfolio:export',1,1484792639,0),(305,1,3,'moodle/portfolio:export',1,1484792639,0),(306,1,8,'moodle/comment:view',1,1484792639,0),(307,1,6,'moodle/comment:view',1,1484792639,0),(308,1,7,'moodle/comment:view',1,1484792639,0),(309,1,5,'moodle/comment:view',1,1484792639,0),(310,1,4,'moodle/comment:view',1,1484792639,0),(311,1,3,'moodle/comment:view',1,1484792639,0),(312,1,1,'moodle/comment:view',1,1484792639,0),(313,1,7,'moodle/comment:post',1,1484792639,0),(314,1,5,'moodle/comment:post',1,1484792639,0),(315,1,4,'moodle/comment:post',1,1484792639,0),(316,1,3,'moodle/comment:post',1,1484792639,0),(317,1,1,'moodle/comment:post',1,1484792639,0),(318,1,3,'moodle/comment:delete',1,1484792639,0),(319,1,1,'moodle/comment:delete',1,1484792639,0),(320,1,1,'moodle/webservice:createtoken',1,1484792639,0),(321,1,7,'moodle/webservice:createmobiletoken',1,1484792639,0),(322,1,7,'moodle/rating:view',1,1484792639,0),(323,1,5,'moodle/rating:view',1,1484792639,0),(324,1,4,'moodle/rating:view',1,1484792639,0),(325,1,3,'moodle/rating:view',1,1484792639,0),(326,1,1,'moodle/rating:view',1,1484792639,0),(327,1,7,'moodle/rating:viewany',1,1484792639,0),(328,1,5,'moodle/rating:viewany',1,1484792639,0),(329,1,4,'moodle/rating:viewany',1,1484792639,0),(330,1,3,'moodle/rating:viewany',1,1484792639,0),(331,1,1,'moodle/rating:viewany',1,1484792639,0),(332,1,7,'moodle/rating:viewall',1,1484792639,0),(333,1,5,'moodle/rating:viewall',1,1484792639,0),(334,1,4,'moodle/rating:viewall',1,1484792639,0),(335,1,3,'moodle/rating:viewall',1,1484792639,0),(336,1,1,'moodle/rating:viewall',1,1484792639,0),(337,1,7,'moodle/rating:rate',1,1484792639,0),(338,1,5,'moodle/rating:rate',1,1484792639,0),(339,1,4,'moodle/rating:rate',1,1484792639,0),(340,1,3,'moodle/rating:rate',1,1484792639,0),(341,1,1,'moodle/rating:rate',1,1484792639,0),(342,1,1,'moodle/course:publish',1,1484792639,0),(343,1,4,'moodle/course:markcomplete',1,1484792639,0),(344,1,3,'moodle/course:markcomplete',1,1484792639,0),(345,1,1,'moodle/course:markcomplete',1,1484792639,0),(346,1,1,'moodle/community:add',1,1484792639,0),(347,1,4,'moodle/community:add',1,1484792639,0),(348,1,3,'moodle/community:add',1,1484792639,0),(349,1,1,'moodle/community:download',1,1484792639,0),(350,1,3,'moodle/community:download',1,1484792639,0),(351,1,1,'moodle/badges:manageglobalsettings',1,1484792639,0),(352,1,7,'moodle/badges:viewbadges',1,1484792639,0),(353,1,7,'moodle/badges:manageownbadges',1,1484792639,0),(354,1,7,'moodle/badges:viewotherbadges',1,1484792639,0),(355,1,7,'moodle/badges:earnbadge',1,1484792639,0),(356,1,1,'moodle/badges:createbadge',1,1484792639,0),(357,1,3,'moodle/badges:createbadge',1,1484792639,0),(358,1,1,'moodle/badges:deletebadge',1,1484792639,0),(359,1,3,'moodle/badges:deletebadge',1,1484792639,0),(360,1,1,'moodle/badges:configuredetails',1,1484792639,0),(361,1,3,'moodle/badges:configuredetails',1,1484792639,0),(362,1,1,'moodle/badges:configurecriteria',1,1484792639,0),(363,1,3,'moodle/badges:configurecriteria',1,1484792639,0),(364,1,1,'moodle/badges:configuremessages',1,1484792639,0),(365,1,3,'moodle/badges:configuremessages',1,1484792639,0),(366,1,1,'moodle/badges:awardbadge',1,1484792639,0),(367,1,4,'moodle/badges:awardbadge',1,1484792639,0),(368,1,3,'moodle/badges:awardbadge',1,1484792639,0),(369,1,1,'moodle/badges:revokebadge',1,1484792639,0),(370,1,4,'moodle/badges:revokebadge',1,1484792639,0),(371,1,3,'moodle/badges:revokebadge',1,1484792639,0),(372,1,1,'moodle/badges:viewawarded',1,1484792639,0),(373,1,4,'moodle/badges:viewawarded',1,1484792639,0),(374,1,3,'moodle/badges:viewawarded',1,1484792639,0),(375,1,6,'moodle/search:query',1,1484792639,0),(376,1,7,'moodle/search:query',1,1484792639,0),(377,1,5,'moodle/search:query',1,1484792639,0),(378,1,4,'moodle/search:query',1,1484792639,0),(379,1,3,'moodle/search:query',1,1484792639,0),(380,1,1,'moodle/search:query',1,1484792639,0),(381,1,1,'moodle/competency:competencymanage',1,1484792639,0),(382,1,7,'moodle/competency:competencyview',1,1484792639,0),(383,1,3,'moodle/competency:competencygrade',1,1484792639,0),(384,1,4,'moodle/competency:competencygrade',1,1484792639,0),(385,1,1,'moodle/competency:competencygrade',1,1484792639,0),(386,1,3,'moodle/competency:coursecompetencymanage',1,1484792639,0),(387,1,1,'moodle/competency:coursecompetencymanage',1,1484792639,0),(388,1,1,'moodle/competency:coursecompetencyconfigure',1,1484792639,0),(389,1,5,'moodle/competency:coursecompetencygradable',1,1484792639,0),(390,1,7,'moodle/competency:coursecompetencyview',1,1484792639,0),(391,1,1,'moodle/competency:planmanage',1,1484792639,0),(392,1,1,'moodle/competency:planmanagedraft',1,1484792639,0),(393,1,1,'moodle/competency:planview',1,1484792639,0),(394,1,1,'moodle/competency:planviewdraft',1,1484792639,0),(395,1,7,'moodle/competency:planviewown',1,1484792639,0),(396,1,1,'moodle/competency:planrequestreview',1,1484792639,0),(397,1,7,'moodle/competency:planrequestreviewown',1,1484792639,0),(398,1,1,'moodle/competency:planreview',1,1484792639,0),(399,1,1,'moodle/competency:plancomment',1,1484792639,0),(400,1,7,'moodle/competency:plancommentown',1,1484792639,0),(401,1,1,'moodle/competency:usercompetencyview',1,1484792639,0),(402,1,3,'moodle/competency:usercompetencyview',1,1484792639,0),(403,1,4,'moodle/competency:usercompetencyview',1,1484792639,0),(404,1,1,'moodle/competency:usercompetencyrequestreview',1,1484792639,0),(405,1,7,'moodle/competency:usercompetencyrequestreviewown',1,1484792639,0),(406,1,1,'moodle/competency:usercompetencyreview',1,1484792639,0),(407,1,1,'moodle/competency:usercompetencycomment',1,1484792639,0),(408,1,7,'moodle/competency:usercompetencycommentown',1,1484792639,0),(409,1,1,'moodle/competency:templatemanage',1,1484792639,0),(410,1,1,'moodle/competency:templateview',1,1484792639,0),(411,1,1,'moodle/competency:userevidencemanage',1,1484792639,0),(412,1,7,'moodle/competency:userevidencemanageown',1,1484792639,0),(413,1,1,'moodle/competency:userevidenceview',1,1484792639,0),(414,1,6,'mod/assign:view',1,1484792648,0),(415,1,5,'mod/assign:view',1,1484792648,0),(416,1,4,'mod/assign:view',1,1484792648,0),(417,1,3,'mod/assign:view',1,1484792648,0),(418,1,1,'mod/assign:view',1,1484792648,0),(419,1,5,'mod/assign:submit',1,1484792648,0),(420,1,4,'mod/assign:grade',1,1484792648,0),(421,1,3,'mod/assign:grade',1,1484792648,0),(422,1,1,'mod/assign:grade',1,1484792648,0),(423,1,4,'mod/assign:exportownsubmission',1,1484792648,0),(424,1,3,'mod/assign:exportownsubmission',1,1484792648,0),(425,1,1,'mod/assign:exportownsubmission',1,1484792648,0),(426,1,5,'mod/assign:exportownsubmission',1,1484792648,0),(427,1,3,'mod/assign:addinstance',1,1484792648,0),(428,1,1,'mod/assign:addinstance',1,1484792648,0),(429,1,4,'mod/assign:grantextension',1,1484792648,0),(430,1,3,'mod/assign:grantextension',1,1484792648,0),(431,1,1,'mod/assign:grantextension',1,1484792648,0),(432,1,3,'mod/assign:revealidentities',1,1484792648,0),(433,1,1,'mod/assign:revealidentities',1,1484792648,0),(434,1,3,'mod/assign:reviewgrades',1,1484792648,0),(435,1,1,'mod/assign:reviewgrades',1,1484792648,0),(436,1,3,'mod/assign:releasegrades',1,1484792648,0),(437,1,1,'mod/assign:releasegrades',1,1484792648,0),(438,1,3,'mod/assign:managegrades',1,1484792648,0),(439,1,1,'mod/assign:managegrades',1,1484792648,0),(440,1,3,'mod/assign:manageallocations',1,1484792648,0),(441,1,1,'mod/assign:manageallocations',1,1484792648,0),(442,1,3,'mod/assign:viewgrades',1,1484792648,0),(443,1,1,'mod/assign:viewgrades',1,1484792648,0),(444,1,4,'mod/assign:viewgrades',1,1484792648,0),(445,1,1,'mod/assign:viewblinddetails',1,1484792648,0),(446,1,4,'mod/assign:receivegradernotifications',1,1484792648,0),(447,1,3,'mod/assign:receivegradernotifications',1,1484792648,0),(448,1,1,'mod/assign:receivegradernotifications',1,1484792648,0),(449,1,3,'mod/assign:manageoverrides',1,1484792648,0),(450,1,1,'mod/assign:manageoverrides',1,1484792648,0),(451,1,6,'mod/assignment:view',1,1484792648,0),(452,1,5,'mod/assignment:view',1,1484792648,0),(453,1,4,'mod/assignment:view',1,1484792648,0),(454,1,3,'mod/assignment:view',1,1484792648,0),(455,1,1,'mod/assignment:view',1,1484792648,0),(456,1,3,'mod/assignment:addinstance',1,1484792648,0),(457,1,1,'mod/assignment:addinstance',1,1484792648,0),(458,1,5,'mod/assignment:submit',1,1484792648,0),(459,1,4,'mod/assignment:grade',1,1484792648,0),(460,1,3,'mod/assignment:grade',1,1484792648,0),(461,1,1,'mod/assignment:grade',1,1484792648,0),(462,1,4,'mod/assignment:exportownsubmission',1,1484792648,0),(463,1,3,'mod/assignment:exportownsubmission',1,1484792648,0),(464,1,1,'mod/assignment:exportownsubmission',1,1484792648,0),(465,1,5,'mod/assignment:exportownsubmission',1,1484792648,0),(466,1,3,'mod/book:addinstance',1,1484792648,0),(467,1,1,'mod/book:addinstance',1,1484792648,0),(468,1,6,'mod/book:read',1,1484792648,0),(469,1,8,'mod/book:read',1,1484792648,0),(470,1,5,'mod/book:read',1,1484792648,0),(471,1,4,'mod/book:read',1,1484792648,0),(472,1,3,'mod/book:read',1,1484792648,0),(473,1,1,'mod/book:read',1,1484792648,0),(474,1,4,'mod/book:viewhiddenchapters',1,1484792648,0),(475,1,3,'mod/book:viewhiddenchapters',1,1484792648,0),(476,1,1,'mod/book:viewhiddenchapters',1,1484792648,0),(477,1,3,'mod/book:edit',1,1484792648,0),(478,1,1,'mod/book:edit',1,1484792648,0),(479,1,3,'mod/chat:addinstance',1,1484792648,0),(480,1,1,'mod/chat:addinstance',1,1484792648,0),(481,1,5,'mod/chat:chat',1,1484792648,0),(482,1,4,'mod/chat:chat',1,1484792648,0),(483,1,3,'mod/chat:chat',1,1484792648,0),(484,1,1,'mod/chat:chat',1,1484792649,0),(485,1,5,'mod/chat:readlog',1,1484792649,0),(486,1,4,'mod/chat:readlog',1,1484792649,0),(487,1,3,'mod/chat:readlog',1,1484792649,0),(488,1,1,'mod/chat:readlog',1,1484792649,0),(489,1,4,'mod/chat:deletelog',1,1484792649,0),(490,1,3,'mod/chat:deletelog',1,1484792649,0),(491,1,1,'mod/chat:deletelog',1,1484792649,0),(492,1,4,'mod/chat:exportparticipatedsession',1,1484792649,0),(493,1,3,'mod/chat:exportparticipatedsession',1,1484792649,0),(494,1,1,'mod/chat:exportparticipatedsession',1,1484792649,0),(495,1,4,'mod/chat:exportsession',1,1484792649,0),(496,1,3,'mod/chat:exportsession',1,1484792649,0),(497,1,1,'mod/chat:exportsession',1,1484792649,0),(498,1,7,'mod/chat:view',1,1484792649,0),(499,1,6,'mod/chat:view',1,1484792649,0),(500,1,3,'mod/choice:addinstance',1,1484792649,0),(501,1,1,'mod/choice:addinstance',1,1484792649,0),(502,1,5,'mod/choice:choose',1,1484792649,0),(503,1,4,'mod/choice:choose',1,1484792649,0),(504,1,3,'mod/choice:choose',1,1484792649,0),(505,1,4,'mod/choice:readresponses',1,1484792649,0),(506,1,3,'mod/choice:readresponses',1,1484792649,0),(507,1,1,'mod/choice:readresponses',1,1484792649,0),(508,1,4,'mod/choice:deleteresponses',1,1484792649,0),(509,1,3,'mod/choice:deleteresponses',1,1484792649,0),(510,1,1,'mod/choice:deleteresponses',1,1484792649,0),(511,1,4,'mod/choice:downloadresponses',1,1484792649,0),(512,1,3,'mod/choice:downloadresponses',1,1484792649,0),(513,1,1,'mod/choice:downloadresponses',1,1484792649,0),(514,1,7,'mod/choice:view',1,1484792649,0),(515,1,6,'mod/choice:view',1,1484792649,0),(516,1,3,'mod/data:addinstance',1,1484792649,0),(517,1,1,'mod/data:addinstance',1,1484792649,0),(518,1,8,'mod/data:viewentry',1,1484792649,0),(519,1,6,'mod/data:viewentry',1,1484792649,0),(520,1,5,'mod/data:viewentry',1,1484792649,0),(521,1,4,'mod/data:viewentry',1,1484792649,0),(522,1,3,'mod/data:viewentry',1,1484792649,0),(523,1,1,'mod/data:viewentry',1,1484792649,0),(524,1,5,'mod/data:writeentry',1,1484792649,0),(525,1,4,'mod/data:writeentry',1,1484792649,0),(526,1,3,'mod/data:writeentry',1,1484792649,0),(527,1,1,'mod/data:writeentry',1,1484792649,0),(528,1,5,'mod/data:comment',1,1484792649,0),(529,1,4,'mod/data:comment',1,1484792649,0),(530,1,3,'mod/data:comment',1,1484792649,0),(531,1,1,'mod/data:comment',1,1484792649,0),(532,1,4,'mod/data:rate',1,1484792649,0),(533,1,3,'mod/data:rate',1,1484792649,0),(534,1,1,'mod/data:rate',1,1484792649,0),(535,1,4,'mod/data:viewrating',1,1484792649,0),(536,1,3,'mod/data:viewrating',1,1484792649,0),(537,1,1,'mod/data:viewrating',1,1484792649,0),(538,1,4,'mod/data:viewanyrating',1,1484792649,0),(539,1,3,'mod/data:viewanyrating',1,1484792649,0),(540,1,1,'mod/data:viewanyrating',1,1484792649,0),(541,1,4,'mod/data:viewallratings',1,1484792649,0),(542,1,3,'mod/data:viewallratings',1,1484792649,0),(543,1,1,'mod/data:viewallratings',1,1484792649,0),(544,1,4,'mod/data:approve',1,1484792649,0),(545,1,3,'mod/data:approve',1,1484792649,0),(546,1,1,'mod/data:approve',1,1484792649,0),(547,1,4,'mod/data:manageentries',1,1484792649,0),(548,1,3,'mod/data:manageentries',1,1484792649,0),(549,1,1,'mod/data:manageentries',1,1484792649,0),(550,1,4,'mod/data:managecomments',1,1484792649,0),(551,1,3,'mod/data:managecomments',1,1484792649,0),(552,1,1,'mod/data:managecomments',1,1484792649,0),(553,1,3,'mod/data:managetemplates',1,1484792649,0),(554,1,1,'mod/data:managetemplates',1,1484792649,0),(555,1,4,'mod/data:viewalluserpresets',1,1484792649,0),(556,1,3,'mod/data:viewalluserpresets',1,1484792649,0),(557,1,1,'mod/data:viewalluserpresets',1,1484792649,0),(558,1,1,'mod/data:manageuserpresets',1,1484792649,0),(559,1,1,'mod/data:exportentry',1,1484792649,0),(560,1,4,'mod/data:exportentry',1,1484792649,0),(561,1,3,'mod/data:exportentry',1,1484792649,0),(562,1,1,'mod/data:exportownentry',1,1484792649,0),(563,1,4,'mod/data:exportownentry',1,1484792649,0),(564,1,3,'mod/data:exportownentry',1,1484792649,0),(565,1,5,'mod/data:exportownentry',1,1484792649,0),(566,1,1,'mod/data:exportallentries',1,1484792649,0),(567,1,4,'mod/data:exportallentries',1,1484792649,0),(568,1,3,'mod/data:exportallentries',1,1484792649,0),(569,1,1,'mod/data:exportuserinfo',1,1484792649,0),(570,1,4,'mod/data:exportuserinfo',1,1484792649,0),(571,1,3,'mod/data:exportuserinfo',1,1484792649,0),(572,1,6,'mod/data:view',1,1484792649,0),(573,1,5,'mod/data:view',1,1484792649,0),(574,1,4,'mod/data:view',1,1484792649,0),(575,1,3,'mod/data:view',1,1484792649,0),(576,1,1,'mod/data:view',1,1484792649,0),(577,1,3,'mod/feedback:addinstance',1,1484792649,0),(578,1,1,'mod/feedback:addinstance',1,1484792649,0),(579,1,6,'mod/feedback:view',1,1484792649,0),(580,1,8,'mod/feedback:view',1,1484792649,0),(581,1,5,'mod/feedback:view',1,1484792649,0),(582,1,4,'mod/feedback:view',1,1484792649,0),(583,1,3,'mod/feedback:view',1,1484792649,0),(584,1,1,'mod/feedback:view',1,1484792649,0),(585,1,8,'mod/feedback:complete',1,1484792649,0),(586,1,5,'mod/feedback:complete',1,1484792649,0),(587,1,5,'mod/feedback:viewanalysepage',1,1484792649,0),(588,1,3,'mod/feedback:viewanalysepage',1,1484792649,0),(589,1,1,'mod/feedback:viewanalysepage',1,1484792649,0),(590,1,3,'mod/feedback:deletesubmissions',1,1484792649,0),(591,1,1,'mod/feedback:deletesubmissions',1,1484792649,0),(592,1,1,'mod/feedback:mapcourse',1,1484792649,0),(593,1,3,'mod/feedback:edititems',1,1484792649,0),(594,1,1,'mod/feedback:edititems',1,1484792649,0),(595,1,3,'mod/feedback:createprivatetemplate',1,1484792649,0),(596,1,1,'mod/feedback:createprivatetemplate',1,1484792649,0),(597,1,3,'mod/feedback:createpublictemplate',1,1484792649,0),(598,1,1,'mod/feedback:createpublictemplate',1,1484792649,0),(599,1,3,'mod/feedback:deletetemplate',1,1484792649,0),(600,1,1,'mod/feedback:deletetemplate',1,1484792649,0),(601,1,4,'mod/feedback:viewreports',1,1484792649,0),(602,1,3,'mod/feedback:viewreports',1,1484792649,0),(603,1,1,'mod/feedback:viewreports',1,1484792649,0),(604,1,4,'mod/feedback:receivemail',1,1484792649,0),(605,1,3,'mod/feedback:receivemail',1,1484792649,0),(606,1,3,'mod/folder:addinstance',1,1484792650,0),(607,1,1,'mod/folder:addinstance',1,1484792650,0),(608,1,6,'mod/folder:view',1,1484792650,0),(609,1,7,'mod/folder:view',1,1484792650,0),(610,1,3,'mod/folder:managefiles',1,1484792650,0),(611,1,3,'mod/forum:addinstance',1,1484792650,0),(612,1,1,'mod/forum:addinstance',1,1484792650,0),(613,1,8,'mod/forum:viewdiscussion',1,1484792650,0),(614,1,6,'mod/forum:viewdiscussion',1,1484792650,0),(615,1,5,'mod/forum:viewdiscussion',1,1484792650,0),(616,1,4,'mod/forum:viewdiscussion',1,1484792650,0),(617,1,3,'mod/forum:viewdiscussion',1,1484792650,0),(618,1,1,'mod/forum:viewdiscussion',1,1484792650,0),(619,1,4,'mod/forum:viewhiddentimedposts',1,1484792650,0),(620,1,3,'mod/forum:viewhiddentimedposts',1,1484792650,0),(621,1,1,'mod/forum:viewhiddentimedposts',1,1484792650,0),(622,1,5,'mod/forum:startdiscussion',1,1484792650,0),(623,1,4,'mod/forum:startdiscussion',1,1484792650,0),(624,1,3,'mod/forum:startdiscussion',1,1484792650,0),(625,1,1,'mod/forum:startdiscussion',1,1484792650,0),(626,1,5,'mod/forum:replypost',1,1484792650,0),(627,1,4,'mod/forum:replypost',1,1484792650,0),(628,1,3,'mod/forum:replypost',1,1484792650,0),(629,1,1,'mod/forum:replypost',1,1484792650,0),(630,1,4,'mod/forum:addnews',1,1484792650,0),(631,1,3,'mod/forum:addnews',1,1484792650,0),(632,1,1,'mod/forum:addnews',1,1484792650,0),(633,1,4,'mod/forum:replynews',1,1484792650,0),(634,1,3,'mod/forum:replynews',1,1484792650,0),(635,1,1,'mod/forum:replynews',1,1484792650,0),(636,1,5,'mod/forum:viewrating',1,1484792650,0),(637,1,4,'mod/forum:viewrating',1,1484792650,0),(638,1,3,'mod/forum:viewrating',1,1484792650,0),(639,1,1,'mod/forum:viewrating',1,1484792650,0),(640,1,4,'mod/forum:viewanyrating',1,1484792650,0),(641,1,3,'mod/forum:viewanyrating',1,1484792650,0),(642,1,1,'mod/forum:viewanyrating',1,1484792650,0),(643,1,4,'mod/forum:viewallratings',1,1484792650,0),(644,1,3,'mod/forum:viewallratings',1,1484792650,0),(645,1,1,'mod/forum:viewallratings',1,1484792650,0),(646,1,4,'mod/forum:rate',1,1484792650,0),(647,1,3,'mod/forum:rate',1,1484792650,0),(648,1,1,'mod/forum:rate',1,1484792650,0),(649,1,5,'mod/forum:createattachment',1,1484792650,0),(650,1,4,'mod/forum:createattachment',1,1484792650,0),(651,1,3,'mod/forum:createattachment',1,1484792650,0),(652,1,1,'mod/forum:createattachment',1,1484792650,0),(653,1,5,'mod/forum:deleteownpost',1,1484792650,0),(654,1,4,'mod/forum:deleteownpost',1,1484792650,0),(655,1,3,'mod/forum:deleteownpost',1,1484792650,0),(656,1,1,'mod/forum:deleteownpost',1,1484792650,0),(657,1,4,'mod/forum:deleteanypost',1,1484792650,0),(658,1,3,'mod/forum:deleteanypost',1,1484792650,0),(659,1,1,'mod/forum:deleteanypost',1,1484792650,0),(660,1,4,'mod/forum:splitdiscussions',1,1484792650,0),(661,1,3,'mod/forum:splitdiscussions',1,1484792650,0),(662,1,1,'mod/forum:splitdiscussions',1,1484792650,0),(663,1,4,'mod/forum:movediscussions',1,1484792650,0),(664,1,3,'mod/forum:movediscussions',1,1484792650,0),(665,1,1,'mod/forum:movediscussions',1,1484792650,0),(666,1,4,'mod/forum:pindiscussions',1,1484792650,0),(667,1,3,'mod/forum:pindiscussions',1,1484792650,0),(668,1,1,'mod/forum:pindiscussions',1,1484792650,0),(669,1,4,'mod/forum:editanypost',1,1484792650,0),(670,1,3,'mod/forum:editanypost',1,1484792650,0),(671,1,1,'mod/forum:editanypost',1,1484792650,0),(672,1,4,'mod/forum:viewqandawithoutposting',1,1484792650,0),(673,1,3,'mod/forum:viewqandawithoutposting',1,1484792650,0),(674,1,1,'mod/forum:viewqandawithoutposting',1,1484792650,0),(675,1,4,'mod/forum:viewsubscribers',1,1484792650,0),(676,1,3,'mod/forum:viewsubscribers',1,1484792650,0),(677,1,1,'mod/forum:viewsubscribers',1,1484792650,0),(678,1,4,'mod/forum:managesubscriptions',1,1484792650,0),(679,1,3,'mod/forum:managesubscriptions',1,1484792650,0),(680,1,1,'mod/forum:managesubscriptions',1,1484792650,0),(681,1,4,'mod/forum:postwithoutthrottling',1,1484792650,0),(682,1,3,'mod/forum:postwithoutthrottling',1,1484792650,0),(683,1,1,'mod/forum:postwithoutthrottling',1,1484792650,0),(684,1,4,'mod/forum:exportdiscussion',1,1484792650,0),(685,1,3,'mod/forum:exportdiscussion',1,1484792650,0),(686,1,1,'mod/forum:exportdiscussion',1,1484792650,0),(687,1,4,'mod/forum:exportpost',1,1484792650,0),(688,1,3,'mod/forum:exportpost',1,1484792650,0),(689,1,1,'mod/forum:exportpost',1,1484792650,0),(690,1,4,'mod/forum:exportownpost',1,1484792650,0),(691,1,3,'mod/forum:exportownpost',1,1484792650,0),(692,1,1,'mod/forum:exportownpost',1,1484792650,0),(693,1,5,'mod/forum:exportownpost',1,1484792650,0),(694,1,4,'mod/forum:addquestion',1,1484792650,0),(695,1,3,'mod/forum:addquestion',1,1484792650,0),(696,1,1,'mod/forum:addquestion',1,1484792650,0),(697,1,5,'mod/forum:allowforcesubscribe',1,1484792650,0),(698,1,4,'mod/forum:allowforcesubscribe',1,1484792650,0),(699,1,3,'mod/forum:allowforcesubscribe',1,1484792650,0),(700,1,8,'mod/forum:allowforcesubscribe',1,1484792650,0),(701,1,4,'mod/forum:canposttomygroups',1,1484792650,0),(702,1,3,'mod/forum:canposttomygroups',1,1484792650,0),(703,1,1,'mod/forum:canposttomygroups',1,1484792650,0),(704,1,4,'mod/forum:canoverridediscussionlock',1,1484792650,0),(705,1,3,'mod/forum:canoverridediscussionlock',1,1484792650,0),(706,1,1,'mod/forum:canoverridediscussionlock',1,1484792650,0),(707,1,3,'mod/glossary:addinstance',1,1484792650,0),(708,1,1,'mod/glossary:addinstance',1,1484792650,0),(709,1,8,'mod/glossary:view',1,1484792650,0),(710,1,6,'mod/glossary:view',1,1484792650,0),(711,1,5,'mod/glossary:view',1,1484792650,0),(712,1,4,'mod/glossary:view',1,1484792650,0),(713,1,3,'mod/glossary:view',1,1484792650,0),(714,1,1,'mod/glossary:view',1,1484792650,0),(715,1,5,'mod/glossary:write',1,1484792650,0),(716,1,4,'mod/glossary:write',1,1484792650,0),(717,1,3,'mod/glossary:write',1,1484792650,0),(718,1,1,'mod/glossary:write',1,1484792650,0),(719,1,4,'mod/glossary:manageentries',1,1484792650,0),(720,1,3,'mod/glossary:manageentries',1,1484792650,0),(721,1,1,'mod/glossary:manageentries',1,1484792650,0),(722,1,4,'mod/glossary:managecategories',1,1484792650,0),(723,1,3,'mod/glossary:managecategories',1,1484792650,0),(724,1,1,'mod/glossary:managecategories',1,1484792650,0),(725,1,5,'mod/glossary:comment',1,1484792650,0),(726,1,4,'mod/glossary:comment',1,1484792650,0),(727,1,3,'mod/glossary:comment',1,1484792650,0),(728,1,1,'mod/glossary:comment',1,1484792650,0),(729,1,4,'mod/glossary:managecomments',1,1484792650,0),(730,1,3,'mod/glossary:managecomments',1,1484792650,0),(731,1,1,'mod/glossary:managecomments',1,1484792650,0),(732,1,4,'mod/glossary:import',1,1484792650,0),(733,1,3,'mod/glossary:import',1,1484792650,0),(734,1,1,'mod/glossary:import',1,1484792650,0),(735,1,4,'mod/glossary:export',1,1484792650,0),(736,1,3,'mod/glossary:export',1,1484792650,0),(737,1,1,'mod/glossary:export',1,1484792650,0),(738,1,4,'mod/glossary:approve',1,1484792650,0),(739,1,3,'mod/glossary:approve',1,1484792650,0),(740,1,1,'mod/glossary:approve',1,1484792650,0),(741,1,4,'mod/glossary:rate',1,1484792650,0),(742,1,3,'mod/glossary:rate',1,1484792650,0),(743,1,1,'mod/glossary:rate',1,1484792650,0),(744,1,4,'mod/glossary:viewrating',1,1484792650,0),(745,1,3,'mod/glossary:viewrating',1,1484792650,0),(746,1,1,'mod/glossary:viewrating',1,1484792650,0),(747,1,4,'mod/glossary:viewanyrating',1,1484792650,0),(748,1,3,'mod/glossary:viewanyrating',1,1484792650,0),(749,1,1,'mod/glossary:viewanyrating',1,1484792650,0),(750,1,4,'mod/glossary:viewallratings',1,1484792650,0),(751,1,3,'mod/glossary:viewallratings',1,1484792650,0),(752,1,1,'mod/glossary:viewallratings',1,1484792650,0),(753,1,4,'mod/glossary:exportentry',1,1484792650,0),(754,1,3,'mod/glossary:exportentry',1,1484792650,0),(755,1,1,'mod/glossary:exportentry',1,1484792650,0),(756,1,4,'mod/glossary:exportownentry',1,1484792650,0),(757,1,3,'mod/glossary:exportownentry',1,1484792650,0),(758,1,1,'mod/glossary:exportownentry',1,1484792650,0),(759,1,5,'mod/glossary:exportownentry',1,1484792650,0),(760,1,6,'mod/imscp:view',1,1484792651,0),(761,1,7,'mod/imscp:view',1,1484792651,0),(762,1,3,'mod/imscp:addinstance',1,1484792651,0),(763,1,1,'mod/imscp:addinstance',1,1484792651,0),(764,1,3,'mod/label:addinstance',1,1484792651,0),(765,1,1,'mod/label:addinstance',1,1484792651,0),(766,1,7,'mod/label:view',1,1484792651,0),(767,1,6,'mod/label:view',1,1484792651,0),(768,1,3,'mod/lesson:addinstance',1,1484792651,0),(769,1,1,'mod/lesson:addinstance',1,1484792651,0),(770,1,3,'mod/lesson:edit',1,1484792651,0),(771,1,1,'mod/lesson:edit',1,1484792651,0),(772,1,4,'mod/lesson:grade',1,1484792651,0),(773,1,3,'mod/lesson:grade',1,1484792651,0),(774,1,1,'mod/lesson:grade',1,1484792651,0),(775,1,4,'mod/lesson:viewreports',1,1484792651,0),(776,1,3,'mod/lesson:viewreports',1,1484792651,0),(777,1,1,'mod/lesson:viewreports',1,1484792651,0),(778,1,4,'mod/lesson:manage',1,1484792651,0),(779,1,3,'mod/lesson:manage',1,1484792651,0),(780,1,1,'mod/lesson:manage',1,1484792651,0),(781,1,3,'mod/lesson:manageoverrides',1,1484792651,0),(782,1,1,'mod/lesson:manageoverrides',1,1484792651,0),(783,1,7,'mod/lesson:view',1,1484792651,0),(784,1,6,'mod/lesson:view',1,1484792651,0),(785,1,5,'mod/lti:view',1,1484792651,0),(786,1,4,'mod/lti:view',1,1484792651,0),(787,1,3,'mod/lti:view',1,1484792651,0),(788,1,1,'mod/lti:view',1,1484792651,0),(789,1,3,'mod/lti:addinstance',1,1484792651,0),(790,1,1,'mod/lti:addinstance',1,1484792651,0),(791,1,4,'mod/lti:manage',1,1484792651,0),(792,1,3,'mod/lti:manage',1,1484792651,0),(793,1,1,'mod/lti:manage',1,1484792651,0),(794,1,3,'mod/lti:addcoursetool',1,1484792651,0),(795,1,1,'mod/lti:addcoursetool',1,1484792651,0),(796,1,3,'mod/lti:requesttooladd',1,1484792651,0),(797,1,1,'mod/lti:requesttooladd',1,1484792651,0),(798,1,6,'mod/page:view',1,1484792651,0),(799,1,7,'mod/page:view',1,1484792651,0),(800,1,3,'mod/page:addinstance',1,1484792651,0),(801,1,1,'mod/page:addinstance',1,1484792651,0),(802,1,6,'mod/quiz:view',1,1484792651,0),(803,1,5,'mod/quiz:view',1,1484792651,0),(804,1,4,'mod/quiz:view',1,1484792651,0),(805,1,3,'mod/quiz:view',1,1484792651,0),(806,1,1,'mod/quiz:view',1,1484792651,0),(807,1,3,'mod/quiz:addinstance',1,1484792651,0),(808,1,1,'mod/quiz:addinstance',1,1484792651,0),(809,1,5,'mod/quiz:attempt',1,1484792651,0),(810,1,5,'mod/quiz:reviewmyattempts',1,1484792651,0),(811,1,3,'mod/quiz:manage',1,1484792651,0),(812,1,1,'mod/quiz:manage',1,1484792651,0),(813,1,3,'mod/quiz:manageoverrides',1,1484792651,0),(814,1,1,'mod/quiz:manageoverrides',1,1484792651,0),(815,1,4,'mod/quiz:preview',1,1484792651,0),(816,1,3,'mod/quiz:preview',1,1484792651,0),(817,1,1,'mod/quiz:preview',1,1484792651,0),(818,1,4,'mod/quiz:grade',1,1484792651,0),(819,1,3,'mod/quiz:grade',1,1484792651,0),(820,1,1,'mod/quiz:grade',1,1484792651,0),(821,1,4,'mod/quiz:regrade',1,1484792651,0),(822,1,3,'mod/quiz:regrade',1,1484792651,0),(823,1,1,'mod/quiz:regrade',1,1484792651,0),(824,1,4,'mod/quiz:viewreports',1,1484792651,0),(825,1,3,'mod/quiz:viewreports',1,1484792651,0),(826,1,1,'mod/quiz:viewreports',1,1484792651,0),(827,1,3,'mod/quiz:deleteattempts',1,1484792651,0),(828,1,1,'mod/quiz:deleteattempts',1,1484792651,0),(829,1,6,'mod/resource:view',1,1484792652,0),(830,1,7,'mod/resource:view',1,1484792652,0),(831,1,3,'mod/resource:addinstance',1,1484792652,0),(832,1,1,'mod/resource:addinstance',1,1484792652,0),(833,1,3,'mod/scorm:addinstance',1,1484792652,0),(834,1,1,'mod/scorm:addinstance',1,1484792652,0),(835,1,4,'mod/scorm:viewreport',1,1484792652,0),(836,1,3,'mod/scorm:viewreport',1,1484792652,0),(837,1,1,'mod/scorm:viewreport',1,1484792652,0),(838,1,5,'mod/scorm:skipview',1,1484792652,0),(839,1,5,'mod/scorm:savetrack',1,1484792652,0),(840,1,4,'mod/scorm:savetrack',1,1484792652,0),(841,1,3,'mod/scorm:savetrack',1,1484792652,0),(842,1,1,'mod/scorm:savetrack',1,1484792652,0),(843,1,5,'mod/scorm:viewscores',1,1484792652,0),(844,1,4,'mod/scorm:viewscores',1,1484792652,0),(845,1,3,'mod/scorm:viewscores',1,1484792652,0),(846,1,1,'mod/scorm:viewscores',1,1484792652,0),(847,1,4,'mod/scorm:deleteresponses',1,1484792652,0),(848,1,3,'mod/scorm:deleteresponses',1,1484792652,0),(849,1,1,'mod/scorm:deleteresponses',1,1484792652,0),(850,1,3,'mod/survey:addinstance',1,1484792652,0),(851,1,1,'mod/survey:addinstance',1,1484792652,0),(852,1,5,'mod/survey:participate',1,1484792652,0),(853,1,4,'mod/survey:participate',1,1484792652,0),(854,1,3,'mod/survey:participate',1,1484792652,0),(855,1,1,'mod/survey:participate',1,1484792652,0),(856,1,4,'mod/survey:readresponses',1,1484792652,0),(857,1,3,'mod/survey:readresponses',1,1484792652,0),(858,1,1,'mod/survey:readresponses',1,1484792652,0),(859,1,4,'mod/survey:download',1,1484792652,0),(860,1,3,'mod/survey:download',1,1484792652,0),(861,1,1,'mod/survey:download',1,1484792652,0),(862,1,6,'mod/url:view',1,1484792652,0),(863,1,7,'mod/url:view',1,1484792652,0),(864,1,3,'mod/url:addinstance',1,1484792652,0),(865,1,1,'mod/url:addinstance',1,1484792652,0),(866,1,3,'mod/wiki:addinstance',1,1484792652,0),(867,1,1,'mod/wiki:addinstance',1,1484792652,0),(868,1,6,'mod/wiki:viewpage',1,1484792652,0),(869,1,5,'mod/wiki:viewpage',1,1484792652,0),(870,1,4,'mod/wiki:viewpage',1,1484792652,0),(871,1,3,'mod/wiki:viewpage',1,1484792652,0),(872,1,1,'mod/wiki:viewpage',1,1484792652,0),(873,1,5,'mod/wiki:editpage',1,1484792652,0),(874,1,4,'mod/wiki:editpage',1,1484792652,0),(875,1,3,'mod/wiki:editpage',1,1484792652,0),(876,1,1,'mod/wiki:editpage',1,1484792652,0),(877,1,5,'mod/wiki:createpage',1,1484792652,0),(878,1,4,'mod/wiki:createpage',1,1484792652,0),(879,1,3,'mod/wiki:createpage',1,1484792652,0),(880,1,1,'mod/wiki:createpage',1,1484792653,0),(881,1,5,'mod/wiki:viewcomment',1,1484792653,0),(882,1,4,'mod/wiki:viewcomment',1,1484792653,0),(883,1,3,'mod/wiki:viewcomment',1,1484792653,0),(884,1,1,'mod/wiki:viewcomment',1,1484792653,0),(885,1,5,'mod/wiki:editcomment',1,1484792653,0),(886,1,4,'mod/wiki:editcomment',1,1484792653,0),(887,1,3,'mod/wiki:editcomment',1,1484792653,0),(888,1,1,'mod/wiki:editcomment',1,1484792653,0),(889,1,4,'mod/wiki:managecomment',1,1484792653,0),(890,1,3,'mod/wiki:managecomment',1,1484792653,0),(891,1,1,'mod/wiki:managecomment',1,1484792653,0),(892,1,4,'mod/wiki:managefiles',1,1484792653,0),(893,1,3,'mod/wiki:managefiles',1,1484792653,0),(894,1,1,'mod/wiki:managefiles',1,1484792653,0),(895,1,4,'mod/wiki:overridelock',1,1484792653,0),(896,1,3,'mod/wiki:overridelock',1,1484792653,0),(897,1,1,'mod/wiki:overridelock',1,1484792653,0),(898,1,4,'mod/wiki:managewiki',1,1484792653,0),(899,1,3,'mod/wiki:managewiki',1,1484792653,0),(900,1,1,'mod/wiki:managewiki',1,1484792653,0),(901,1,6,'mod/workshop:view',1,1484792653,0),(902,1,5,'mod/workshop:view',1,1484792653,0),(903,1,4,'mod/workshop:view',1,1484792653,0),(904,1,3,'mod/workshop:view',1,1484792653,0),(905,1,1,'mod/workshop:view',1,1484792653,0),(906,1,3,'mod/workshop:addinstance',1,1484792653,0),(907,1,1,'mod/workshop:addinstance',1,1484792653,0),(908,1,4,'mod/workshop:switchphase',1,1484792653,0),(909,1,3,'mod/workshop:switchphase',1,1484792653,0),(910,1,1,'mod/workshop:switchphase',1,1484792653,0),(911,1,3,'mod/workshop:editdimensions',1,1484792653,0),(912,1,1,'mod/workshop:editdimensions',1,1484792653,0),(913,1,5,'mod/workshop:submit',1,1484792653,0),(914,1,5,'mod/workshop:peerassess',1,1484792653,0),(915,1,4,'mod/workshop:manageexamples',1,1484792653,0),(916,1,3,'mod/workshop:manageexamples',1,1484792653,0),(917,1,1,'mod/workshop:manageexamples',1,1484792653,0),(918,1,4,'mod/workshop:allocate',1,1484792653,0),(919,1,3,'mod/workshop:allocate',1,1484792653,0),(920,1,1,'mod/workshop:allocate',1,1484792653,0),(921,1,4,'mod/workshop:publishsubmissions',1,1484792653,0),(922,1,3,'mod/workshop:publishsubmissions',1,1484792653,0),(923,1,1,'mod/workshop:publishsubmissions',1,1484792653,0),(924,1,5,'mod/workshop:viewauthornames',1,1484792653,0),(925,1,4,'mod/workshop:viewauthornames',1,1484792653,0),(926,1,3,'mod/workshop:viewauthornames',1,1484792653,0),(927,1,1,'mod/workshop:viewauthornames',1,1484792653,0),(928,1,4,'mod/workshop:viewreviewernames',1,1484792653,0),(929,1,3,'mod/workshop:viewreviewernames',1,1484792653,0),(930,1,1,'mod/workshop:viewreviewernames',1,1484792653,0),(931,1,4,'mod/workshop:viewallsubmissions',1,1484792653,0),(932,1,3,'mod/workshop:viewallsubmissions',1,1484792653,0),(933,1,1,'mod/workshop:viewallsubmissions',1,1484792653,0),(934,1,5,'mod/workshop:viewpublishedsubmissions',1,1484792653,0),(935,1,4,'mod/workshop:viewpublishedsubmissions',1,1484792653,0),(936,1,3,'mod/workshop:viewpublishedsubmissions',1,1484792653,0),(937,1,1,'mod/workshop:viewpublishedsubmissions',1,1484792653,0),(938,1,5,'mod/workshop:viewauthorpublished',1,1484792653,0),(939,1,4,'mod/workshop:viewauthorpublished',1,1484792653,0),(940,1,3,'mod/workshop:viewauthorpublished',1,1484792653,0),(941,1,1,'mod/workshop:viewauthorpublished',1,1484792653,0),(942,1,4,'mod/workshop:viewallassessments',1,1484792653,0),(943,1,3,'mod/workshop:viewallassessments',1,1484792653,0),(944,1,1,'mod/workshop:viewallassessments',1,1484792653,0),(945,1,4,'mod/workshop:overridegrades',1,1484792653,0),(946,1,3,'mod/workshop:overridegrades',1,1484792653,0),(947,1,1,'mod/workshop:overridegrades',1,1484792653,0),(948,1,4,'mod/workshop:ignoredeadlines',1,1484792653,0),(949,1,3,'mod/workshop:ignoredeadlines',1,1484792653,0),(950,1,1,'mod/workshop:ignoredeadlines',1,1484792653,0),(951,1,4,'mod/workshop:deletesubmissions',1,1484792653,0),(952,1,3,'mod/workshop:deletesubmissions',1,1484792653,0),(953,1,1,'mod/workshop:deletesubmissions',1,1484792653,0),(954,1,1,'mod/workshop:exportsubmissions',1,1484792653,0),(955,1,4,'mod/workshop:exportsubmissions',1,1484792653,0),(956,1,3,'mod/workshop:exportsubmissions',1,1484792653,0),(957,1,5,'mod/workshop:exportsubmissions',1,1484792653,0),(958,1,1,'enrol/category:config',1,1484792654,0),(959,1,3,'enrol/category:config',1,1484792654,0),(960,1,3,'enrol/cohort:config',1,1484792654,0),(961,1,1,'enrol/cohort:config',1,1484792654,0),(962,1,1,'enrol/cohort:unenrol',1,1484792654,0),(963,1,1,'enrol/database:unenrol',1,1484792654,0),(964,1,1,'enrol/database:config',1,1484792654,0),(965,1,3,'enrol/database:config',1,1484792654,0),(966,1,1,'enrol/guest:config',1,1484792654,0),(967,1,3,'enrol/guest:config',1,1484792654,0),(968,1,1,'enrol/imsenterprise:config',1,1484792654,0),(969,1,3,'enrol/imsenterprise:config',1,1484792654,0),(970,1,1,'enrol/ldap:manage',1,1484792654,0),(971,1,1,'enrol/lti:config',1,1484792655,0),(972,1,3,'enrol/lti:config',1,1484792655,0),(973,1,1,'enrol/lti:unenrol',1,1484792655,0),(974,1,3,'enrol/lti:unenrol',1,1484792655,0),(975,1,1,'enrol/manual:config',1,1484792655,0),(976,1,1,'enrol/manual:enrol',1,1484792655,0),(977,1,3,'enrol/manual:enrol',1,1484792655,0),(978,1,1,'enrol/manual:manage',1,1484792655,0),(979,1,3,'enrol/manual:manage',1,1484792655,0),(980,1,1,'enrol/manual:unenrol',1,1484792655,0),(981,1,3,'enrol/manual:unenrol',1,1484792655,0),(982,1,1,'enrol/meta:config',1,1484792655,0),(983,1,3,'enrol/meta:config',1,1484792655,0),(984,1,1,'enrol/meta:selectaslinked',1,1484792655,0),(985,1,1,'enrol/meta:unenrol',1,1484792655,0),(986,1,1,'enrol/mnet:config',1,1484792655,0),(987,1,3,'enrol/mnet:config',1,1484792655,0),(988,1,1,'enrol/paypal:config',1,1484792655,0),(989,1,1,'enrol/paypal:manage',1,1484792655,0),(990,1,3,'enrol/paypal:manage',1,1484792655,0),(991,1,1,'enrol/paypal:unenrol',1,1484792655,0),(992,1,3,'enrol/self:config',1,1484792655,0),(993,1,1,'enrol/self:config',1,1484792655,0),(994,1,3,'enrol/self:manage',1,1484792655,0),(995,1,1,'enrol/self:manage',1,1484792655,0),(996,1,5,'enrol/self:unenrolself',1,1484792655,0),(997,1,3,'enrol/self:unenrol',1,1484792655,0),(998,1,1,'enrol/self:unenrol',1,1484792655,0),(999,1,7,'message/airnotifier:managedevice',1,1484792655,0),(1000,1,3,'block/activity_modules:addinstance',1,1484792655,0),(1001,1,1,'block/activity_modules:addinstance',1,1484792655,0),(1002,1,3,'block/activity_results:addinstance',1,1484792656,0),(1003,1,1,'block/activity_results:addinstance',1,1484792656,0),(1004,1,7,'block/admin_bookmarks:myaddinstance',1,1484792656,0),(1005,1,3,'block/admin_bookmarks:addinstance',1,1484792656,0),(1006,1,1,'block/admin_bookmarks:addinstance',1,1484792656,0),(1007,1,3,'block/badges:addinstance',1,1484792656,0),(1008,1,1,'block/badges:addinstance',1,1484792656,0),(1009,1,7,'block/badges:myaddinstance',1,1484792656,0),(1010,1,3,'block/blog_menu:addinstance',1,1484792656,0),(1011,1,1,'block/blog_menu:addinstance',1,1484792656,0),(1012,1,3,'block/blog_recent:addinstance',1,1484792656,0),(1013,1,1,'block/blog_recent:addinstance',1,1484792656,0),(1014,1,3,'block/blog_tags:addinstance',1,1484792656,0),(1015,1,1,'block/blog_tags:addinstance',1,1484792656,0),(1016,1,7,'block/calendar_month:myaddinstance',1,1484792656,0),(1017,1,3,'block/calendar_month:addinstance',1,1484792656,0),(1018,1,1,'block/calendar_month:addinstance',1,1484792656,0),(1019,1,7,'block/calendar_upcoming:myaddinstance',1,1484792656,0),(1020,1,3,'block/calendar_upcoming:addinstance',1,1484792656,0),(1021,1,1,'block/calendar_upcoming:addinstance',1,1484792656,0),(1022,1,7,'block/comments:myaddinstance',1,1484792656,0),(1023,1,3,'block/comments:addinstance',1,1484792656,0),(1024,1,1,'block/comments:addinstance',1,1484792656,0),(1025,1,7,'block/community:myaddinstance',1,1484792656,0),(1026,1,3,'block/community:addinstance',1,1484792656,0),(1027,1,1,'block/community:addinstance',1,1484792656,0),(1028,1,3,'block/completionstatus:addinstance',1,1484792656,0),(1029,1,1,'block/completionstatus:addinstance',1,1484792656,0),(1030,1,7,'block/course_list:myaddinstance',1,1484792656,0),(1031,1,3,'block/course_list:addinstance',1,1484792656,0),(1032,1,1,'block/course_list:addinstance',1,1484792656,0),(1033,1,7,'block/course_overview:myaddinstance',1,1484792656,0),(1034,1,3,'block/course_overview:addinstance',1,1484792656,0),(1035,1,1,'block/course_overview:addinstance',1,1484792656,0),(1036,1,3,'block/course_summary:addinstance',1,1484792656,0),(1037,1,1,'block/course_summary:addinstance',1,1484792656,0),(1038,1,3,'block/feedback:addinstance',1,1484792656,0),(1039,1,1,'block/feedback:addinstance',1,1484792656,0),(1040,1,7,'block/globalsearch:myaddinstance',1,1484792656,0),(1041,1,3,'block/globalsearch:addinstance',1,1484792656,0),(1042,1,1,'block/globalsearch:addinstance',1,1484792656,0),(1043,1,7,'block/glossary_random:myaddinstance',1,1484792656,0),(1044,1,3,'block/glossary_random:addinstance',1,1484792656,0),(1045,1,1,'block/glossary_random:addinstance',1,1484792656,0),(1046,1,7,'block/html:myaddinstance',1,1484792656,0),(1047,1,3,'block/html:addinstance',1,1484792657,0),(1048,1,1,'block/html:addinstance',1,1484792657,0),(1049,1,3,'block/login:addinstance',1,1484792657,0),(1050,1,1,'block/login:addinstance',1,1484792657,0),(1051,1,3,'block/lp:addinstance',1,1484792657,0),(1052,1,1,'block/lp:addinstance',1,1484792657,0),(1053,1,7,'block/lp:myaddinstance',1,1484792657,0),(1054,1,7,'block/lp:view',1,1484792657,0),(1055,1,7,'block/mentees:myaddinstance',1,1484792657,0),(1056,1,3,'block/mentees:addinstance',1,1484792657,0),(1057,1,1,'block/mentees:addinstance',1,1484792657,0),(1058,1,7,'block/messages:myaddinstance',1,1484792657,0),(1059,1,3,'block/messages:addinstance',1,1484792657,0),(1060,1,1,'block/messages:addinstance',1,1484792657,0),(1061,1,7,'block/mnet_hosts:myaddinstance',1,1484792657,0),(1062,1,3,'block/mnet_hosts:addinstance',1,1484792657,0),(1063,1,1,'block/mnet_hosts:addinstance',1,1484792657,0),(1064,1,7,'block/myprofile:myaddinstance',1,1484792657,0),(1065,1,3,'block/myprofile:addinstance',1,1484792657,0),(1066,1,1,'block/myprofile:addinstance',1,1484792657,0),(1067,1,7,'block/navigation:myaddinstance',1,1484792657,0),(1068,1,3,'block/navigation:addinstance',1,1484792657,0),(1069,1,1,'block/navigation:addinstance',1,1484792657,0),(1070,1,7,'block/news_items:myaddinstance',1,1484792657,0),(1071,1,3,'block/news_items:addinstance',1,1484792657,0),(1072,1,1,'block/news_items:addinstance',1,1484792657,0),(1073,1,7,'block/online_users:myaddinstance',1,1484792657,0),(1074,1,3,'block/online_users:addinstance',1,1484792657,0),(1075,1,1,'block/online_users:addinstance',1,1484792657,0),(1076,1,7,'block/online_users:viewlist',1,1484792657,0),(1077,1,6,'block/online_users:viewlist',1,1484792657,0),(1078,1,5,'block/online_users:viewlist',1,1484792657,0),(1079,1,4,'block/online_users:viewlist',1,1484792657,0),(1080,1,3,'block/online_users:viewlist',1,1484792657,0),(1081,1,1,'block/online_users:viewlist',1,1484792657,0),(1082,1,3,'block/participants:addinstance',1,1484792657,0),(1083,1,1,'block/participants:addinstance',1,1484792657,0),(1084,1,7,'block/private_files:myaddinstance',1,1484792657,0),(1085,1,3,'block/private_files:addinstance',1,1484792657,0),(1086,1,1,'block/private_files:addinstance',1,1484792657,0),(1087,1,3,'block/quiz_results:addinstance',1,1484792657,0),(1088,1,1,'block/quiz_results:addinstance',1,1484792657,0),(1089,1,3,'block/recent_activity:addinstance',1,1484792657,0),(1090,1,1,'block/recent_activity:addinstance',1,1484792657,0),(1091,1,7,'block/recent_activity:viewaddupdatemodule',1,1484792657,0),(1092,1,7,'block/recent_activity:viewdeletemodule',1,1484792657,0),(1093,1,7,'block/rss_client:myaddinstance',1,1484792657,0),(1094,1,3,'block/rss_client:addinstance',1,1484792657,0),(1095,1,1,'block/rss_client:addinstance',1,1484792657,0),(1096,1,4,'block/rss_client:manageownfeeds',1,1484792657,0),(1097,1,3,'block/rss_client:manageownfeeds',1,1484792657,0),(1098,1,1,'block/rss_client:manageownfeeds',1,1484792657,0),(1099,1,1,'block/rss_client:manageanyfeeds',1,1484792657,0),(1100,1,3,'block/search_forums:addinstance',1,1484792657,0),(1101,1,1,'block/search_forums:addinstance',1,1484792657,0),(1102,1,3,'block/section_links:addinstance',1,1484792657,0),(1103,1,1,'block/section_links:addinstance',1,1484792657,0),(1104,1,3,'block/selfcompletion:addinstance',1,1484792658,0),(1105,1,1,'block/selfcompletion:addinstance',1,1484792658,0),(1106,1,7,'block/settings:myaddinstance',1,1484792658,0),(1107,1,3,'block/settings:addinstance',1,1484792658,0),(1108,1,1,'block/settings:addinstance',1,1484792658,0),(1109,1,3,'block/site_main_menu:addinstance',1,1484792658,0),(1110,1,1,'block/site_main_menu:addinstance',1,1484792658,0),(1111,1,3,'block/social_activities:addinstance',1,1484792658,0),(1112,1,1,'block/social_activities:addinstance',1,1484792658,0),(1113,1,3,'block/tag_flickr:addinstance',1,1484792658,0),(1114,1,1,'block/tag_flickr:addinstance',1,1484792658,0),(1115,1,3,'block/tag_youtube:addinstance',1,1484792658,0),(1116,1,1,'block/tag_youtube:addinstance',1,1484792658,0),(1117,1,7,'block/tags:myaddinstance',1,1484792658,0),(1118,1,3,'block/tags:addinstance',1,1484792658,0),(1119,1,1,'block/tags:addinstance',1,1484792658,0),(1120,1,4,'report/completion:view',1,1484792660,0),(1121,1,3,'report/completion:view',1,1484792660,0),(1122,1,1,'report/completion:view',1,1484792660,0),(1123,1,4,'report/courseoverview:view',1,1484792660,0),(1124,1,3,'report/courseoverview:view',1,1484792660,0),(1125,1,1,'report/courseoverview:view',1,1484792660,0),(1126,1,4,'report/log:view',1,1484792660,0),(1127,1,3,'report/log:view',1,1484792660,0),(1128,1,1,'report/log:view',1,1484792660,0),(1129,1,4,'report/log:viewtoday',1,1484792660,0),(1130,1,3,'report/log:viewtoday',1,1484792660,0),(1131,1,1,'report/log:viewtoday',1,1484792660,0),(1132,1,4,'report/loglive:view',1,1484792660,0),(1133,1,3,'report/loglive:view',1,1484792660,0),(1134,1,1,'report/loglive:view',1,1484792660,0),(1135,1,4,'report/outline:view',1,1484792660,0),(1136,1,3,'report/outline:view',1,1484792660,0),(1137,1,1,'report/outline:view',1,1484792660,0),(1138,1,4,'report/participation:view',1,1484792660,0),(1139,1,3,'report/participation:view',1,1484792660,0),(1140,1,1,'report/participation:view',1,1484792660,0),(1141,1,1,'report/performance:view',1,1484792660,0),(1142,1,4,'report/progress:view',1,1484792660,0),(1143,1,3,'report/progress:view',1,1484792660,0),(1144,1,1,'report/progress:view',1,1484792660,0),(1145,1,1,'report/security:view',1,1484792660,0),(1146,1,4,'report/stats:view',1,1484792660,0),(1147,1,3,'report/stats:view',1,1484792660,0),(1148,1,1,'report/stats:view',1,1484792660,0),(1149,1,6,'report/usersessions:manageownsessions',-1000,1484792660,0),(1150,1,7,'report/usersessions:manageownsessions',1,1484792660,0),(1151,1,1,'report/usersessions:manageownsessions',1,1484792660,0),(1152,1,4,'gradeexport/ods:view',1,1484792660,0),(1153,1,3,'gradeexport/ods:view',1,1484792660,0),(1154,1,1,'gradeexport/ods:view',1,1484792660,0),(1155,1,1,'gradeexport/ods:publish',1,1484792660,0),(1156,1,4,'gradeexport/txt:view',1,1484792660,0),(1157,1,3,'gradeexport/txt:view',1,1484792660,0),(1158,1,1,'gradeexport/txt:view',1,1484792660,0),(1159,1,1,'gradeexport/txt:publish',1,1484792660,0),(1160,1,4,'gradeexport/xls:view',1,1484792660,0),(1161,1,3,'gradeexport/xls:view',1,1484792660,0),(1162,1,1,'gradeexport/xls:view',1,1484792660,0),(1163,1,1,'gradeexport/xls:publish',1,1484792660,0),(1164,1,4,'gradeexport/xml:view',1,1484792660,0),(1165,1,3,'gradeexport/xml:view',1,1484792660,0),(1166,1,1,'gradeexport/xml:view',1,1484792660,0),(1167,1,1,'gradeexport/xml:publish',1,1484792660,0),(1168,1,3,'gradeimport/csv:view',1,1484792660,0),(1169,1,1,'gradeimport/csv:view',1,1484792660,0),(1170,1,3,'gradeimport/direct:view',1,1484792660,0),(1171,1,1,'gradeimport/direct:view',1,1484792660,0),(1172,1,3,'gradeimport/xml:view',1,1484792661,0),(1173,1,1,'gradeimport/xml:view',1,1484792661,0),(1174,1,1,'gradeimport/xml:publish',1,1484792661,0),(1175,1,4,'gradereport/grader:view',1,1484792661,0),(1176,1,3,'gradereport/grader:view',1,1484792661,0),(1177,1,1,'gradereport/grader:view',1,1484792661,0),(1178,1,4,'gradereport/history:view',1,1484792661,0),(1179,1,3,'gradereport/history:view',1,1484792661,0),(1180,1,1,'gradereport/history:view',1,1484792661,0),(1181,1,4,'gradereport/outcomes:view',1,1484792661,0),(1182,1,3,'gradereport/outcomes:view',1,1484792661,0),(1183,1,1,'gradereport/outcomes:view',1,1484792661,0),(1184,1,5,'gradereport/overview:view',1,1484792661,0),(1185,1,1,'gradereport/overview:view',1,1484792661,0),(1186,1,3,'gradereport/singleview:view',1,1484792661,0),(1187,1,1,'gradereport/singleview:view',1,1484792661,0),(1188,1,5,'gradereport/user:view',1,1484792661,0),(1189,1,4,'gradereport/user:view',1,1484792661,0),(1190,1,3,'gradereport/user:view',1,1484792661,0),(1191,1,1,'gradereport/user:view',1,1484792661,0),(1192,1,7,'repository/areafiles:view',1,1484792661,0),(1193,1,7,'repository/boxnet:view',1,1484792661,0),(1194,1,2,'repository/coursefiles:view',1,1484792661,0),(1195,1,4,'repository/coursefiles:view',1,1484792661,0),(1196,1,3,'repository/coursefiles:view',1,1484792661,0),(1197,1,1,'repository/coursefiles:view',1,1484792661,0),(1198,1,7,'repository/dropbox:view',1,1484792661,0),(1199,1,7,'repository/equella:view',1,1484792661,0),(1200,1,2,'repository/filesystem:view',1,1484792662,0),(1201,1,4,'repository/filesystem:view',1,1484792662,0),(1202,1,3,'repository/filesystem:view',1,1484792662,0),(1203,1,1,'repository/filesystem:view',1,1484792662,0),(1204,1,7,'repository/flickr:view',1,1484792662,0),(1205,1,7,'repository/flickr_public:view',1,1484792662,0),(1206,1,7,'repository/googledocs:view',1,1484792662,0),(1207,1,2,'repository/local:view',1,1484792662,0),(1208,1,4,'repository/local:view',1,1484792662,0),(1209,1,3,'repository/local:view',1,1484792662,0),(1210,1,1,'repository/local:view',1,1484792662,0),(1211,1,7,'repository/merlot:view',1,1484792662,0),(1212,1,7,'repository/picasa:view',1,1484792662,0),(1213,1,7,'repository/recent:view',1,1484792662,0),(1214,1,7,'repository/s3:view',1,1484792662,0),(1215,1,7,'repository/skydrive:view',1,1484792662,0),(1216,1,7,'repository/upload:view',1,1484792662,0),(1217,1,7,'repository/url:view',1,1484792662,0),(1218,1,7,'repository/user:view',1,1484792662,0),(1219,1,2,'repository/webdav:view',1,1484792662,0),(1220,1,4,'repository/webdav:view',1,1484792662,0),(1221,1,3,'repository/webdav:view',1,1484792662,0),(1222,1,1,'repository/webdav:view',1,1484792662,0),(1223,1,7,'repository/wikimedia:view',1,1484792662,0),(1224,1,7,'repository/youtube:view',1,1484792662,0),(1225,1,1,'tool/customlang:view',1,1484792664,0),(1226,1,1,'tool/customlang:edit',1,1484792664,0),(1227,1,1,'tool/lpmigrate:frameworksmigrate',1,1484792664,0),(1228,1,4,'tool/monitor:subscribe',1,1484792664,0),(1229,1,3,'tool/monitor:subscribe',1,1484792664,0),(1230,1,1,'tool/monitor:subscribe',1,1484792664,0),(1231,1,4,'tool/monitor:managerules',1,1484792665,0),(1232,1,3,'tool/monitor:managerules',1,1484792665,0),(1233,1,1,'tool/monitor:managerules',1,1484792665,0),(1234,1,1,'tool/monitor:managetool',1,1484792665,0),(1235,1,3,'tool/recyclebin:deleteitems',1,1484792665,0),(1236,1,1,'tool/recyclebin:deleteitems',1,1484792665,0),(1237,1,3,'tool/recyclebin:restoreitems',1,1484792665,0),(1238,1,1,'tool/recyclebin:restoreitems',1,1484792665,0),(1239,1,4,'tool/recyclebin:viewitems',1,1484792665,0),(1240,1,3,'tool/recyclebin:viewitems',1,1484792665,0),(1241,1,1,'tool/recyclebin:viewitems',1,1484792665,0),(1242,1,1,'tool/uploaduser:uploaduserpictures',1,1484792665,0),(1243,1,1,'tool/usertours:managetours',1,1484792665,0),(1244,1,3,'booktool/importhtml:import',1,1484792667,0),(1245,1,1,'booktool/importhtml:import',1,1484792667,0),(1246,1,6,'booktool/print:print',1,1484792667,0),(1247,1,8,'booktool/print:print',1,1484792667,0),(1248,1,5,'booktool/print:print',1,1484792667,0),(1249,1,4,'booktool/print:print',1,1484792667,0),(1250,1,3,'booktool/print:print',1,1484792667,0),(1251,1,1,'booktool/print:print',1,1484792667,0),(1252,1,4,'quiz/grading:viewstudentnames',1,1484792668,0),(1253,1,3,'quiz/grading:viewstudentnames',1,1484792668,0),(1254,1,1,'quiz/grading:viewstudentnames',1,1484792668,0),(1255,1,4,'quiz/grading:viewidnumber',1,1484792668,0),(1256,1,3,'quiz/grading:viewidnumber',1,1484792668,0),(1257,1,1,'quiz/grading:viewidnumber',1,1484792668,0),(1258,1,4,'quiz/statistics:view',1,1484792668,0),(1259,1,3,'quiz/statistics:view',1,1484792668,0),(1260,1,1,'quiz/statistics:view',1,1484792668,0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
INSERT INTO `mdl_scale` VALUES (1,0,0,'Formas de saber: conectada e destacada','Sobretudo saber destacado,Destacado e conectado,Sobretudo saber conectado','A escala é baseada na teoria de conhecimento separado e conectado. Esta teoria descreve duas maneiras diferentes de avaliar e aprender sobre as coisas que vemos e ouvimos.<ul><li><strong>Conhecedores separados</strong> permanecem o mais objetivo possível sem incluir semtimentos e emoções. Em uma discussão com outras pessoas, eles gostam de defender suas próprias idéias, usando lógica para encontrar furos nas idéias de seus oponentes.</li><li><strong>Conhecedores conectados</strong> são mais sensíveis com as outras pessoas. Eles são habilidosos em empatia e preferem ouvir e questionar até que sintam que podem conectar e \"entender as coisas do seu ponto de vista\". Eles aprendem pela tentativa de compartilhar as experiências que levam ao conhecimento que eles encontram nas outras pessoas.</li></ul>',0,1484792640),(2,0,0,'Escala de competência padrão','Ainda não tem a competência,Tem a competência','A escala de classificação binária que fornece nenhuma outra informação além se alguém tem demonstrado proficiência ou não.',0,1484792640);
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `completionstatusallscos` tinyint(1) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (56,0,'8h7nr2lpd7t88getlvsv972qc4',2,NULL,1486666604,1486666818,'177.43.114.204','177.43.114.204'),(58,0,'1rsmgovlftp84fq9v6vmf65qh5',6,NULL,1486666758,1486666806,'177.43.114.204','177.43.114.204'),(61,0,'5lik9si93nf4ko8kgv663f9q04',0,NULL,1486959902,1486959904,'200.149.71.221','200.149.71.221'),(62,0,'rgb5td1famuggo84q3j46egj50',0,NULL,1486993279,1486993285,'191.212.76.217','191.212.76.217'),(63,0,'hcd44tkpuehn5ggs21nihucij5',0,NULL,1487009325,1487009328,'177.43.114.204','177.43.114.204'),(64,0,'nlshbaolt91d071ki3ttopksg2',0,NULL,1487012897,1487012898,'177.43.114.204','177.43.114.204'),(67,0,'0chtv6ggggn3vgru0t53776e05',0,NULL,1487039150,1487039151,'200.149.71.221','200.149.71.221'),(69,0,'uhvrfago61v5ln3j45n39ntnv7',2,NULL,1487114287,1487114495,'186.248.79.125','186.248.79.125'),(70,0,'i3ljv5jol4f5v6vrn9om8gsu77',0,NULL,1487258613,1487258662,'177.43.114.204','177.43.114.204'),(71,0,'patsvg71ts2270rs44aeo9ujc1',0,NULL,1487268029,1487268029,'191.187.25.112','191.187.25.112'),(73,0,'hgh04f94rgb52ckdl72lhpni91',2,NULL,1487542301,1487542889,'187.59.181.127','187.59.181.127');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44',0),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44',0),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44',0),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68',0),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73',0);
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `tagcollid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  KEY `mdl_tag_use_ix` (`userid`),
  KEY `mdl_tag_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
INSERT INTO `mdl_tag` VALUES (1,2,1,'tags blablabl','tags blablabl',0,NULL,0,0,1486953621);
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_area`
--

DROP TABLE IF EXISTS `mdl_tag_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_area` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint(10) NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callbackfile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  KEY `mdl_tagarea_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines various tag areas, one area is identified by compone';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_area`
--

LOCK TABLES `mdl_tag_area` WRITE;
/*!40000 ALTER TABLE `mdl_tag_area` DISABLE KEYS */;
INSERT INTO `mdl_tag_area` VALUES (1,'core','user',1,1,'user_get_tagged_users','/user/lib.php',2),(2,'core','course',1,1,'course_get_tagged_courses','/course/lib.php',0),(3,'core_question','question',1,1,NULL,NULL,0),(4,'core','post',1,1,'blog_get_tagged_posts','/blog/lib.php',0),(5,'core','blog_external',1,1,NULL,NULL,0),(6,'core','course_modules',1,1,'course_get_tagged_course_modules','/course/lib.php',0),(7,'mod_wiki','wiki_pages',1,1,'mod_wiki_get_tagged_pages','/mod/wiki/locallib.php',0);
/*!40000 ALTER TABLE `mdl_tag_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_coll`
--

DROP TABLE IF EXISTS `mdl_tag_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_coll` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isdefault` tinyint(2) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortorder` mediumint(5) NOT NULL DEFAULT '0',
  `searchable` tinyint(2) NOT NULL DEFAULT '1',
  `customurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines different set of tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_coll`
--

LOCK TABLES `mdl_tag_coll` WRITE;
/*!40000 ALTER TABLE `mdl_tag_coll` DISABLE KEYS */;
INSERT INTO `mdl_tag_coll` VALUES (1,NULL,1,NULL,0,1,NULL);
/*!40000 ALTER TABLE `mdl_tag_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_comiteitetiuta_uix` (`component`,`itemtype`,`itemid`,`tiuserid`,`tagid`),
  KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
INSERT INTO `mdl_tag_instance` VALUES (1,1,'core','course',2,48,0,0,1486953621,1486953621);
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_adhoc`
--

DROP TABLE IF EXISTS `mdl_task_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext COLLATE utf8_unicode_ci,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of adhoc tasks waiting to run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_adhoc`
--

LOCK TABLES `mdl_task_adhoc` WRITE;
/*!40000 ALTER TABLE `mdl_task_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_task_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_scheduled`
--

DROP TABLE IF EXISTS `mdl_task_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of scheduled tasks to be run by cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_scheduled`
--

LOCK TABLES `mdl_task_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_task_scheduled` DISABLE KEYS */;
INSERT INTO `mdl_task_scheduled` VALUES (1,'moodle','\\core\\task\\session_cleanup_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(2,'moodle','\\core\\task\\delete_unconfirmed_users_task',0,1484794800,0,'0','*','*','*','*',0,0,0),(3,'moodle','\\core\\task\\delete_incomplete_users_task',0,1484795100,0,'5','*','*','*','*',0,0,0),(4,'moodle','\\core\\task\\backup_cleanup_task',0,1484795400,0,'10','*','*','*','*',0,0,0),(5,'moodle','\\core\\task\\tag_cron_task',0,1484795400,0,'10','3','*','*','*',0,0,0),(6,'moodle','\\core\\task\\context_cleanup_task',0,1484792700,0,'25','*','*','*','*',0,0,0),(7,'moodle','\\core\\task\\cache_cleanup_task',0,1484793000,0,'30','*','*','*','*',0,0,0),(8,'moodle','\\core\\task\\messaging_cleanup_task',0,1484793300,0,'35','*','*','*','*',0,0,0),(9,'moodle','\\core\\task\\send_new_user_passwords_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(10,'moodle','\\core\\task\\send_failed_login_notifications_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(11,'moodle','\\core\\task\\create_contexts_task',0,1484870400,1,'0','0','*','*','*',0,0,0),(12,'moodle','\\core\\task\\legacy_plugin_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(13,'moodle','\\core\\task\\grade_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(14,'moodle','\\core\\task\\events_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(15,'moodle','\\core\\task\\completion_regular_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(16,'moodle','\\core\\task\\completion_daily_task',0,1484850000,0,'20','18','*','*','*',0,0,0),(17,'moodle','\\core\\task\\portfolio_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(18,'moodle','\\core\\task\\plagiarism_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(19,'moodle','\\core\\task\\calendar_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(20,'moodle','\\core\\task\\blog_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(21,'moodle','\\core\\task\\question_cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(22,'moodle','\\core\\task\\registration_cron_task',0,1485162900,0,'15','9','*','*','1',0,0,0),(23,'moodle','\\core\\task\\check_for_updates_task',0,1484798400,0,'0','*/2','*','*','*',0,0,0),(24,'moodle','\\core\\task\\cache_cron_task',0,1484794200,0,'50','*','*','*','*',0,0,0),(25,'moodle','\\core\\task\\automated_backup_task',0,1484794200,0,'50','*','*','*','*',0,0,0),(26,'moodle','\\core\\task\\badges_cron_task',0,1484792700,0,'*/5','*','*','*','*',0,0,0),(27,'moodle','\\core\\task\\file_temp_cleanup_task',0,1484808900,0,'55','*/6','*','*','*',0,0,0),(28,'moodle','\\core\\task\\file_trash_cleanup_task',0,1484808900,0,'55','*/6','*','*','*',0,0,0),(29,'moodle','\\core\\task\\search_index_task',0,1484793000,0,'*/30','*','*','*','*',0,0,0),(30,'moodle','\\core\\task\\search_optimize_task',0,1484828100,0,'15','*/12','*','*','*',0,0,0),(31,'moodle','\\core\\task\\stats_cron_task',0,1484870400,0,'0','0','*','*','*',0,0,0),(32,'moodle','\\core\\task\\password_reset_cleanup_task',0,1484805600,0,'0','*/6','*','*','*',0,0,0),(33,'moodle','\\core\\task\\complete_plans_task',0,1484794920,0,'2','*','*','*','*',0,0,0),(34,'moodle','\\core\\task\\sync_plans_from_template_cohorts_task',0,1484795880,0,'18','*','*','*','*',0,0,0),(35,'mod_forum','\\mod_forum\\task\\cron_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(36,'auth_cas','\\auth_cas\\task\\sync_task',0,1484870400,0,'0','0','*','*','*',0,0,1),(37,'auth_ldap','\\auth_ldap\\task\\sync_task',0,1484870400,0,'0','0','*','*','*',0,0,1),(38,'enrol_flatfile','\\enrol_flatfile\\task\\flatfile_sync_task',0,1484795700,0,'15','*','*','*','*',0,0,0),(39,'enrol_imsenterprise','\\enrol_imsenterprise\\task\\cron_task',0,1484795400,0,'10','*','*','*','*',0,0,0),(40,'enrol_lti','\\enrol_lti\\task\\sync_grades',0,1484793000,0,'*/30','*','*','*','*',0,0,0),(41,'enrol_lti','\\enrol_lti\\task\\sync_members',0,1484793000,0,'*/30','*','*','*','*',0,0,0),(42,'editor_atto','\\editor_atto\\task\\autosave_cleanup_task',0,1485206040,0,'14','21','*','*','1',0,0,0),(43,'tool_cohortroles','\\tool_cohortroles\\task\\cohort_role_sync',0,1484795160,0,'6','*','*','*','*',0,0,0),(44,'tool_langimport','\\tool_langimport\\task\\update_langpacks_task',0,1484799720,0,'22','4','*','*','*',0,0,0),(45,'tool_messageinbound','\\tool_messageinbound\\task\\pickup_task',0,1484792700,0,'*','*','*','*','*',0,0,0),(46,'tool_messageinbound','\\tool_messageinbound\\task\\cleanup_task',0,1484877300,0,'55','1','*','*','*',0,0,0),(47,'tool_monitor','\\tool_monitor\\task\\clean_events',0,1484792700,0,'*','*','*','*','*',0,0,0),(48,'tool_monitor','\\tool_monitor\\task\\check_subscriptions',0,1484824200,0,'10','11','*','*','*',0,0,0),(49,'tool_recyclebin','\\tool_recyclebin\\task\\cleanup_course_bin',0,1484793000,0,'*/30','*','*','*','*',0,0,0),(50,'tool_recyclebin','\\tool_recyclebin\\task\\cleanup_category_bin',0,1484793000,0,'*/30','*','*','*','*',0,0,0),(51,'assignfeedback_editpdf','\\assignfeedback_editpdf\\task\\convert_submissions',0,1484793000,0,'*/15','*','*','*','*',0,0,0),(52,'logstore_legacy','\\logstore_legacy\\task\\cleanup_task',0,1484802660,0,'11','5','*','*','*',0,0,0),(53,'logstore_standard','\\logstore_standard\\task\\cleanup_task',0,1484798400,0,'0','4','*','*','*',0,0,0);
/*!40000 ALTER TABLE `mdl_task_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_cohortroles`
--

DROP TABLE IF EXISTS `mdl_tool_cohortroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_cohortroles` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Mapping of users to cohort role assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_cohortroles`
--

LOCK TABLES `mdl_tool_cohortroles` WRITE;
/*!40000 ALTER TABLE `mdl_tool_cohortroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_cohortroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_events`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that keeps a log of events related to subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_events`
--

LOCK TABLES `mdl_tool_monitor_events` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_history`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store history of message notifications sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_history`
--

LOCK TABLES `mdl_tool_monitor_history` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_rules`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_rules`
--

LOCK TABLES `mdl_tool_monitor_rules` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  `inactivedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store user subscriptions to various rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_subscriptions`
--

LOCK TABLES `mdl_tool_monitor_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_recyclebin_category`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_recyclebin_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of items in the category recycle bin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_recyclebin_category`
--

LOCK TABLES `mdl_tool_recyclebin_category` WRITE;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_recyclebin_course`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_recyclebin_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `section` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycour_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of items in the course recycle bin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_recyclebin_course`
--

LOCK TABLES `mdl_tool_recyclebin_course` WRITE;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_usertours_steps`
--

DROP TABLE IF EXISTS `mdl_tool_usertours_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_usertours_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tourid` bigint(10) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `targettype` tinyint(2) NOT NULL,
  `targetvalue` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tooluserstep_tousor_ix` (`tourid`,`sortorder`),
  KEY `mdl_tooluserstep_tou_ix` (`tourid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Steps in an tour';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_usertours_steps`
--

LOCK TABLES `mdl_tool_usertours_steps` WRITE;
/*!40000 ALTER TABLE `mdl_tool_usertours_steps` DISABLE KEYS */;
INSERT INTO `mdl_tool_usertours_steps` VALUES (1,1,'tour1_title_welcome,tool_usertours','tour1_content_welcome,tool_usertours',2,'',0,'{}'),(2,1,'tour1_title_navigation,tool_usertours','tour1_content_navigation,tool_usertours',0,'[data-region=\"drawer-toggle\"] button[data-action=\"toggle-drawer\"]',1,'{}'),(3,1,'tour1_title_customisation,tool_usertours','tour1_content_customisation,tool_usertours',0,'body:not(.editing) #page-header .card-block',2,'{\"placement\":\"bottom\"}'),(4,1,'tour1_title_blockregion,tool_usertours','tour1_content_blockregion,tool_usertours',0,'body.editing [data-region=\"blocks-column\"]',3,'{}'),(5,1,'tour1_title_addingblocks,tool_usertours','tour1_content_addingblocks,tool_usertours',0,'body.editing [data-region=\"blocks-column\"]',4,'{\"placement\":\"bottom\"}'),(6,1,'tour1_title_end,tool_usertours','tour1_content_end,tool_usertours',2,'',5,'{}'),(7,2,'tour2_title_welcome,tool_usertours','tour2_content_welcome,tool_usertours',2,'',0,'{}'),(8,2,'tour2_title_customisation,tool_usertours','tour2_content_customisation,tool_usertours',0,'body:not(.editing) #page-header .card-block',1,'{}'),(9,2,'tour2_title_navigation,tool_usertours','tour2_content_navigation,tool_usertours',0,'[data-region=\"drawer-toggle\"] button[data-action=\"toggle-drawer\"]',2,'{}'),(10,2,'tour2_title_opendrawer,tool_usertours','tour2_content_opendrawer,tool_usertours',0,'body:not(.drawer-open-left) [data-region=\"drawer-toggle\"] button[data-action=\"toggle-drawer\"]',3,'{}'),(11,2,'tour2_title_participants,tool_usertours','tour2_content_participants,tool_usertours',0,'body.drawer-open-left [data-region=\"drawer\"] [data-key=\"participants\"]',4,'{\"placement\":\"bottom\",\"backdrop\":\"0\"}'),(12,2,'tour2_title_addblock,tool_usertours','tour2_content_addblock,tool_usertours',0,'body.drawer-open-left:not(.editing) [data-region=\"drawer\"]',5,'{\"placement\":\"right\",\"orphan\":\"0\",\"backdrop\":\"0\",\"reflex\":\"0\"}'),(13,2,'tour2_title_addingblocks,tool_usertours','tour2_content_addingblocks,tool_usertours',0,'body.drawer-open-left.editing [data-region=\"drawer\"] [data-key=\"addblock\"]',6,'{\"backdrop\":\"0\",\"placement\":\"top\"}'),(14,2,'tour2_title_end,tool_usertours','tour2_content_end,tool_usertours',2,'',7,'{}');
/*!40000 ALTER TABLE `mdl_tool_usertours_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_usertours_tours`
--

DROP TABLE IF EXISTS `mdl_tool_usertours_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_usertours_tours` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `pathmatch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of tours';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_usertours_tours`
--

LOCK TABLES `mdl_tool_usertours_tours` WRITE;
/*!40000 ALTER TABLE `mdl_tool_usertours_tours` DISABLE KEYS */;
INSERT INTO `mdl_tool_usertours_tours` VALUES (1,'Boost - administrator','A tour of some new features in the Boost theme, for administrators','FRONTPAGE',1,0,'{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"role\":[\"-1\"],\"theme\":[\"boost\"]},\"majorupdatetime\":1479366244,\"default_tour\":true,\"filename\":\"boost_administrator.json\",\"version\":1,\"shipped_tour\":true,\"shipped_filename\":\"boost_administrator.json\",\"shipped_version\":1}'),(2,'Boost - course view','A tour for introducing administrators and teachers to courses in the Boost theme','/course/view.php%',1,1,'{\"placement\":\"bottom\",\"orphan\":\"0\",\"backdrop\":\"1\",\"reflex\":\"0\",\"filtervalues\":{\"role\":[\"-1\",\"editingteacher\"],\"theme\":[\"boost\"]},\"majorupdatetime\":1480050104,\"shipped_tour\":true,\"shipped_filename\":\"boost_course_view.json\",\"shipped_version\":1}');
/*!40000 ALTER TABLE `mdl_tool_usertours_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2016120501','2016120501','Upgrade savepoint reached',NULL,'',0,1484792640),(2,0,'core','2016120501','2016120501','Core installed',NULL,'',0,1484792647),(3,0,'antivirus_clamav',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(4,0,'antivirus_clamav','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(5,0,'antivirus_clamav','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(6,0,'availability_completion',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(7,0,'availability_completion','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(8,0,'availability_completion','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(9,0,'availability_date',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(10,0,'availability_date','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(11,0,'availability_date','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(12,0,'availability_grade',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(13,0,'availability_grade','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(14,0,'availability_grade','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(15,0,'availability_group',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(16,0,'availability_group','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(17,0,'availability_group','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(18,0,'availability_grouping',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(19,0,'availability_grouping','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(20,0,'availability_grouping','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(21,0,'availability_profile',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(22,0,'availability_profile','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(23,0,'availability_profile','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(24,0,'qtype_calculated',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(25,0,'qtype_calculated','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(26,0,'qtype_calculated','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(27,0,'qtype_calculatedmulti',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(28,0,'qtype_calculatedmulti','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(29,0,'qtype_calculatedmulti','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(30,0,'qtype_calculatedsimple',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(31,0,'qtype_calculatedsimple','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(32,0,'qtype_calculatedsimple','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(33,0,'qtype_ddimageortext',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(34,0,'qtype_ddimageortext','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(35,0,'qtype_ddimageortext','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(36,0,'qtype_ddmarker',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(37,0,'qtype_ddmarker','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(38,0,'qtype_ddmarker','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(39,0,'qtype_ddwtos',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(40,0,'qtype_ddwtos','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(41,0,'qtype_ddwtos','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(42,0,'qtype_description',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(43,0,'qtype_description','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(44,0,'qtype_description','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(45,0,'qtype_essay',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(46,0,'qtype_essay','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(47,0,'qtype_essay','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(48,0,'qtype_gapselect',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(49,0,'qtype_gapselect','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(50,0,'qtype_gapselect','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(51,0,'qtype_match',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(52,0,'qtype_match','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(53,0,'qtype_match','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(54,0,'qtype_missingtype',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(55,0,'qtype_missingtype','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(56,0,'qtype_missingtype','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(57,0,'qtype_multianswer',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(58,0,'qtype_multianswer','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(59,0,'qtype_multianswer','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(60,0,'qtype_multichoice',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(61,0,'qtype_multichoice','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792647),(62,0,'qtype_multichoice','2016120500','2016120500','Plugin installed',NULL,'',0,1484792647),(63,0,'qtype_numerical',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792647),(64,0,'qtype_numerical','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(65,0,'qtype_numerical','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(66,0,'qtype_random',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(67,0,'qtype_random','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(68,0,'qtype_random','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(69,0,'qtype_randomsamatch',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(70,0,'qtype_randomsamatch','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(71,0,'qtype_randomsamatch','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(72,0,'qtype_shortanswer',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(73,0,'qtype_shortanswer','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(74,0,'qtype_shortanswer','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(75,0,'qtype_truefalse',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(76,0,'qtype_truefalse','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(77,0,'qtype_truefalse','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(78,0,'mod_assign',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(79,0,'mod_assign','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(80,0,'mod_assign','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(81,0,'mod_assignment',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(82,0,'mod_assignment','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(83,0,'mod_assignment','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(84,0,'mod_book',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(85,0,'mod_book','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(86,0,'mod_book','2016120500','2016120500','Plugin installed',NULL,'',0,1484792648),(87,0,'mod_chat',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792648),(88,0,'mod_chat','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792648),(89,0,'mod_chat','2016120500','2016120500','Plugin installed',NULL,'',0,1484792649),(90,0,'mod_choice',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792649),(91,0,'mod_choice','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792649),(92,0,'mod_choice','2016120500','2016120500','Plugin installed',NULL,'',0,1484792649),(93,0,'mod_data',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792649),(94,0,'mod_data','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792649),(95,0,'mod_data','2016120500','2016120500','Plugin installed',NULL,'',0,1484792649),(96,0,'mod_feedback',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792649),(97,0,'mod_feedback','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792649),(98,0,'mod_feedback','2016120500','2016120500','Plugin installed',NULL,'',0,1484792649),(99,0,'mod_folder',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792649),(100,0,'mod_folder','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792650),(101,0,'mod_folder','2016120500','2016120500','Plugin installed',NULL,'',0,1484792650),(102,0,'mod_forum',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792650),(103,0,'mod_forum','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792650),(104,0,'mod_forum','2016120500','2016120500','Plugin installed',NULL,'',0,1484792650),(105,0,'mod_glossary',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792650),(106,0,'mod_glossary','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792650),(107,0,'mod_glossary','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(108,0,'mod_imscp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(109,0,'mod_imscp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(110,0,'mod_imscp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(111,0,'mod_label',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(112,0,'mod_label','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(113,0,'mod_label','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(114,0,'mod_lesson',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(115,0,'mod_lesson','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(116,0,'mod_lesson','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(117,0,'mod_lti',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(118,0,'mod_lti','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(119,0,'mod_lti','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(120,0,'mod_page',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(121,0,'mod_page','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(122,0,'mod_page','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(123,0,'mod_quiz',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(124,0,'mod_quiz','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792651),(125,0,'mod_quiz','2016120500','2016120500','Plugin installed',NULL,'',0,1484792651),(126,0,'mod_resource',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792651),(127,0,'mod_resource','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792652),(128,0,'mod_resource','2016120500','2016120500','Plugin installed',NULL,'',0,1484792652),(129,0,'mod_scorm',NULL,'2016120501','Starting plugin installation',NULL,'',0,1484792652),(130,0,'mod_scorm','2016120501','2016120501','Upgrade savepoint reached',NULL,'',0,1484792652),(131,0,'mod_scorm','2016120501','2016120501','Plugin installed',NULL,'',0,1484792652),(132,0,'mod_survey',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792652),(133,0,'mod_survey','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792652),(134,0,'mod_survey','2016120500','2016120500','Plugin installed',NULL,'',0,1484792652),(135,0,'mod_url',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792652),(136,0,'mod_url','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792652),(137,0,'mod_url','2016120500','2016120500','Plugin installed',NULL,'',0,1484792652),(138,0,'mod_wiki',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792652),(139,0,'mod_wiki','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792652),(140,0,'mod_wiki','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(141,0,'mod_workshop',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(142,0,'mod_workshop','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(143,0,'mod_workshop','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(144,0,'auth_cas',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(145,0,'auth_cas','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(146,0,'auth_cas','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(147,0,'auth_db',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(148,0,'auth_db','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(149,0,'auth_db','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(150,0,'auth_email',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(151,0,'auth_email','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(152,0,'auth_email','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(153,0,'auth_fc',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(154,0,'auth_fc','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(155,0,'auth_fc','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(156,0,'auth_imap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(157,0,'auth_imap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(158,0,'auth_imap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(159,0,'auth_ldap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(160,0,'auth_ldap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(161,0,'auth_ldap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(162,0,'auth_lti',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(163,0,'auth_lti','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(164,0,'auth_lti','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(165,0,'auth_manual',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(166,0,'auth_manual','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(167,0,'auth_manual','2016120500','2016120500','Plugin installed',NULL,'',0,1484792653),(168,0,'auth_mnet',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792653),(169,0,'auth_mnet','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792653),(170,0,'auth_mnet','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(171,0,'auth_nntp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(172,0,'auth_nntp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(173,0,'auth_nntp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(174,0,'auth_nologin',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(175,0,'auth_nologin','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(176,0,'auth_nologin','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(177,0,'auth_none',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(178,0,'auth_none','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(179,0,'auth_none','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(180,0,'auth_pam',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(181,0,'auth_pam','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(182,0,'auth_pam','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(183,0,'auth_pop3',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(184,0,'auth_pop3','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(185,0,'auth_pop3','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(186,0,'auth_shibboleth',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(187,0,'auth_shibboleth','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(188,0,'auth_shibboleth','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(189,0,'auth_webservice',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(190,0,'auth_webservice','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(191,0,'auth_webservice','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(192,0,'calendartype_gregorian',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(193,0,'calendartype_gregorian','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(194,0,'calendartype_gregorian','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(195,0,'enrol_category',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(196,0,'enrol_category','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(197,0,'enrol_category','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(198,0,'enrol_cohort',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(199,0,'enrol_cohort','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(200,0,'enrol_cohort','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(201,0,'enrol_database',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(202,0,'enrol_database','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(203,0,'enrol_database','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(204,0,'enrol_flatfile',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(205,0,'enrol_flatfile','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(206,0,'enrol_flatfile','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(207,0,'enrol_guest',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(208,0,'enrol_guest','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(209,0,'enrol_guest','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(210,0,'enrol_imsenterprise',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(211,0,'enrol_imsenterprise','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(212,0,'enrol_imsenterprise','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(213,0,'enrol_ldap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(214,0,'enrol_ldap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792654),(215,0,'enrol_ldap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792654),(216,0,'enrol_lti',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792654),(217,0,'enrol_lti','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(218,0,'enrol_lti','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(219,0,'enrol_manual',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(220,0,'enrol_manual','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(221,0,'enrol_manual','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(222,0,'enrol_meta',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(223,0,'enrol_meta','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(224,0,'enrol_meta','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(225,0,'enrol_mnet',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(226,0,'enrol_mnet','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(227,0,'enrol_mnet','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(228,0,'enrol_paypal',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(229,0,'enrol_paypal','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(230,0,'enrol_paypal','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(231,0,'enrol_self',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(232,0,'enrol_self','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(233,0,'enrol_self','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(234,0,'message_airnotifier',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(235,0,'message_airnotifier','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(236,0,'message_airnotifier','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(237,0,'message_email',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(238,0,'message_email','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(239,0,'message_email','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(240,0,'message_jabber',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(241,0,'message_jabber','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(242,0,'message_jabber','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(243,0,'message_popup',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(244,0,'message_popup','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(245,0,'message_popup','2016120500','2016120500','Plugin installed',NULL,'',0,1484792655),(246,0,'block_activity_modules',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792655),(247,0,'block_activity_modules','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792655),(248,0,'block_activity_modules','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(249,0,'block_activity_results',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(250,0,'block_activity_results','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(251,0,'block_activity_results','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(252,0,'block_admin_bookmarks',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(253,0,'block_admin_bookmarks','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(254,0,'block_admin_bookmarks','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(255,0,'block_badges',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(256,0,'block_badges','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(257,0,'block_badges','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(258,0,'block_blog_menu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(259,0,'block_blog_menu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(260,0,'block_blog_menu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(261,0,'block_blog_recent',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(262,0,'block_blog_recent','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(263,0,'block_blog_recent','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(264,0,'block_blog_tags',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(265,0,'block_blog_tags','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(266,0,'block_blog_tags','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(267,0,'block_calendar_month',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(268,0,'block_calendar_month','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(269,0,'block_calendar_month','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(270,0,'block_calendar_upcoming',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(271,0,'block_calendar_upcoming','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(272,0,'block_calendar_upcoming','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(273,0,'block_comments',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(274,0,'block_comments','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(275,0,'block_comments','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(276,0,'block_community',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(277,0,'block_community','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(278,0,'block_community','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(279,0,'block_completionstatus',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(280,0,'block_completionstatus','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(281,0,'block_completionstatus','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(282,0,'block_course_list',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(283,0,'block_course_list','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(284,0,'block_course_list','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(285,0,'block_course_overview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(286,0,'block_course_overview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(287,0,'block_course_overview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(288,0,'block_course_summary',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(289,0,'block_course_summary','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(290,0,'block_course_summary','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(291,0,'block_feedback',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(292,0,'block_feedback','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(293,0,'block_feedback','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(294,0,'block_globalsearch',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(295,0,'block_globalsearch','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(296,0,'block_globalsearch','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(297,0,'block_glossary_random',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(298,0,'block_glossary_random','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(299,0,'block_glossary_random','2016120500','2016120500','Plugin installed',NULL,'',0,1484792656),(300,0,'block_html',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792656),(301,0,'block_html','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792656),(302,0,'block_html','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(303,0,'block_login',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(304,0,'block_login','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(305,0,'block_login','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(306,0,'block_lp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(307,0,'block_lp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(308,0,'block_lp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(309,0,'block_mentees',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(310,0,'block_mentees','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(311,0,'block_mentees','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(312,0,'block_messages',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(313,0,'block_messages','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(314,0,'block_messages','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(315,0,'block_mnet_hosts',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(316,0,'block_mnet_hosts','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(317,0,'block_mnet_hosts','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(318,0,'block_myprofile',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(319,0,'block_myprofile','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(320,0,'block_myprofile','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(321,0,'block_navigation',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(322,0,'block_navigation','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(323,0,'block_navigation','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(324,0,'block_news_items',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(325,0,'block_news_items','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(326,0,'block_news_items','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(327,0,'block_online_users',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(328,0,'block_online_users','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(329,0,'block_online_users','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(330,0,'block_participants',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(331,0,'block_participants','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(332,0,'block_participants','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(333,0,'block_private_files',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(334,0,'block_private_files','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(335,0,'block_private_files','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(336,0,'block_quiz_results',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(337,0,'block_quiz_results','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(338,0,'block_quiz_results','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(339,0,'block_recent_activity',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(340,0,'block_recent_activity','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(341,0,'block_recent_activity','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(342,0,'block_rss_client',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(343,0,'block_rss_client','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(344,0,'block_rss_client','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(345,0,'block_search_forums',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(346,0,'block_search_forums','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(347,0,'block_search_forums','2016120500','2016120500','Plugin installed',NULL,'',0,1484792657),(348,0,'block_section_links',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792657),(349,0,'block_section_links','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792657),(350,0,'block_section_links','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(351,0,'block_selfcompletion',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(352,0,'block_selfcompletion','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(353,0,'block_selfcompletion','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(354,0,'block_settings',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(355,0,'block_settings','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(356,0,'block_settings','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(357,0,'block_site_main_menu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(358,0,'block_site_main_menu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(359,0,'block_site_main_menu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(360,0,'block_social_activities',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(361,0,'block_social_activities','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(362,0,'block_social_activities','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(363,0,'block_tag_flickr',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(364,0,'block_tag_flickr','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(365,0,'block_tag_flickr','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(366,0,'block_tag_youtube',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(367,0,'block_tag_youtube','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(368,0,'block_tag_youtube','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(369,0,'block_tags',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(370,0,'block_tags','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(371,0,'block_tags','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(372,0,'media_html5audio',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(373,0,'media_html5audio','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(374,0,'media_html5audio','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(375,0,'media_html5video',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(376,0,'media_html5video','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(377,0,'media_html5video','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(378,0,'media_swf',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(379,0,'media_swf','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(380,0,'media_swf','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(381,0,'media_videojs',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(382,0,'media_videojs','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(383,0,'media_videojs','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(384,0,'media_vimeo',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(385,0,'media_vimeo','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(386,0,'media_vimeo','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(387,0,'media_youtube',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(388,0,'media_youtube','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(389,0,'media_youtube','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(390,0,'filter_activitynames',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(391,0,'filter_activitynames','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(392,0,'filter_activitynames','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(393,0,'filter_algebra',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(394,0,'filter_algebra','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(395,0,'filter_algebra','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(396,0,'filter_censor',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(397,0,'filter_censor','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(398,0,'filter_censor','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(399,0,'filter_data',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(400,0,'filter_data','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(401,0,'filter_data','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(402,0,'filter_emailprotect',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(403,0,'filter_emailprotect','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(404,0,'filter_emailprotect','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(405,0,'filter_emoticon',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(406,0,'filter_emoticon','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(407,0,'filter_emoticon','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(408,0,'filter_glossary',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(409,0,'filter_glossary','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(410,0,'filter_glossary','2016120500','2016120500','Plugin installed',NULL,'',0,1484792658),(411,0,'filter_mathjaxloader',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792658),(412,0,'filter_mathjaxloader','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792658),(413,0,'filter_mathjaxloader','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(414,0,'filter_mediaplugin',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(415,0,'filter_mediaplugin','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(416,0,'filter_mediaplugin','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(417,0,'filter_multilang',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(418,0,'filter_multilang','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(419,0,'filter_multilang','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(420,0,'filter_tex',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(421,0,'filter_tex','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(422,0,'filter_tex','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(423,0,'filter_tidy',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(424,0,'filter_tidy','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(425,0,'filter_tidy','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(426,0,'filter_urltolink',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(427,0,'filter_urltolink','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(428,0,'filter_urltolink','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(429,0,'editor_atto',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(430,0,'editor_atto','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(431,0,'editor_atto','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(432,0,'editor_textarea',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(433,0,'editor_textarea','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(434,0,'editor_textarea','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(435,0,'editor_tinymce',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(436,0,'editor_tinymce','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(437,0,'editor_tinymce','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(438,0,'format_singleactivity',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(439,0,'format_singleactivity','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(440,0,'format_singleactivity','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(441,0,'format_social',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(442,0,'format_social','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(443,0,'format_social','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(444,0,'format_topics',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(445,0,'format_topics','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(446,0,'format_topics','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(447,0,'format_weeks',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(448,0,'format_weeks','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(449,0,'format_weeks','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(450,0,'dataformat_csv',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(451,0,'dataformat_csv','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(452,0,'dataformat_csv','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(453,0,'dataformat_excel',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(454,0,'dataformat_excel','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(455,0,'dataformat_excel','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(456,0,'dataformat_html',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(457,0,'dataformat_html','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(458,0,'dataformat_html','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(459,0,'dataformat_json',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(460,0,'dataformat_json','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(461,0,'dataformat_json','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(462,0,'dataformat_ods',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(463,0,'dataformat_ods','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(464,0,'dataformat_ods','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(465,0,'profilefield_checkbox',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(466,0,'profilefield_checkbox','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(467,0,'profilefield_checkbox','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(468,0,'profilefield_datetime',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(469,0,'profilefield_datetime','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(470,0,'profilefield_datetime','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(471,0,'profilefield_menu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(472,0,'profilefield_menu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(473,0,'profilefield_menu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(474,0,'profilefield_text',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(475,0,'profilefield_text','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(476,0,'profilefield_text','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(477,0,'profilefield_textarea',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(478,0,'profilefield_textarea','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(479,0,'profilefield_textarea','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(480,0,'report_backups',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(481,0,'report_backups','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(482,0,'report_backups','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(483,0,'report_competency',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(484,0,'report_competency','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792659),(485,0,'report_competency','2016120500','2016120500','Plugin installed',NULL,'',0,1484792659),(486,0,'report_completion',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792659),(487,0,'report_completion','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(488,0,'report_completion','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(489,0,'report_configlog',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(490,0,'report_configlog','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(491,0,'report_configlog','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(492,0,'report_courseoverview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(493,0,'report_courseoverview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(494,0,'report_courseoverview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(495,0,'report_eventlist',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(496,0,'report_eventlist','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(497,0,'report_eventlist','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(498,0,'report_log',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(499,0,'report_log','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(500,0,'report_log','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(501,0,'report_loglive',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(502,0,'report_loglive','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(503,0,'report_loglive','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(504,0,'report_outline',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(505,0,'report_outline','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(506,0,'report_outline','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(507,0,'report_participation',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(508,0,'report_participation','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(509,0,'report_participation','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(510,0,'report_performance',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(511,0,'report_performance','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(512,0,'report_performance','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(513,0,'report_progress',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(514,0,'report_progress','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(515,0,'report_progress','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(516,0,'report_questioninstances',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(517,0,'report_questioninstances','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(518,0,'report_questioninstances','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(519,0,'report_security',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(520,0,'report_security','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(521,0,'report_security','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(522,0,'report_stats',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(523,0,'report_stats','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(524,0,'report_stats','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(525,0,'report_usersessions',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(526,0,'report_usersessions','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(527,0,'report_usersessions','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(528,0,'gradeexport_ods',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(529,0,'gradeexport_ods','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(530,0,'gradeexport_ods','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(531,0,'gradeexport_txt',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(532,0,'gradeexport_txt','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(533,0,'gradeexport_txt','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(534,0,'gradeexport_xls',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(535,0,'gradeexport_xls','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(536,0,'gradeexport_xls','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(537,0,'gradeexport_xml',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(538,0,'gradeexport_xml','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(539,0,'gradeexport_xml','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(540,0,'gradeimport_csv',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(541,0,'gradeimport_csv','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(542,0,'gradeimport_csv','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(543,0,'gradeimport_direct',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(544,0,'gradeimport_direct','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792660),(545,0,'gradeimport_direct','2016120500','2016120500','Plugin installed',NULL,'',0,1484792660),(546,0,'gradeimport_xml',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792660),(547,0,'gradeimport_xml','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(548,0,'gradeimport_xml','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(549,0,'gradereport_grader',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(550,0,'gradereport_grader','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(551,0,'gradereport_grader','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(552,0,'gradereport_history',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(553,0,'gradereport_history','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(554,0,'gradereport_history','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(555,0,'gradereport_outcomes',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(556,0,'gradereport_outcomes','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(557,0,'gradereport_outcomes','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(558,0,'gradereport_overview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(559,0,'gradereport_overview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(560,0,'gradereport_overview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(561,0,'gradereport_singleview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(562,0,'gradereport_singleview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(563,0,'gradereport_singleview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(564,0,'gradereport_user',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(565,0,'gradereport_user','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(566,0,'gradereport_user','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(567,0,'gradingform_guide',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(568,0,'gradingform_guide','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(569,0,'gradingform_guide','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(570,0,'gradingform_rubric',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(571,0,'gradingform_rubric','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(572,0,'gradingform_rubric','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(573,0,'mnetservice_enrol',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(574,0,'mnetservice_enrol','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(575,0,'mnetservice_enrol','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(576,0,'webservice_rest',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(577,0,'webservice_rest','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(578,0,'webservice_rest','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(579,0,'webservice_soap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(580,0,'webservice_soap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(581,0,'webservice_soap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(582,0,'webservice_xmlrpc',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(583,0,'webservice_xmlrpc','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(584,0,'webservice_xmlrpc','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(585,0,'repository_areafiles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(586,0,'repository_areafiles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(587,0,'repository_areafiles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(588,0,'repository_boxnet',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(589,0,'repository_boxnet','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(590,0,'repository_boxnet','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(591,0,'repository_coursefiles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(592,0,'repository_coursefiles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(593,0,'repository_coursefiles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(594,0,'repository_dropbox',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(595,0,'repository_dropbox','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(596,0,'repository_dropbox','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(597,0,'repository_equella',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(598,0,'repository_equella','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792661),(599,0,'repository_equella','2016120500','2016120500','Plugin installed',NULL,'',0,1484792661),(600,0,'repository_filesystem',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792661),(601,0,'repository_filesystem','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(602,0,'repository_filesystem','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(603,0,'repository_flickr',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(604,0,'repository_flickr','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(605,0,'repository_flickr','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(606,0,'repository_flickr_public',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(607,0,'repository_flickr_public','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(608,0,'repository_flickr_public','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(609,0,'repository_googledocs',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(610,0,'repository_googledocs','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(611,0,'repository_googledocs','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(612,0,'repository_local',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(613,0,'repository_local','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(614,0,'repository_local','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(615,0,'repository_merlot',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(616,0,'repository_merlot','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(617,0,'repository_merlot','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(618,0,'repository_picasa',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(619,0,'repository_picasa','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(620,0,'repository_picasa','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(621,0,'repository_recent',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(622,0,'repository_recent','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(623,0,'repository_recent','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(624,0,'repository_s3',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(625,0,'repository_s3','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(626,0,'repository_s3','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(627,0,'repository_skydrive',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(628,0,'repository_skydrive','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(629,0,'repository_skydrive','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(630,0,'repository_upload',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(631,0,'repository_upload','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(632,0,'repository_upload','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(633,0,'repository_url',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(634,0,'repository_url','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(635,0,'repository_url','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(636,0,'repository_user',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(637,0,'repository_user','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(638,0,'repository_user','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(639,0,'repository_webdav',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(640,0,'repository_webdav','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(641,0,'repository_webdav','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(642,0,'repository_wikimedia',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(643,0,'repository_wikimedia','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(644,0,'repository_wikimedia','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(645,0,'repository_youtube',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(646,0,'repository_youtube','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(647,0,'repository_youtube','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(648,0,'portfolio_boxnet',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(649,0,'portfolio_boxnet','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792662),(650,0,'portfolio_boxnet','2016120500','2016120500','Plugin installed',NULL,'',0,1484792662),(651,0,'portfolio_download',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792662),(652,0,'portfolio_download','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(653,0,'portfolio_download','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(654,0,'portfolio_flickr',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(655,0,'portfolio_flickr','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(656,0,'portfolio_flickr','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(657,0,'portfolio_googledocs',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(658,0,'portfolio_googledocs','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(659,0,'portfolio_googledocs','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(660,0,'portfolio_mahara',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(661,0,'portfolio_mahara','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(662,0,'portfolio_mahara','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(663,0,'portfolio_picasa',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(664,0,'portfolio_picasa','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(665,0,'portfolio_picasa','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(666,0,'search_solr',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(667,0,'search_solr','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(668,0,'search_solr','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(669,0,'qbehaviour_adaptive',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(670,0,'qbehaviour_adaptive','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(671,0,'qbehaviour_adaptive','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(672,0,'qbehaviour_adaptivenopenalty',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(673,0,'qbehaviour_adaptivenopenalty','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(674,0,'qbehaviour_adaptivenopenalty','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(675,0,'qbehaviour_deferredcbm',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(676,0,'qbehaviour_deferredcbm','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(677,0,'qbehaviour_deferredcbm','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(678,0,'qbehaviour_deferredfeedback',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(679,0,'qbehaviour_deferredfeedback','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(680,0,'qbehaviour_deferredfeedback','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(681,0,'qbehaviour_immediatecbm',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(682,0,'qbehaviour_immediatecbm','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(683,0,'qbehaviour_immediatecbm','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(684,0,'qbehaviour_immediatefeedback',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(685,0,'qbehaviour_immediatefeedback','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(686,0,'qbehaviour_immediatefeedback','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(687,0,'qbehaviour_informationitem',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(688,0,'qbehaviour_informationitem','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(689,0,'qbehaviour_informationitem','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(690,0,'qbehaviour_interactive',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(691,0,'qbehaviour_interactive','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(692,0,'qbehaviour_interactive','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(693,0,'qbehaviour_interactivecountback',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(694,0,'qbehaviour_interactivecountback','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(695,0,'qbehaviour_interactivecountback','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(696,0,'qbehaviour_manualgraded',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(697,0,'qbehaviour_manualgraded','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(698,0,'qbehaviour_manualgraded','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(699,0,'qbehaviour_missing',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(700,0,'qbehaviour_missing','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(701,0,'qbehaviour_missing','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(702,0,'qformat_aiken',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(703,0,'qformat_aiken','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(704,0,'qformat_aiken','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(705,0,'qformat_blackboard_six',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(706,0,'qformat_blackboard_six','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(707,0,'qformat_blackboard_six','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(708,0,'qformat_examview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(709,0,'qformat_examview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(710,0,'qformat_examview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(711,0,'qformat_gift',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(712,0,'qformat_gift','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(713,0,'qformat_gift','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(714,0,'qformat_missingword',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(715,0,'qformat_missingword','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(716,0,'qformat_missingword','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(717,0,'qformat_multianswer',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(718,0,'qformat_multianswer','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(719,0,'qformat_multianswer','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(720,0,'qformat_webct',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(721,0,'qformat_webct','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(722,0,'qformat_webct','2016120500','2016120500','Plugin installed',NULL,'',0,1484792663),(723,0,'qformat_xhtml',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792663),(724,0,'qformat_xhtml','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792663),(725,0,'qformat_xhtml','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(726,0,'qformat_xml',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(727,0,'qformat_xml','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(728,0,'qformat_xml','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(729,0,'tool_assignmentupgrade',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(730,0,'tool_assignmentupgrade','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(731,0,'tool_assignmentupgrade','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(732,0,'tool_availabilityconditions',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(733,0,'tool_availabilityconditions','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(734,0,'tool_availabilityconditions','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(735,0,'tool_behat',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(736,0,'tool_behat','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(737,0,'tool_behat','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(738,0,'tool_capability',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(739,0,'tool_capability','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(740,0,'tool_capability','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(741,0,'tool_cohortroles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(742,0,'tool_cohortroles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(743,0,'tool_cohortroles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(744,0,'tool_customlang',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(745,0,'tool_customlang','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(746,0,'tool_customlang','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(747,0,'tool_dbtransfer',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(748,0,'tool_dbtransfer','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(749,0,'tool_dbtransfer','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(750,0,'tool_filetypes',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(751,0,'tool_filetypes','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(752,0,'tool_filetypes','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(753,0,'tool_generator',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(754,0,'tool_generator','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(755,0,'tool_generator','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(756,0,'tool_health',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(757,0,'tool_health','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(758,0,'tool_health','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(759,0,'tool_innodb',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(760,0,'tool_innodb','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(761,0,'tool_innodb','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(762,0,'tool_installaddon',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(763,0,'tool_installaddon','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(764,0,'tool_installaddon','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(765,0,'tool_langimport',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(766,0,'tool_langimport','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(767,0,'tool_langimport','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(768,0,'tool_log',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(769,0,'tool_log','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(770,0,'tool_log','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(771,0,'tool_lp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(772,0,'tool_lp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(773,0,'tool_lp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(774,0,'tool_lpimportcsv',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(775,0,'tool_lpimportcsv','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(776,0,'tool_lpimportcsv','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(777,0,'tool_lpmigrate',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(778,0,'tool_lpmigrate','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(779,0,'tool_lpmigrate','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(780,0,'tool_messageinbound',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(781,0,'tool_messageinbound','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(782,0,'tool_messageinbound','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(783,0,'tool_mobile',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(784,0,'tool_mobile','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(785,0,'tool_mobile','2016120500','2016120500','Plugin installed',NULL,'',0,1484792664),(786,0,'tool_monitor',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792664),(787,0,'tool_monitor','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792664),(788,0,'tool_monitor','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(789,0,'tool_multilangupgrade',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(790,0,'tool_multilangupgrade','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(791,0,'tool_multilangupgrade','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(792,0,'tool_phpunit',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(793,0,'tool_phpunit','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(794,0,'tool_phpunit','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(795,0,'tool_profiling',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(796,0,'tool_profiling','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(797,0,'tool_profiling','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(798,0,'tool_recyclebin',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(799,0,'tool_recyclebin','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(800,0,'tool_recyclebin','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(801,0,'tool_replace',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(802,0,'tool_replace','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(803,0,'tool_replace','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(804,0,'tool_spamcleaner',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(805,0,'tool_spamcleaner','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(806,0,'tool_spamcleaner','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(807,0,'tool_task',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(808,0,'tool_task','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(809,0,'tool_task','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(810,0,'tool_templatelibrary',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(811,0,'tool_templatelibrary','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(812,0,'tool_templatelibrary','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(813,0,'tool_unsuproles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(814,0,'tool_unsuproles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(815,0,'tool_unsuproles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(816,0,'tool_uploadcourse',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(817,0,'tool_uploadcourse','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(818,0,'tool_uploadcourse','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(819,0,'tool_uploaduser',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(820,0,'tool_uploaduser','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(821,0,'tool_uploaduser','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(822,0,'tool_usertours',NULL,'2016120501','Starting plugin installation',NULL,'',0,1484792665),(823,0,'tool_usertours','2016120501','2016120501','Upgrade savepoint reached',NULL,'',0,1484792665),(824,0,'tool_usertours','2016120501','2016120501','Plugin installed',NULL,'',0,1484792665),(825,0,'tool_xmldb',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(826,0,'tool_xmldb','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792665),(827,0,'tool_xmldb','2016120500','2016120500','Plugin installed',NULL,'',0,1484792665),(828,0,'cachestore_apcu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792665),(829,0,'cachestore_apcu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(830,0,'cachestore_apcu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(831,0,'cachestore_file',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(832,0,'cachestore_file','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(833,0,'cachestore_file','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(834,0,'cachestore_memcache',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(835,0,'cachestore_memcache','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(836,0,'cachestore_memcache','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(837,0,'cachestore_memcached',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(838,0,'cachestore_memcached','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(839,0,'cachestore_memcached','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(840,0,'cachestore_mongodb',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(841,0,'cachestore_mongodb','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(842,0,'cachestore_mongodb','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(843,0,'cachestore_redis',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(844,0,'cachestore_redis','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(845,0,'cachestore_redis','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(846,0,'cachestore_session',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(847,0,'cachestore_session','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(848,0,'cachestore_session','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(849,0,'cachestore_static',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(850,0,'cachestore_static','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(851,0,'cachestore_static','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(852,0,'cachelock_file',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(853,0,'cachelock_file','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(854,0,'cachelock_file','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(855,0,'theme_boost',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(856,0,'theme_boost','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(857,0,'theme_boost','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(858,0,'theme_bootstrapbase',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(859,0,'theme_bootstrapbase','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(860,0,'theme_bootstrapbase','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(861,0,'theme_clean',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(862,0,'theme_clean','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(863,0,'theme_clean','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(864,0,'theme_more',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(865,0,'theme_more','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(866,0,'theme_more','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(867,0,'assignsubmission_comments',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(868,0,'assignsubmission_comments','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(869,0,'assignsubmission_comments','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(870,0,'assignsubmission_file',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(871,0,'assignsubmission_file','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(872,0,'assignsubmission_file','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(873,0,'assignsubmission_onlinetext',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(874,0,'assignsubmission_onlinetext','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(875,0,'assignsubmission_onlinetext','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(876,0,'assignfeedback_comments',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(877,0,'assignfeedback_comments','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(878,0,'assignfeedback_comments','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(879,0,'assignfeedback_editpdf',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(880,0,'assignfeedback_editpdf','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(881,0,'assignfeedback_editpdf','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(882,0,'assignfeedback_file',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(883,0,'assignfeedback_file','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(884,0,'assignfeedback_file','2016120500','2016120500','Plugin installed',NULL,'',0,1484792666),(885,0,'assignfeedback_offline',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792666),(886,0,'assignfeedback_offline','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792666),(887,0,'assignfeedback_offline','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(888,0,'assignment_offline',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(889,0,'assignment_offline','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(890,0,'assignment_offline','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(891,0,'assignment_online',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(892,0,'assignment_online','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(893,0,'assignment_online','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(894,0,'assignment_upload',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(895,0,'assignment_upload','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(896,0,'assignment_upload','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(897,0,'assignment_uploadsingle',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(898,0,'assignment_uploadsingle','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(899,0,'assignment_uploadsingle','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(900,0,'booktool_exportimscp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(901,0,'booktool_exportimscp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(902,0,'booktool_exportimscp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(903,0,'booktool_importhtml',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(904,0,'booktool_importhtml','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(905,0,'booktool_importhtml','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(906,0,'booktool_print',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(907,0,'booktool_print','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(908,0,'booktool_print','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(909,0,'datafield_checkbox',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(910,0,'datafield_checkbox','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(911,0,'datafield_checkbox','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(912,0,'datafield_date',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(913,0,'datafield_date','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(914,0,'datafield_date','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(915,0,'datafield_file',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(916,0,'datafield_file','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(917,0,'datafield_file','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(918,0,'datafield_latlong',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(919,0,'datafield_latlong','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(920,0,'datafield_latlong','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(921,0,'datafield_menu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(922,0,'datafield_menu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(923,0,'datafield_menu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(924,0,'datafield_multimenu',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(925,0,'datafield_multimenu','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(926,0,'datafield_multimenu','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(927,0,'datafield_number',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(928,0,'datafield_number','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(929,0,'datafield_number','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(930,0,'datafield_picture',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(931,0,'datafield_picture','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(932,0,'datafield_picture','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(933,0,'datafield_radiobutton',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(934,0,'datafield_radiobutton','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(935,0,'datafield_radiobutton','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(936,0,'datafield_text',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(937,0,'datafield_text','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(938,0,'datafield_text','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(939,0,'datafield_textarea',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(940,0,'datafield_textarea','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(941,0,'datafield_textarea','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(942,0,'datafield_url',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(943,0,'datafield_url','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(944,0,'datafield_url','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(945,0,'datapreset_imagegallery',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(946,0,'datapreset_imagegallery','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(947,0,'datapreset_imagegallery','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(948,0,'ltiservice_memberships',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(949,0,'ltiservice_memberships','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(950,0,'ltiservice_memberships','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(951,0,'ltiservice_profile',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(952,0,'ltiservice_profile','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(953,0,'ltiservice_profile','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(954,0,'ltiservice_toolproxy',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(955,0,'ltiservice_toolproxy','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(956,0,'ltiservice_toolproxy','2016120500','2016120500','Plugin installed',NULL,'',0,1484792667),(957,0,'ltiservice_toolsettings',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792667),(958,0,'ltiservice_toolsettings','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792667),(959,0,'ltiservice_toolsettings','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(960,0,'quiz_grading',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(961,0,'quiz_grading','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(962,0,'quiz_grading','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(963,0,'quiz_overview',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(964,0,'quiz_overview','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(965,0,'quiz_overview','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(966,0,'quiz_responses',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(967,0,'quiz_responses','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(968,0,'quiz_responses','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(969,0,'quiz_statistics',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(970,0,'quiz_statistics','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(971,0,'quiz_statistics','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(972,0,'quizaccess_delaybetweenattempts',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(973,0,'quizaccess_delaybetweenattempts','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(974,0,'quizaccess_delaybetweenattempts','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(975,0,'quizaccess_ipaddress',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(976,0,'quizaccess_ipaddress','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(977,0,'quizaccess_ipaddress','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(978,0,'quizaccess_numattempts',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(979,0,'quizaccess_numattempts','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(980,0,'quizaccess_numattempts','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(981,0,'quizaccess_offlineattempts',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(982,0,'quizaccess_offlineattempts','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(983,0,'quizaccess_offlineattempts','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(984,0,'quizaccess_openclosedate',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(985,0,'quizaccess_openclosedate','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(986,0,'quizaccess_openclosedate','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(987,0,'quizaccess_password',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(988,0,'quizaccess_password','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(989,0,'quizaccess_password','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(990,0,'quizaccess_safebrowser',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(991,0,'quizaccess_safebrowser','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(992,0,'quizaccess_safebrowser','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(993,0,'quizaccess_securewindow',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(994,0,'quizaccess_securewindow','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(995,0,'quizaccess_securewindow','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(996,0,'quizaccess_timelimit',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(997,0,'quizaccess_timelimit','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(998,0,'quizaccess_timelimit','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(999,0,'scormreport_basic',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1000,0,'scormreport_basic','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1001,0,'scormreport_basic','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1002,0,'scormreport_graphs',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1003,0,'scormreport_graphs','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1004,0,'scormreport_graphs','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1005,0,'scormreport_interactions',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1006,0,'scormreport_interactions','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1007,0,'scormreport_interactions','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1008,0,'scormreport_objectives',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1009,0,'scormreport_objectives','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1010,0,'scormreport_objectives','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1011,0,'workshopform_accumulative',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1012,0,'workshopform_accumulative','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1013,0,'workshopform_accumulative','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1014,0,'workshopform_comments',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1015,0,'workshopform_comments','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1016,0,'workshopform_comments','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1017,0,'workshopform_numerrors',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1018,0,'workshopform_numerrors','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792668),(1019,0,'workshopform_numerrors','2016120500','2016120500','Plugin installed',NULL,'',0,1484792668),(1020,0,'workshopform_rubric',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792668),(1021,0,'workshopform_rubric','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1022,0,'workshopform_rubric','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1023,0,'workshopallocation_manual',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1024,0,'workshopallocation_manual','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1025,0,'workshopallocation_manual','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1026,0,'workshopallocation_random',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1027,0,'workshopallocation_random','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1028,0,'workshopallocation_random','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1029,0,'workshopallocation_scheduled',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1030,0,'workshopallocation_scheduled','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1031,0,'workshopallocation_scheduled','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1032,0,'workshopeval_best',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1033,0,'workshopeval_best','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1034,0,'workshopeval_best','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1035,0,'atto_accessibilitychecker',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1036,0,'atto_accessibilitychecker','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1037,0,'atto_accessibilitychecker','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1038,0,'atto_accessibilityhelper',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1039,0,'atto_accessibilityhelper','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1040,0,'atto_accessibilityhelper','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1041,0,'atto_align',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1042,0,'atto_align','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1043,0,'atto_align','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1044,0,'atto_backcolor',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1045,0,'atto_backcolor','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1046,0,'atto_backcolor','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1047,0,'atto_bold',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1048,0,'atto_bold','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1049,0,'atto_bold','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1050,0,'atto_charmap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1051,0,'atto_charmap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1052,0,'atto_charmap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1053,0,'atto_clear',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1054,0,'atto_clear','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1055,0,'atto_clear','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1056,0,'atto_collapse',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1057,0,'atto_collapse','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1058,0,'atto_collapse','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1059,0,'atto_emoticon',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1060,0,'atto_emoticon','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1061,0,'atto_emoticon','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1062,0,'atto_equation',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1063,0,'atto_equation','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1064,0,'atto_equation','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1065,0,'atto_fontcolor',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1066,0,'atto_fontcolor','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1067,0,'atto_fontcolor','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1068,0,'atto_html',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1069,0,'atto_html','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1070,0,'atto_html','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1071,0,'atto_image',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1072,0,'atto_image','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1073,0,'atto_image','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1074,0,'atto_indent',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1075,0,'atto_indent','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1076,0,'atto_indent','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1077,0,'atto_italic',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1078,0,'atto_italic','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1079,0,'atto_italic','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1080,0,'atto_link',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1081,0,'atto_link','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1082,0,'atto_link','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1083,0,'atto_managefiles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1084,0,'atto_managefiles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1085,0,'atto_managefiles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1086,0,'atto_media',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1087,0,'atto_media','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1088,0,'atto_media','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1089,0,'atto_noautolink',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792669),(1090,0,'atto_noautolink','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792669),(1091,0,'atto_noautolink','2016120500','2016120500','Plugin installed',NULL,'',0,1484792669),(1092,0,'atto_orderedlist',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1093,0,'atto_orderedlist','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1094,0,'atto_orderedlist','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1095,0,'atto_rtl',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1096,0,'atto_rtl','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1097,0,'atto_rtl','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1098,0,'atto_strike',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1099,0,'atto_strike','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1100,0,'atto_strike','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1101,0,'atto_subscript',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1102,0,'atto_subscript','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1103,0,'atto_subscript','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1104,0,'atto_superscript',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1105,0,'atto_superscript','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1106,0,'atto_superscript','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1107,0,'atto_table',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1108,0,'atto_table','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1109,0,'atto_table','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1110,0,'atto_title',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1111,0,'atto_title','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1112,0,'atto_title','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1113,0,'atto_underline',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1114,0,'atto_underline','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1115,0,'atto_underline','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1116,0,'atto_undo',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1117,0,'atto_undo','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1118,0,'atto_undo','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1119,0,'atto_unorderedlist',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1120,0,'atto_unorderedlist','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1121,0,'atto_unorderedlist','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1122,0,'tinymce_ctrlhelp',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1123,0,'tinymce_ctrlhelp','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1124,0,'tinymce_ctrlhelp','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1125,0,'tinymce_managefiles',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1126,0,'tinymce_managefiles','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1127,0,'tinymce_managefiles','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1128,0,'tinymce_moodleemoticon',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1129,0,'tinymce_moodleemoticon','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1130,0,'tinymce_moodleemoticon','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1131,0,'tinymce_moodleimage',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1132,0,'tinymce_moodleimage','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1133,0,'tinymce_moodleimage','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1134,0,'tinymce_moodlemedia',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1135,0,'tinymce_moodlemedia','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1136,0,'tinymce_moodlemedia','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1137,0,'tinymce_moodlenolink',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1138,0,'tinymce_moodlenolink','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1139,0,'tinymce_moodlenolink','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1140,0,'tinymce_pdw',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1141,0,'tinymce_pdw','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1142,0,'tinymce_pdw','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1143,0,'tinymce_spellchecker',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1144,0,'tinymce_spellchecker','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1145,0,'tinymce_spellchecker','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1146,0,'tinymce_wrap',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1147,0,'tinymce_wrap','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1148,0,'tinymce_wrap','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1149,0,'logstore_database',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1150,0,'logstore_database','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1151,0,'logstore_database','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1152,0,'logstore_legacy',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1153,0,'logstore_legacy','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1154,0,'logstore_legacy','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670),(1155,0,'logstore_standard',NULL,'2016120500','Starting plugin installation',NULL,'',0,1484792670),(1156,0,'logstore_standard','2016120500','2016120500','Upgrade savepoint reached',NULL,'',0,1484792670),(1157,0,'logstore_standard','2016120500','2016120500','Plugin installed',NULL,'',0,1484792670);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','$2y$10$/yWA6elvrCVhR/BrTYnqD.FRIg0vFI8a4u1ZWr7j2He1FIEkCL9s.','','Usuário visitante',' ','root@localhost',0,'','','','','','','','','','','','','pt_br','gregorian','','99',0,0,0,0,'','',0,'','Este é um tipo de usuário especial que tem acesso a alguns curso com permissão limitada à leitura.',1,1,0,2,1,0,0,1484792638,0,NULL,NULL,NULL,NULL,NULL),(2,'manual',1,0,0,0,1,'admin','$2y$10$/xyMuQTWkMoDXHsW839yP.0U.E4sOuktacEjMAK82ngMxr/9NhOa6','','Renato','Neto','rnato.neto@hotmail.com',0,'','','','','','','','','','','','','pt_br','gregorian','','99',1484792709,1487542889,1487114287,1487542301,'187.59.181.127','',0,'','',1,1,0,1,1,0,0,1484874612,0,NULL,'','','',''),(3,'manual',1,0,1,0,1,'celinhoguiga@gmail.com.1484875668','$2y$10$NOALzDe90PL9AUvdEeInouW5FGUTPc0a0drCu0oeJCujaqm42O/eO','','Celio','Guiga','5d6390c6097ef866b6462cb31d794f61',0,'','','','','','','','','','','','','pt_br','gregorian','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1484875306,1484875668,0,'','','','',''),(4,'manual',1,0,1,1,1,'celinhoguiga@gmail.com.1485358137','$2y$10$tjrc0gkkBPIswF7L43aukeTUqa4mAq6Ulf/FosFY0KeBG7gz8yspa','','Celio','Guiga','5d6390c6097ef866b6462cb31d794f61',0,'','','','','','','','','','','','','pt_br','gregorian','','99',1484875778,1485314739,1485216074,1485303697,'131.108.26.30','',0,'','',1,1,0,2,1,0,1484875750,1485358137,0,'','','','',''),(5,'manual',1,0,0,0,1,'celio.guiga','$2y$10$aipV3JSrfuVSPEMQ7I6QX.a2oYJ.b5BuRBwuRkdN4YtkMpm29jt.6','','Celio','Guiga','celinhoguiga@gmail.com',0,'','','','','','','','','','','','','pt_br','gregorian','','99',1485363413,1485998210,1485363413,1485994820,'131.108.25.146','',0,'','',1,1,0,2,1,0,1485358246,1485361485,0,'','','','',''),(6,'manual',1,0,0,0,1,'visitante1','$2y$10$l1DqsliAY/WdDT6dVqg8yelHhtmjgX35bDp8jD1bCBVXHhHFz9NyC','','visitante','visitante','visitante@visitante.com',0,'','','','','','','','','','','','','pt_br','gregorian','','99',1486666758,1486666820,0,1486666758,'177.43.114.204','',0,'','',1,1,0,2,1,0,1486666738,1486666738,0,'','','','','');
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_devices`
--

DROP TABLE IF EXISTS `mdl_user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores user''s mobile devices information in order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_devices`
--

LOCK TABLES `mdl_user_devices` WRITE;
/*!40000 ALTER TABLE `mdl_user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
INSERT INTO `mdl_user_lastaccess` VALUES (1,2,2,1486953831),(2,2,4,1486954003);
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_history`
--

DROP TABLE IF EXISTS `mdl_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A rotating log of hashes of previously used passwords for ea';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_history`
--

LOCK TABLES `mdl_user_password_history` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_resets`
--

DROP TABLE IF EXISTS `mdl_user_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table tracking password reset confirmation tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_resets`
--

LOCK TABLES `mdl_user_password_resets` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_resets` DISABLE KEYS */;
INSERT INTO `mdl_user_password_resets` VALUES (1,3,1484875561,0,'TyapDvjQ7JHFOuW9ErzKWRs04F15xKWx');
/*!40000 ALTER TABLE `mdl_user_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'auth_manual_passwordupdatetime','1484792904'),(2,2,'email_bounce_count','1'),(3,2,'email_send_count','1'),(4,2,'tool_usertours_tour_completion_time_1','1484793159'),(5,2,'drawer-open-nav','true'),(6,2,'userselector_preserveselected','0'),(7,2,'userselector_autoselectunique','0'),(8,2,'userselector_searchanywhere','0'),(18,2,'login_failed_count_since_success','2'),(20,5,'email_bounce_count','1'),(21,5,'email_send_count','1'),(22,2,'userselector_optionscollapsed','0'),(23,5,'login_failed_count_since_success','4'),(24,5,'auth_manual_passwordupdatetime','1485363574'),(25,6,'auth_forcepasswordchange','0'),(26,6,'email_bounce_count','1'),(27,6,'email_send_count','1'),(28,6,'drawer-open-nav','true'),(29,2,'tool_usertours_tour_completion_time_2','1486953740');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `submissionfiletypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-19 22:23:54
