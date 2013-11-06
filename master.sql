# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.5.33)
# データベース: local_master
# 作成時刻: 2013-10-15 16:36:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  `text` varchar(120) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `dist_user_id` int(10) unsigned NOT NULL,
  `event` enum('comment','like','share','follow','movie','etc') NOT NULL DEFAULT 'etc',
  `movie_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ix01_events` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ fb_friends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fb_friends`;

CREATE TABLE `fb_friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `fb_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `to_user_id` int(10) unsigned NOT NULL,
  `to_fb_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ fb_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fb_tokens`;

CREATE TABLE `fb_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `fb_id` bigint(20) NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ follows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `follows`;

CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `follow_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix01_follows` (`user_id`,`follow_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ movie_counters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movie_counters`;

CREATE TABLE `movie_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  `category` enum('comment','like','share') DEFAULT NULL,
  `cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movie_counters` (`movie_id`),
  CONSTRAINT `fk_movie_counters` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ movies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(50) NOT NULL DEFAULT '',
  `detail` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `movies_ins` AFTER INSERT ON `movies` FOR EACH ROW BEGIN
INSERT INTO movie_counters
(
  valid       ,
  sort_updated,
  sort_created,
  updated_at  ,
  created_at  ,
  movie_id    ,
  category    ,
  cnt         
) VALUES
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'like',0), 
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'comment',0),
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'share',0) ;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# テーブルのダンプ push_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `push_tokens`;

CREATE TABLE `push_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `device` enum('iphone','android','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `arn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ shares
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shares`;

CREATE TABLE `shares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix01_shares` (`user_id`,`movie_id`),
  CONSTRAINT `fk_shares` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ tagmaps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tagmaps`;

CREATE TABLE `tagmaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix01_tagmaps` (`movie_id`,`tag_id`),
  CONSTRAINT `tagmaps_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ togethers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `togethers`;

CREATE TABLE `togethers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix01_togethers` (`movie_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ tw_friends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tw_friends`;

CREATE TABLE `tw_friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `tw_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `to_tw_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ tw_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tw_tokens`;

CREATE TABLE `tw_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `tw_id` bigint(20) NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ user_counters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_counters`;

CREATE TABLE `user_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `category` enum('follow','follower','movie','comment','like') DEFAULT NULL,
  `cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_counters` (`user_id`),
  CONSTRAINT `fk_user_counters` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ user_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_infos`;

CREATE TABLE `user_infos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `device` enum('iphone','android','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `maker` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ user_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_tokens`;

CREATE TABLE `user_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# テーブルのダンプ users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `sort_updated` int(11) NOT NULL DEFAULT '0',
  `sort_created` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en_US',
  `cc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'E1',
  `profile` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `users_ins` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO local_master.user_counters
(
  valid       ,
  sort_updated,
  sort_created,
  updated_at  ,
  created_at  ,
  user_id     ,
  category    ,
  cnt         
) VALUES
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'follow',0), 
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'follower',0),
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'movie',0),
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'comment',0),
(1,sf_get_sort_keys(),sf_get_sort_keys(),current_timestamp,current_timestamp,NEW.id,'like',0) ;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;



--
-- Dumping routines (PROCEDURE) for database 'local_master'
--
DELIMITER ;;

