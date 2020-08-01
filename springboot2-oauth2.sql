/*!create a schema and select it*/
create schema oauth2_db;
use  oauth2_db;


DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` VALUES (1),(1);


--
-- Table structure for table `oauth_client_details`
--
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) NOT NULL,
  `RESOURCE_IDS` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `AUTHORIZED_GRANT_TYPES` varchar(255) DEFAULT NULL,
  `WEB_SERVER_REDIRECT_URI` varchar(255) DEFAULT NULL,
  `AUTHORITIES` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN_VALIDITY` int DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY` int DEFAULT NULL,
  `ADDITIONAL_INFORMATION` varchar(4096) DEFAULT NULL,
  `AUTOAPPROVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_client_details`
--

INSERT INTO `oauth_client_details` VALUES ('AdminIdPassword','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','ADMIN_CLIENT_RESOURCE,USER_ADMIN_RESOURCE','read,write,delete','authorization_code,password,refresh_token,implicit',NULL,'ROLE_ADMIN',900,3600,'{}',NULL),('USER_CLIENT_APP','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi',NULL,'read,write,delete','authorization_code,password,refresh_token,implicit',NULL,'read,write,delete',900,3600,'{}',NULL);


--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `permission`
--

INSERT INTO `permission` VALUES (1,'create'),(4,'delete'),(3,'read'),(2,'update');

UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `PERMISSION_ID` int DEFAULT NULL,
  `ROLE_ID` int DEFAULT NULL,
  KEY `FK3tuvkbyi6wcytyg21hvpd6txw` (`PERMISSION_ID`),
  KEY `FK50sfdcvbvdaclpn7wp4uop4ml` (`ROLE_ID`),
  CONSTRAINT `FK3tuvkbyi6wcytyg21hvpd6txw` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `FK50sfdcvbvdaclpn7wp4uop4ml` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `permission_role`
--


INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(3,2);

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) DEFAULT NULL,
  `role_id` int NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` VALUES (1,'ROLE_ADMIN',0,NULL),(2,'ROLE_USER',0,NULL);

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKiqpmjd2qb4rdkej916ymonic6` (`role_id`),
  CONSTRAINT `FK4320p8bgvumlxjkohtbj214qi` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`),
  CONSTRAINT `FKiqpmjd2qb4rdkej916ymonic6` FOREIGN KEY (`role_id`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` VALUES (1,1),(2,2);


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(24) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `ACCOUNT_EXPIRED` bit(1) NOT NULL,
  `CREDENTIALS_EXPIRED` bit(1) NOT NULL,
  `ACCOUNT_LOCKED` bit(1) NOT NULL,
  `user_id` int NOT NULL,
  `active` int DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (1,'admin','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','admin@gmail.com',_binary '',_binary '\0',_binary '\0',_binary '\0',0,1,NULL,NULL),(2,'user','{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi','user@gmail.com',_binary '',_binary '\0',_binary '\0',_binary '\0',0,1,NULL,NULL);

