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
  `chatmessage_status` int(11) default '1',
  `chatmessage_message` varchar(100) default NULL,
  `chatmessage_date` datetime default NULL,
  PRIMARY KEY  (`chatmessage_id`),
  KEY `chatmessage_status` (`chatmessage_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table user
#

INSERT INTO `user` VALUES (1,'demo','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','webmaster@example.com',NULL);

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
