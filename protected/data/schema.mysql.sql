# MySQL-Front 5.0  (Build 1.133)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: yiitest
# ------------------------------------------------------
# Server version 5.0.45-community-nt

#
# Table structure for table chatmessage
#

DROP TABLE IF EXISTS `chatmessage`;
CREATE TABLE `chatmessage` (
  `chatmessage_id` int(11) NOT NULL auto_increment,
  `chatmessage_user_id` int(11) default NULL,
  `chatmessage_status` int(11) default '1',
  `chatmessage_message` varchar(100) default NULL,
  `chatmessage_date` datetime default NULL,
  PRIMARY KEY  (`chatmessage_id`),
  KEY `chatmessage_status` (`chatmessage_status`),
  KEY `chatmessage_user_id` (`chatmessage_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

#
# Dumping data for table chatmessage
#

INSERT INTO `chatmessage` VALUES (16,-1,1,'12312312','2013-03-16 14:51:21');
INSERT INTO `chatmessage` VALUES (17,-1,1,'12312312','2013-03-16 14:52:00');
INSERT INTO `chatmessage` VALUES (18,-1,1,'wer&quot;&quot;&quot;\'\'\'\'alert(5)','2013-03-16 14:54:48');
INSERT INTO `chatmessage` VALUES (19,-1,1,'werqwere&quot;&quot;&#039;&#039;&#039;&quot;alert(5)','2013-03-16 14:57:16');
INSERT INTO `chatmessage` VALUES (20,-1,1,'ertwert','2013-03-16 14:59:04');
INSERT INTO `chatmessage` VALUES (21,-1,1,'qwerqwer','2013-03-16 19:35:37');
INSERT INTO `chatmessage` VALUES (22,-1,1,'qwerqwer45636','2013-03-16 19:35:39');
INSERT INTO `chatmessage` VALUES (23,-1,1,'qwerqwer456361234','2013-03-16 19:35:40');
INSERT INTO `chatmessage` VALUES (24,-1,1,'!!!!!!!!!!!!!!!!!!!!!!!!!','2013-03-16 14:59:04');
INSERT INTO `chatmessage` VALUES (25,-1,1,'123123','2013-03-16 19:50:17');
INSERT INTO `chatmessage` VALUES (26,-1,1,'NEW','2013-03-16 19:56:50');
INSERT INTO `chatmessage` VALUES (27,-1,1,'qwerqwerqr','2013-03-16 19:59:09');
INSERT INTO `chatmessage` VALUES (28,-1,1,'2342were','2013-03-16 19:59:45');
INSERT INTO `chatmessage` VALUES (29,-1,1,'234',NULL);
INSERT INTO `chatmessage` VALUES (30,-1,1,'23234цуцук','2013-03-16 20:03:09');
INSERT INTO `chatmessage` VALUES (31,-1,1,'23234цуцук','2013-03-16 20:05:15');
INSERT INTO `chatmessage` VALUES (32,-1,1,')))))','2013-03-16 20:05:26');
INSERT INTO `chatmessage` VALUES (33,-1,1,'!&quot;№;УЦк','2013-03-16 20:05:33');
INSERT INTO `chatmessage` VALUES (34,-1,1,'ен4еен','2013-03-16 20:11:33');
INSERT INTO `chatmessage` VALUES (35,-1,1,'уцц3','2013-03-16 20:11:58');
INSERT INTO `chatmessage` VALUES (36,-1,1,'1234567890123456789012345678901234567890123456789012345678901234567890123456789012','2013-03-16 20:12:49');
INSERT INTO `chatmessage` VALUES (37,-1,1,'укцук','2013-03-16 20:13:09');
INSERT INTO `chatmessage` VALUES (38,-1,1,'test message alert(5)','2013-03-16 20:13:30');
INSERT INTO `chatmessage` VALUES (39,-1,1,'&quot;&quot;&quot;&#039;&#039;&#039;&#039;','2013-03-16 20:13:34');
INSERT INTO `chatmessage` VALUES (40,-1,1,'wretiwuer','2013-03-16 20:14:58');
INSERT INTO `chatmessage` VALUES (41,-1,1,'test message','2013-03-16 20:22:38');
INSERT INTO `chatmessage` VALUES (42,-1,1,'989798yu','2013-03-17 11:35:12');
INSERT INTO `chatmessage` VALUES (43,1,1,'ewrqwer','2013-03-17 14:22:47');
INSERT INTO `chatmessage` VALUES (44,2,1,'wertwert45','2013-03-17 14:23:16');
INSERT INTO `chatmessage` VALUES (45,-1,1,'3434345','2013-03-17 14:23:30');
INSERT INTO `chatmessage` VALUES (46,-1,1,'wretwert','2013-03-17 14:40:53');
INSERT INTO `chatmessage` VALUES (47,2,1,'rhegdfg','2013-03-17 14:41:04');

#
# Table structure for table comment
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `content` text collate utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) default NULL,
  `author` varchar(128) collate utf8_unicode_ci NOT NULL,
  `email` varchar(128) collate utf8_unicode_ci NOT NULL,
  `url` varchar(128) collate utf8_unicode_ci default NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_comment_post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table comment
#

INSERT INTO `comment` VALUES (1,'This is a test comment.',2,1230952187,'Tester','tester@example.com',NULL,2);

#
# Table structure for table lookup
#

DROP TABLE IF EXISTS `lookup`;
CREATE TABLE `lookup` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) collate utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) collate utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table lookup
#

INSERT INTO `lookup` VALUES (1,'Draft',1,'PostStatus',1);
INSERT INTO `lookup` VALUES (2,'Published',2,'PostStatus',2);
INSERT INTO `lookup` VALUES (3,'Archived',3,'PostStatus',3);
INSERT INTO `lookup` VALUES (4,'Pending Approval',1,'CommentStatus',1);
INSERT INTO `lookup` VALUES (5,'Approved',2,'CommentStatus',2);

#
# Table structure for table post
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(128) collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci NOT NULL,
  `tags` text collate utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) default NULL,
  `update_time` int(11) default NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_post_author` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table post
#

INSERT INTO `post` VALUES (1,'Welcome!','This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\n\nFeel free to try this system by writing new posts and posting comments.','yii, blog',2,1230952187,1230952187,1);
INSERT INTO `post` VALUES (2,'A Test Post','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','test',2,1230952187,1230952187,1);

#
# Table structure for table tag
#

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) collate utf8_unicode_ci NOT NULL,
  `frequency` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table tag
#

INSERT INTO `tag` VALUES (1,'yii',1);
INSERT INTO `tag` VALUES (2,'blog',1);
INSERT INTO `tag` VALUES (3,'test',1);

#
# Table structure for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(128) collate utf8_unicode_ci NOT NULL,
  `password` varchar(128) collate utf8_unicode_ci NOT NULL,
  `email` varchar(128) collate utf8_unicode_ci NOT NULL,
  `profile` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table user
#

INSERT INTO `user` VALUES (1,'demo','e10adc3949ba59abbe56e057f20f883e','webmaster@example.com',NULL);
INSERT INTO `user` VALUES (2,'demo2','e10adc3949ba59abbe56e057f20f883e','',NULL);

#
#  Foreign keys for table comment
#

ALTER TABLE `comment`
ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

#
#  Foreign keys for table post
#

ALTER TABLE `post`
ADD CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
