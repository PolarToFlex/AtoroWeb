


DROP TABLE IF EXISTS `login_logs`;
CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr` text NOT NULL,
  `userid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


LOCK TABLES `login_logs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `user_id` text NOT NULL,
  `discriminator` text NOT NULL,
  `email` text NOT NULL,
  `avatar` text NOT NULL,
  `banned_reason` text NOT NULL DEFAULT '0',
  `lastlogin_ip` text DEFAULT NULL,
  `last_login` text DEFAULT NULL,
  `coins` text NOT NULL DEFAULT '0',
  `created` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


LOCK TABLES `users` WRITE;
UNLOCK TABLES;


