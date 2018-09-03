-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smork_forum
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CATEGORY_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(45) NOT NULL,
  `CREATED_BY` bigint(10) NOT NULL,
  `CREATION_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(200) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `fk_category_user_idx` (`CREATED_BY`),
  CONSTRAINT `fk_category_user` FOREIGN KEY (`CREATED_BY`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'First',3,'2018-09-03 11:38:04','First Category   '),(2,'Second',3,'2018-09-03 11:46:23','Testingasdsad ');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `REPLY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPLIED_BY` bigint(10) NOT NULL,
  `CREATION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTENT` mediumtext NOT NULL,
  `TOPIC_ID` bigint(10) NOT NULL,
  `PARENT_ID` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`REPLY_ID`),
  KEY `fk_replies_user1_idx` (`REPLIED_BY`),
  KEY `fk_replies_topic1_idx` (`TOPIC_ID`),
  CONSTRAINT `fk_replies_topic1` FOREIGN KEY (`TOPIC_ID`) REFERENCES `topic` (`TOPIC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_replies_user1` FOREIGN KEY (`REPLIED_BY`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privelege`
--

DROP TABLE IF EXISTS `role_privelege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privelege` (
  `PRIVELEGE_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`PRIVELEGE_ID`),
  UNIQUE KEY `PRIVELEGE_ID_UNIQUE` (`PRIVELEGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privelege`
--

LOCK TABLES `role_privelege` WRITE;
/*!40000 ALTER TABLE `role_privelege` DISABLE KEYS */;
INSERT INTO `role_privelege` VALUES (1,'READ/WRITE'),(2,'READ');
/*!40000 ALTER TABLE `role_privelege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `TOPIC_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(45) NOT NULL,
  `CONTENT` mediumtext NOT NULL,
  `CATAGORY_ID` bigint(10) NOT NULL,
  `CREATED_BY` bigint(10) NOT NULL,
  `CREATION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(45) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`TOPIC_ID`),
  KEY `fk_topic_category1_idx` (`CATAGORY_ID`),
  CONSTRAINT `fk_topic_category1` FOREIGN KEY (`CATAGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'swipe-scroll-best-practice-with-java-client-5','The swipe method was deprecated on java-client5.X (AppiumDriver#swipe(int, int, int, int, int) ).\r\n\r\nCan someone share the best practice to overcome this change?\r\n\r\nWe have tried to use the TouchAction class however, it doesn’t seems to work properly.\r\n\r\nTouchAction ta = new TouchAction(driver);\r\nta.press(x1, y1).waitAction(wait).moveTo(x2, y2).release().perform();',1,3,'2018-09-03 13:13:06','ACTIVE'),(2,'swipe-scroll-best-practice-with-java-client-5','The swipe method was deprecated on java-client5.X (AppiumDriver#swipe(int, int, int, int, int) ).\r\n\r\nCan someone share the best practice to overcome this change?\r\n\r\nWe have tried to use the TouchAction class however, it doesn’t seems to work properly.\r\n\r\nTouchAction ta = new TouchAction(driver);\r\nta.press(x1, y1).waitAction(wait).moveTo(x2, y2).release().perform();',1,3,'2018-09-03 13:13:52','ACTIVE'),(3,'swipe-scroll-best-practice-with-java-client-5','The swipe method was deprecated on java-client5.X (AppiumDriver#swipe(int, int, int, int, int) ).\r\n\r\nCan someone share the best practice to overcome this change?\r\n\r\nWe have tried to use the TouchAction class however, it doesn’t seems to work properly.\r\n\r\nTouchAction ta = new TouchAction(driver);\r\nta.press(x1, y1).waitAction(wait).moveTo(x2, y2).release().perform();',1,3,'2018-09-03 13:14:16','ACTIVE'),(4,'appium-driver-swipe','package te;\r\n\r\nimport io.appium.java_client.AppiumDriver;\r\nimport io.appium.java_client.android.AndroidDriver;\r\n\r\nimport java.net.MalformedURLException;\r\nimport java.net.URL;\r\nimport java.util.concurrent.TimeUnit;\r\n\r\nimport org.openqa.selenium.Dimension;\r\nimport org.openqa.selenium.WebDriver;\r\nimport org.openqa.selenium.remote.CapabilityType;\r\nimport org.openqa.selenium.remote.DesiredCapabilities;\r\nimport org.openqa.selenium.remote.RemoteWebDriver;\r\n\r\npublic class lanuch {\r\n\r\nAppiumDriver d;\r\n\r\n\r\n	 @SuppressWarnings(\"rawtypes\")\r\n	public void appLaunch() throws MalformedURLException {\r\n	  DesiredCapabilities cap = new DesiredCapabilities();\r\n\r\n	  \r\n	  \r\n	  cap.setCapability(CapabilityType.BROWSER_NAME, \"\");\r\n\r\n	  cap.setCapability(\"deviceName\", \"T5511\");\r\n\r\n	  cap.setCapability(\"platformName\", \"Android\");\r\n\r\n	  cap.setCapability(CapabilityType.VERSION, \"6.0.1\");\r\n\r\n	  cap.setCapability(\"platformVersion\", \"7.1.2\");\r\n\r\n	  cap.setCapability(\"appPackage\", \"com.smartron.tband\");\r\n	  cap.setCapability(\"appActivity\", \"com.smartron.sid.ui.setupflow.SetupFlowWelcomeScreen\");\r\n\r\n	  d = new AndroidDriver(new URL(\"http://127.0.0.1:4710/wd/hub\"), cap);\r\n	  System.out.println(\"connected\");\r\n\r\n	  d.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);\r\n	  d.manage().window().getSize();\r\n	  \r\n	 }\r\n	\r\n	public void scroll() throws InterruptedException\r\n	{\r\n		Dimension dimensions = d.manage().window().getSize();\r\n		\r\n		for(int i=1; i>4; i++)\r\n		{\r\n			Double screenHeightStart = dimensions.getHeight() * 0.5;\r\n\r\n			int scrollStart = screenHeightStart.intValue();\r\n\r\n			Double screenHeightEnd = dimensions.getHeight() * 0.2;\r\n\r\n			int scrollEnd = screenHeightEnd.intValue();\r\n\r\n			d.swipe(0, scrollStart, 0, scrollEnd, 2000);\r\n\r\n			\r\n		}\r\n}\r\npublic static void main(String args[]) throws MalformedURLException{\r\nlanuch f=new lanuch();\r\nf.appLaunch();\r\n}\r\n\r\n}\r\n\r\nall code is correct d.swipe …unable to call the method\r\n\r\n',1,3,'2018-09-03 13:16:37','ACTIVE');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_access`
--

DROP TABLE IF EXISTS `topic_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_access` (
  `ACCESS_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `GIVEN_TO_USER` bigint(10) NOT NULL,
  `GIVEN_FROM_USER` bigint(10) NOT NULL,
  `TOPIC_ID` bigint(10) NOT NULL,
  `CREATION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ACCESS_TYPE` varchar(45) NOT NULL DEFAULT 'READ',
  PRIMARY KEY (`ACCESS_ID`),
  KEY `fk_topic_access_user1_idx` (`GIVEN_TO_USER`),
  KEY `fk_topic_access_user2_idx` (`GIVEN_FROM_USER`),
  KEY `fk_topic_access_topic1_idx` (`TOPIC_ID`),
  CONSTRAINT `fk_topic_access_topic1` FOREIGN KEY (`TOPIC_ID`) REFERENCES `topic` (`TOPIC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_topic_access_user1` FOREIGN KEY (`GIVEN_TO_USER`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_topic_access_user2` FOREIGN KEY (`GIVEN_FROM_USER`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_access`
--

LOCK TABLES `topic_access` WRITE;
/*!40000 ALTER TABLE `topic_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `ROLE_ID` bigint(10) NOT NULL,
  `CREATION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `PROFILE_PICTURE` varchar(45) DEFAULT '',
  `DATE_OF_BIRTH` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'rahil55','rahilhusain55@gmail.com','$2a$10$uPz1vOkPl/08V6oizrRD4u/SyO4hT9xpY.zHbipmWvC94sI76Ow8G',1,'2018-09-02 23:11:04','Rahil','Husain','','2000-08-16 18:30:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `ROLE_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(45) NOT NULL,
  `PRIVELEGE_ID` bigint(10) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLE_ID_UNIQUE` (`ROLE_ID`),
  KEY `fk_user_roles_role_privelege1_idx` (`PRIVELEGE_ID`),
  CONSTRAINT `fk_user_roles_role_privelege1` FOREIGN KEY (`PRIVELEGE_ID`) REFERENCES `role_privelege` (`PRIVELEGE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ADMIN',1),(2,'USER',2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-03 21:50:55