# Dump of PROCEDURE sp_follow
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_follow` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_follow`(IN _act char(3), IN _user_id int ,IN _follow_id int,OUT _result int)
BEGIN

  SET _result = 0;

    BEGIN
      DECLARE _id INT UNSIGNED;
      

      DECLARE EXIT HANDLER FOR SQLEXCEPTION 
      BEGIN
        SET _result = -99;
      END;

      CASE _act
        WHEN 'ADD' THEN
          BEGIN
            DECLARE _not_found TINYINT UNSIGNED DEFAULT 0;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET _not_found = 1;
            SELECT id into _id FROM follows WHERE `valid` = 1 AND `user_id` = _user_id AND `follow_id` = _follow_id ;
            IF _not_found = 1 THEN
              INSERT INTO follows (
               valid,
               sort_updated,
               sort_created,
               updated_at,
               created_at,
               user_id,
               follow_id
              ) VALUES (
               1,
               sf_get_sort_keys() ,
               sf_get_sort_keys() ,
               current_timestamp,
               current_timestamp,
               _user_id,
               _follow_id
              ) ;
            ELSE
              SET _result = -50;
            END IF ;

          END ;
        WHEN 'DEL' THEN
          BEGIN
            DECLARE _not_found TINYINT UNSIGNED DEFAULT 0;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET _not_found = 1;
            SELECT id into _id FROM follows WHERE `valid` = 1 AND `user_id` = _user_id AND `follow_id` = _follow_id ;
            IF _not_found = 1 THEN
              SET _result = -60;
            ELSE
              DELETE FROM follows WHERE user_id = _user_id AND follow_id = _follow_id ;
            END IF ;

          END ;
      END CASE ;
      
    END ;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_movie_counters
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_movie_counters` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_movie_counters`(IN _act char(1),IN _movie_id int,IN _category varchar(50),OUT _result int)
BEGIN
/*
 User counter control procedure
 _result : 
   0 : 正常
   -10: エラー  _actの値が不正
   -20: エラー  該当レコードは見つからなかった
   -99: システムエラー
   
*/
    DECLARE _valid int ;
    
    SET _result = 0;

    BEGIN
      DECLARE _not_found TINYINT UNSIGNED DEFAULT 0;
      DECLARE _id INT UNSIGNED;

      DECLARE EXIT HANDLER FOR SQLEXCEPTION 
      BEGIN
        SET _result = -99;
      END;

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET _not_found = 1;
      select id INTO _id from movie_counters where movie_id = _movie_id and category = _category and valid=1 ;

      IF _not_found='0' THEN
        CASE _act
          WHEN '+' THEN
            UPDATE movie_counters SET cnt = cnt + 1,updated_at=current_timestamp,sort_updated=sf_get_sort_keys() WHERE movie_id = _movie_id and category = _category ; 
            SET _result = 0 ;
          WHEN '-' THEN
            UPDATE movie_counters SET cnt = cnt - 1,updated_at=current_timestamp,sort_updated=sf_get_sort_keys() WHERE movie_id = _movie_id and  category = _category and cnt > 0 ;
            SET _result = 0 ;
          WHEN 'D' THEN
            UPDATE movie_counters SET valid = 0,updated_at=current_timestamp,sort_updated=sf_get_sort_keys()  WHERE movie_id = _movie_id and category = _category and valid = 1 ;
            SET _result = 0 ;
          ELSE
            SET _result = -10 ;
        END CASE ;
      ELSE
        SET _result = -20 ;
      END IF;
    END ;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_tag_add
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_tag_add` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_tag_add`(IN _tag_name varchar(100) ,IN _user_id int, IN _movie_id int,OUT _result int)
BEGIN

  SET _result = 0;

    BEGIN
      DECLARE _not_found TINYINT UNSIGNED DEFAULT 0;
      DECLARE _id INT UNSIGNED;
      DECLARE _name varchar(100) ;

      DECLARE EXIT HANDLER FOR SQLEXCEPTION 
      BEGIN
        SET _result = -99;
        ROLLBACK ;
      END;

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET _not_found = 1;
      SELECT id into _id FROM tags WHERE `name` = _tag_name ;

      IF _not_found = 1 THEN
        BEGIN
          START TRANSACTION ;

          INSERT INTO tags (
             valid,
             sort_updated,
             sort_created,
             updated_at,
             created_at,
             name
          ) VALUES (
             1,
             sf_get_sort_keys() ,
             sf_get_sort_keys() ,
             current_timestamp,
             current_timestamp,
             _tag_name
          ) ;

          INSERT INTO tagmaps (
             valid,
             sort_updated,
             sort_created,
             updated_at,
             created_at,
             user_id,
             movie_id,
             tag_id
          ) VALUES (
             1,
             sf_get_sort_keys() ,
             sf_get_sort_keys() ,
             current_timestamp,
             current_timestamp,
             _user_id,
             _movie_id,
             last_insert_id()
          ) ;

          COMMIT ;
        END ;
      ELSE
        BEGIN
          START TRANSACTION ;

          DELETE FROM tagmaps WHERE movie_id = _movie_id and tag_id = _id ;

          INSERT INTO tagmaps (
             valid,
             sort_updated,
             sort_created,
             updated_at,
             created_at,
             user_id,
             movie_id,
             tag_id
          ) VALUES (
             1,
             sf_get_sort_keys() ,
             sf_get_sort_keys() ,
             current_timestamp,
             current_timestamp,
             _user_id,
             _movie_id,
             _id
          ) ;

          COMMIT ;

        END ;

      END IF ;

    END ;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE sp_user_counters
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `sp_user_counters` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `sp_user_counters`(IN _act char(1),IN _user_id int,IN _category varchar(50),OUT _result int)
BEGIN
/*
 User counter control procedure
 _result : 
   0 : 正常
   -10: エラー  _actの値が不正
   -20: エラー  該当レコードは見つからなかった
   -99: システムエラー
   
*/
    DECLARE _valid int ;
    
    SET _result = 0;

    BEGIN
      DECLARE _not_found TINYINT UNSIGNED DEFAULT 0;
      DECLARE _id INT UNSIGNED;

      DECLARE EXIT HANDLER FOR SQLEXCEPTION 
      BEGIN
        SET _result = -99;
      END;

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET _not_found = 1;
      select id INTO _id from user_counters where user_id = _user_id and category = _category and valid=1 ;

      IF _not_found='0' THEN
        CASE _act
          WHEN '+' THEN
            UPDATE user_counters SET cnt = cnt + 1,updated_at=current_timestamp,sort_updated=sf_get_sort_keys() WHERE user_id = _user_id and category = _category ; 
            SET _result = 0 ;
          WHEN '-' THEN
            UPDATE user_counters SET cnt = cnt - 1,updated_at=current_timestamp,sort_updated=sf_get_sort_keys() WHERE user_id = _user_id and  category = _category and cnt > 0 ;
            SET _result = 0 ;
          WHEN 'D' THEN
            UPDATE user_counters SET valid = 0,updated_at=current_timestamp,sort_updated=sf_get_sort_keys()  WHERE user_id = _user_id and category = _category and valid = 1 ;
            SET _result = 0 ;
          ELSE
            SET _result = -10 ;
        END CASE ;
      ELSE
        SET _result = -20 ;
      END IF;
    END ;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

--
-- Dumping routines (FUNCTION) for database 'local_master'
--
DELIMITER ;;

# Dump of FUNCTION sf_get_sort_keys
# ------------------------------------------------------------

/*!50003 DROP FUNCTION IF EXISTS `sf_get_sort_keys` */;;
/*!50003 SET SESSION SQL_MODE="IGNORE_SPACE"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `sf_get_sort_keys`() RETURNS int(11)
BEGIN
   DECLARE _sort_key int ;

   SET _sort_key = UNIX_TIMESTAMP('2030-12-31') - UNIX_TIMESTAMP(current_timestamp) ;

   RETURN _sort_key;

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
