


DROP TABLE IF EXISTS `CLManager_clpackages`;
CREATE TABLE `CLManager_clpackages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `speed` varchar(50) NOT NULL,
  `vmem` varchar(50) NOT NULL,
  `pmem` varchar(50) NOT NULL,
  `io` varchar(50) NOT NULL,
  `iops` varchar(50) NOT NULL,
  `ep` varchar(50) NOT NULL,
  `nproc` varchar(50) NOT NULL,
  `inodessoft` varchar(50) NOT NULL,
  `inodeshard` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `CLManager_clpackages_owner_id_9898c1e8_fk_packages_package_id` (`owner_id`),
  CONSTRAINT `CLManager_clpackages_owner_id_9898c1e8_fk_packages_package_id` FOREIGN KEY (`owner_id`) REFERENCES `packages_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `CLManager_clpackages` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `IncBackups_backupjob`;
CREATE TABLE `IncBackups_backupjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(300) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `websiteData` int(11) NOT NULL,
  `websiteDatabases` int(11) NOT NULL,
  `websiteDataEmails` int(11) NOT NULL,
  `retention` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `IncBackups_backupjob` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `IncBackups_incjob`;
CREATE TABLE `IncBackups_incjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IncBackups_incjob_website_id_aad31bf6_fk_websiteFu` (`website_id`),
  CONSTRAINT `IncBackups_incjob_website_id_aad31bf6_fk_websiteFu` FOREIGN KEY (`website_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `IncBackups_incjob` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `IncBackups_jobsites`;
CREATE TABLE `IncBackups_jobsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(300) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IncBackups_jobsites_job_id_494a1f69_fk_IncBackups_backupjob_id` (`job_id`),
  CONSTRAINT `IncBackups_jobsites_job_id_494a1f69_fk_IncBackups_backupjob_id` FOREIGN KEY (`job_id`) REFERENCES `IncBackups_backupjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `IncBackups_jobsites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `IncBackups_jobsnapshots`;
CREATE TABLE `IncBackups_jobsnapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(300) NOT NULL,
  `snapshotid` varchar(50) NOT NULL,
  `destination` varchar(200) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IncBackups_jobsnapshots_job_id_a8237ca8_fk_IncBackups_incjob_id` (`job_id`),
  CONSTRAINT `IncBackups_jobsnapshots_job_id_a8237ca8_fk_IncBackups_incjob_id` FOREIGN KEY (`job_id`) REFERENCES `IncBackups_incjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `IncBackups_jobsnapshots` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `at_login_logs`;
CREATE TABLE `at_login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr` text NOT NULL,
  `userid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


LOCK TABLES `at_login_logs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `at_users`;
CREATE TABLE `at_users` (
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


LOCK TABLES `at_users` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_group` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_group_permissions` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_permission` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_user` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_user_groups` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `auth_user_user_permissions` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `baseTemplate_cyberpanelcosmetic`;
CREATE TABLE `baseTemplate_cyberpanelcosmetic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MainDashboardCSS` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `baseTemplate_cyberpanelcosmetic` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `baseTemplate_version`;
CREATE TABLE `baseTemplate_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentVersion` varchar(50) NOT NULL,
  `build` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `baseTemplate_version` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cloudAPI_wpdeployments`;
CREATE TABLE `cloudAPI_wpdeployments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cloudAPI_wpdeploymen_owner_id_506ddf01_fk_websiteFu` (`owner_id`),
  CONSTRAINT `cloudAPI_wpdeploymen_owner_id_506ddf01_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `cloudAPI_wpdeployments` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `comments` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `containerization_containerlimits`;
CREATE TABLE `containerization_containerlimits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpuPers` varchar(10) NOT NULL,
  `IO` varchar(10) NOT NULL,
  `IOPS` varchar(10) NOT NULL,
  `memory` varchar(10) NOT NULL,
  `networkSpeed` varchar(10) NOT NULL,
  `networkHexValue` varchar(10) NOT NULL,
  `enforce` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `containerization_con_owner_id_494eb637_fk_websiteFu` (`owner_id`),
  CONSTRAINT `containerization_con_owner_id_494eb637_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `containerization_containerlimits` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cryptokeys`;
CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `cryptokeys` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `databases_databases`;
CREATE TABLE `databases_databases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbName` varchar(50) NOT NULL,
  `dbUser` varchar(50) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbName` (`dbName`),
  KEY `databases_databases_website_id_fb864a69_fk_websiteFu` (`website_id`),
  CONSTRAINT `databases_databases_website_id_fb864a69_fk_websiteFu` FOREIGN KEY (`website_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `databases_databases` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `databases_databasesusers`;
CREATE TABLE `databases_databasesusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `databases_databasesu_owner_id_908fc638_fk_databases` (`owner_id`),
  CONSTRAINT `databases_databasesu_owner_id_908fc638_fk_databases` FOREIGN KEY (`owner_id`) REFERENCES `databases_databases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `databases_databasesusers` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `databases_dbmeta`;
CREATE TABLE `databases_dbmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  `database_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `databases_dbmeta_database_id_777997bc_fk_databases_databases_id` (`database_id`),
  CONSTRAINT `databases_dbmeta_database_id_777997bc_fk_databases_databases_id` FOREIGN KEY (`database_id`) REFERENCES `databases_databases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `databases_dbmeta` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `databases_globaluserdb`;
CREATE TABLE `databases_globaluserdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `token` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `databases_globaluserdb` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `django_admin_log` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `django_content_type` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `django_migrations` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `django_session` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `dockerManager_containers`;
CREATE TABLE `dockerManager_containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cid` varchar(64) NOT NULL,
  `image` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `memory` int(11) NOT NULL,
  `ports` longtext NOT NULL,
  `volumes` longtext NOT NULL,
  `env` longtext NOT NULL,
  `startOnReboot` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dockerManager_contai_admin_id_58fb62b7_fk_loginSyst` (`admin_id`),
  CONSTRAINT `dockerManager_contai_admin_id_58fb62b7_fk_loginSyst` FOREIGN KEY (`admin_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `dockerManager_containers` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `domainmetadata`;
CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `domainmetadata` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(11) DEFAULT NULL,
  `account` varchar(40) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `domains_admin_id_c9d09cb8_fk_loginSystem_administrator_id` (`admin_id`),
  CONSTRAINT `domains_admin_id_c9d09cb8_fk_loginSystem_administrator_id` FOREIGN KEY (`admin_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `domains` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `e_domains`;
CREATE TABLE `e_domains` (
  `domain` varchar(50) NOT NULL,
  `childOwner_id` int(11) DEFAULT NULL,
  `domainOwner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`domain`),
  KEY `e_domains_childOwner_id_6c9fd49d_fk_websiteFu` (`childOwner_id`),
  KEY `e_domains_domainOwner_id_581e752a_fk_websiteFu` (`domainOwner_id`),
  CONSTRAINT `e_domains_childOwner_id_6c9fd49d_fk_websiteFu` FOREIGN KEY (`childOwner_id`) REFERENCES `websiteFunctions_childdomains` (`id`),
  CONSTRAINT `e_domains_domainOwner_id_581e752a_fk_websiteFu` FOREIGN KEY (`domainOwner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `e_domains` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `e_forwardings`;
CREATE TABLE `e_forwardings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(80) NOT NULL,
  `destination` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `e_forwardings` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `e_transport`;
CREATE TABLE `e_transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) NOT NULL,
  `transport` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `e_transport` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `e_users`;
CREATE TABLE `e_users` (
  `email` varchar(80) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `DiskUsage` varchar(200) NOT NULL,
  `emailOwner_id` varchar(50) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `e_users_emailOwner_id_761bf267_fk_e_domains_domain` (`emailOwner_id`),
  CONSTRAINT `e_users_emailOwner_id_761bf267_fk_e_domains_domain` FOREIGN KEY (`emailOwner_id`) REFERENCES `e_domains` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `e_users` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_emailjobs`;
CREATE TABLE `emailMarketing_emailjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) NOT NULL,
  `host` varchar(1000) NOT NULL,
  `totalEmails` int(11) NOT NULL,
  `sent` int(11) NOT NULL,
  `failed` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailMarketing_email_owner_id_73ee4827_fk_emailMark` (`owner_id`),
  CONSTRAINT `emailMarketing_email_owner_id_73ee4827_fk_emailMark` FOREIGN KEY (`owner_id`) REFERENCES `emailMarketing_emailtemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_emailjobs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_emaillists`;
CREATE TABLE `emailMarketing_emaillists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listName` varchar(50) NOT NULL,
  `dateCreated` varchar(200) NOT NULL,
  `verified` int(11) NOT NULL,
  `notVerified` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listName` (`listName`),
  KEY `emailMarketing_email_owner_id_bf1b4530_fk_websiteFu` (`owner_id`),
  CONSTRAINT `emailMarketing_email_owner_id_bf1b4530_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_emaillists` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_emailmarketing`;
CREATE TABLE `emailMarketing_emailmarketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_emailmarketing` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_emailsinlist`;
CREATE TABLE `emailMarketing_emailsinlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `verificationStatus` varchar(100) NOT NULL,
  `dateCreated` varchar(200) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailMarketing_email_owner_id_c5c27005_fk_emailMark` (`owner_id`),
  CONSTRAINT `emailMarketing_email_owner_id_c5c27005_fk_emailMark` FOREIGN KEY (`owner_id`) REFERENCES `emailMarketing_emaillists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_emailsinlist` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_emailtemplate`;
CREATE TABLE `emailMarketing_emailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `fromName` varchar(100) NOT NULL,
  `fromEmail` varchar(150) NOT NULL,
  `replyTo` varchar(150) NOT NULL,
  `emailMessage` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `emailMarketing_email_owner_id_d27e1d00_fk_loginSyst` (`owner_id`),
  CONSTRAINT `emailMarketing_email_owner_id_d27e1d00_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_emailtemplate` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_smtphosts`;
CREATE TABLE `emailMarketing_smtphosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(150) NOT NULL,
  `port` varchar(10) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `emailMarketing_smtph_owner_id_8b2d4ac7_fk_loginSyst` (`owner_id`),
  CONSTRAINT `emailMarketing_smtph_owner_id_8b2d4ac7_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_smtphosts` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailMarketing_validationlog`;
CREATE TABLE `emailMarketing_validationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailMarketing_valid_owner_id_240ad36e_fk_emailMark` (`owner_id`),
  CONSTRAINT `emailMarketing_valid_owner_id_240ad36e_fk_emailMark` FOREIGN KEY (`owner_id`) REFERENCES `emailMarketing_emaillists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailMarketing_validationlog` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailPremium_domainlimits`;
CREATE TABLE `emailPremium_domainlimits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitStatus` int(11) NOT NULL,
  `monthlyLimit` int(11) NOT NULL,
  `monthlyUsed` int(11) NOT NULL,
  `domain_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailPremium_domainlimits_domain_id_303ab297_fk_e_domains_domain` (`domain_id`),
  CONSTRAINT `emailPremium_domainlimits_domain_id_303ab297_fk_e_domains_domain` FOREIGN KEY (`domain_id`) REFERENCES `e_domains` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailPremium_domainlimits` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailPremium_emaillimits`;
CREATE TABLE `emailPremium_emaillimits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitStatus` int(11) NOT NULL,
  `monthlyLimits` int(11) NOT NULL,
  `monthlyUsed` int(11) NOT NULL,
  `hourlyLimit` int(11) NOT NULL,
  `hourlyUsed` int(11) NOT NULL,
  `emailLogs` int(11) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailPremium_emaillimits_email_id_1c111df5_fk_e_users_email` (`email_id`),
  CONSTRAINT `emailPremium_emaillimits_email_id_1c111df5_fk_e_users_email` FOREIGN KEY (`email_id`) REFERENCES `e_users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailPremium_emaillimits` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `emailPremium_emaillogs`;
CREATE TABLE `emailPremium_emaillogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(200) NOT NULL,
  `timeStamp` varchar(200) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailPremium_emaillogs_email_id_9ef49552_fk_e_users_email` (`email_id`),
  CONSTRAINT `emailPremium_emaillogs_email_id_9ef49552_fk_e_users_email` FOREIGN KEY (`email_id`) REFERENCES `e_users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `emailPremium_emaillogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `filemanager_trash`;
CREATE TABLE `filemanager_trash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originalPath` varchar(500) NOT NULL,
  `fileName` varchar(200) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filemanager_trash_website_id_e2762f3c_fk_websiteFu` (`website_id`),
  CONSTRAINT `filemanager_trash_website_id_e2762f3c_fk_websiteFu` FOREIGN KEY (`website_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `filemanager_trash` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `firewall_firewallrules`;
CREATE TABLE `firewall_firewallrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `proto` varchar(10) NOT NULL,
  `port` varchar(25) NOT NULL,
  `ipAddress` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `firewall_firewallrules` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `loginSystem_acl`;
CREATE TABLE `loginSystem_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `adminStatus` int(11) NOT NULL,
  `versionManagement` int(11) NOT NULL,
  `createNewUser` int(11) NOT NULL,
  `listUsers` int(11) NOT NULL,
  `deleteUser` int(11) NOT NULL,
  `resellerCenter` int(11) NOT NULL,
  `changeUserACL` int(11) NOT NULL,
  `createWebsite` int(11) NOT NULL,
  `modifyWebsite` int(11) NOT NULL,
  `suspendWebsite` int(11) NOT NULL,
  `deleteWebsite` int(11) NOT NULL,
  `createPackage` int(11) NOT NULL,
  `listPackages` int(11) NOT NULL,
  `deletePackage` int(11) NOT NULL,
  `modifyPackage` int(11) NOT NULL,
  `createDatabase` int(11) NOT NULL,
  `deleteDatabase` int(11) NOT NULL,
  `listDatabases` int(11) NOT NULL,
  `createNameServer` int(11) NOT NULL,
  `createDNSZone` int(11) NOT NULL,
  `deleteZone` int(11) NOT NULL,
  `addDeleteRecords` int(11) NOT NULL,
  `createEmail` int(11) NOT NULL,
  `listEmails` int(11) NOT NULL,
  `deleteEmail` int(11) NOT NULL,
  `emailForwarding` int(11) NOT NULL,
  `changeEmailPassword` int(11) NOT NULL,
  `dkimManager` int(11) NOT NULL,
  `createFTPAccount` int(11) NOT NULL,
  `deleteFTPAccount` int(11) NOT NULL,
  `listFTPAccounts` int(11) NOT NULL,
  `createBackup` int(11) NOT NULL,
  `restoreBackup` int(11) NOT NULL,
  `addDeleteDestinations` int(11) NOT NULL,
  `scheduleBackups` int(11) NOT NULL,
  `remoteBackups` int(11) NOT NULL,
  `manageSSL` int(11) NOT NULL,
  `hostnameSSL` int(11) NOT NULL,
  `mailServerSSL` int(11) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `loginSystem_acl` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `loginSystem_administrator`;
CREATE TABLE `loginSystem_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `api` int(11) NOT NULL,
  `securityLevel` int(11) NOT NULL,
  `state` varchar(10) NOT NULL,
  `initWebsitesLimit` int(11) NOT NULL,
  `twoFA` int(11) NOT NULL,
  `secretKey` varchar(50) NOT NULL,
  `config` longtext NOT NULL,
  `acl_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  KEY `loginSystem_administrator_acl_id_1ec0dc78_fk_loginSystem_acl_id` (`acl_id`),
  CONSTRAINT `loginSystem_administrator_acl_id_1ec0dc78_fk_loginSystem_acl_id` FOREIGN KEY (`acl_id`) REFERENCES `loginSystem_acl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `loginSystem_administrator` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `mailServer_pipeprograms`;
CREATE TABLE `mailServer_pipeprograms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(80) NOT NULL,
  `destination` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `mailServer_pipeprograms` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `managePHP_apachephp`;
CREATE TABLE `managePHP_apachephp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phpVers` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phpVers` (`phpVers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `managePHP_apachephp` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `managePHP_installedpackages`;
CREATE TABLE `managePHP_installedpackages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extensionName` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `phpVers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `managePHP_installedp_phpVers_id_54d8b7bc_fk_managePHP` (`phpVers_id`),
  CONSTRAINT `managePHP_installedp_phpVers_id_54d8b7bc_fk_managePHP` FOREIGN KEY (`phpVers_id`) REFERENCES `managePHP_php` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `managePHP_installedpackages` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `managePHP_installedpackagesapache`;
CREATE TABLE `managePHP_installedpackagesapache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extensionName` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `phpVers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `managePHP_installedp_phpVers_id_d01eb0b2_fk_managePHP` (`phpVers_id`),
  CONSTRAINT `managePHP_installedp_phpVers_id_d01eb0b2_fk_managePHP` FOREIGN KEY (`phpVers_id`) REFERENCES `managePHP_apachephp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `managePHP_installedpackagesapache` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `managePHP_php`;
CREATE TABLE `managePHP_php` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phpVers` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phpVers` (`phpVers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `managePHP_php` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `manageServices_pdnsstatus`;
CREATE TABLE `manageServices_pdnsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverStatus` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `masterServer` varchar(200) NOT NULL,
  `masterIP` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `manageServices_pdnsstatus` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `manageServices_slaveservers`;
CREATE TABLE `manageServices_slaveservers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slaveServer` varchar(200) NOT NULL,
  `slaveServerIP` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `manageServices_slaveservers` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `packages_package`;
CREATE TABLE `packages_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(50) NOT NULL,
  `diskSpace` int(11) NOT NULL,
  `bandwidth` int(11) NOT NULL,
  `emailAccounts` int(11) DEFAULT NULL,
  `dataBases` int(11) NOT NULL,
  `ftpAccounts` int(11) NOT NULL,
  `allowedDomains` int(11) NOT NULL,
  `allowFullDomain` int(11) NOT NULL,
  `enforceDiskLimits` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packageName` (`packageName`),
  KEY `packages_package_admin_id_23828c6a_fk_loginSyst` (`admin_id`),
  CONSTRAINT `packages_package_admin_id_23828c6a_fk_loginSyst` FOREIGN KEY (`admin_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `packages_package` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `ordername` varchar(255) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  `domainOwner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `records_domainOwner_id_e29f5ff2_fk_domains_id` (`domainOwner_id`),
  CONSTRAINT `records_domainOwner_id_e29f5ff2_fk_domains_id` FOREIGN KEY (`domainOwner_id`) REFERENCES `domains` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `records` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backuplogs`;
CREATE TABLE `s3Backups_backuplogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamp` varchar(200) NOT NULL,
  `level` varchar(5) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_backuplogs_owner_id_7b4653af_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_backuplogs_owner_id_7b4653af_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backuplogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backuplogsdo`;
CREATE TABLE `s3Backups_backuplogsdo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamp` varchar(200) NOT NULL,
  `level` varchar(5) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_backuplogs_owner_id_c7cb5872_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_backuplogs_owner_id_c7cb5872_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplando` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backuplogsdo` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backuplogsminio`;
CREATE TABLE `s3Backups_backuplogsminio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamp` varchar(200) NOT NULL,
  `level` varchar(5) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_backuplogs_owner_id_f19e1736_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_backuplogs_owner_id_f19e1736_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplanminio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backuplogsminio` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backupplan`;
CREATE TABLE `s3Backups_backupplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bucket` varchar(50) NOT NULL,
  `freq` varchar(50) NOT NULL,
  `retention` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `lastRun` varchar(50) NOT NULL,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `s3Backups_backupplan_owner_id_7d058ced_fk_loginSyst` (`owner_id`),
  CONSTRAINT `s3Backups_backupplan_owner_id_7d058ced_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backupplan` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backupplando`;
CREATE TABLE `s3Backups_backupplando` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bucket` varchar(50) NOT NULL,
  `freq` varchar(50) NOT NULL,
  `retention` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `region` varchar(5) NOT NULL,
  `lastRun` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `s3Backups_backupplan_owner_id_1a3ec86d_fk_loginSyst` (`owner_id`),
  CONSTRAINT `s3Backups_backupplan_owner_id_1a3ec86d_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backupplando` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_backupplanminio`;
CREATE TABLE `s3Backups_backupplanminio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `freq` varchar(50) NOT NULL,
  `retention` int(11) NOT NULL,
  `lastRun` varchar(50) NOT NULL,
  `minioNode_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `s3Backups_backupplan_minioNode_id_a4eaf917_fk_s3Backups` (`minioNode_id`),
  KEY `s3Backups_backupplan_owner_id_d6830e67_fk_loginSyst` (`owner_id`),
  CONSTRAINT `s3Backups_backupplan_minioNode_id_a4eaf917_fk_s3Backups` FOREIGN KEY (`minioNode_id`) REFERENCES `s3Backups_minionodes` (`id`),
  CONSTRAINT `s3Backups_backupplan_owner_id_d6830e67_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_backupplanminio` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_minionodes`;
CREATE TABLE `s3Backups_minionodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endPointURL` varchar(200) NOT NULL,
  `accessKey` varchar(200) NOT NULL,
  `secretKey` varchar(200) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endPointURL` (`endPointURL`),
  UNIQUE KEY `accessKey` (`accessKey`),
  KEY `s3Backups_minionodes_owner_id_e50993d9_fk_loginSyst` (`owner_id`),
  CONSTRAINT `s3Backups_minionodes_owner_id_e50993d9_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_minionodes` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_websitesinplan`;
CREATE TABLE `s3Backups_websitesinplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_websitesin_owner_id_0e9a4fe3_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_websitesin_owner_id_0e9a4fe3_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_websitesinplan` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_websitesinplando`;
CREATE TABLE `s3Backups_websitesinplando` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_websitesin_owner_id_cef3ea04_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_websitesin_owner_id_cef3ea04_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplando` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_websitesinplando` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `s3Backups_websitesinplanminio`;
CREATE TABLE `s3Backups_websitesinplanminio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s3Backups_websitesin_owner_id_224ce049_fk_s3Backups` (`owner_id`),
  CONSTRAINT `s3Backups_websitesin_owner_id_224ce049_fk_s3Backups` FOREIGN KEY (`owner_id`) REFERENCES `s3Backups_backupplanminio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `s3Backups_websitesinplanminio` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `supermasters`;
CREATE TABLE `supermasters` (
  `ip` varchar(64) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) NOT NULL,
  PRIMARY KEY (`ip`),
  UNIQUE KEY `supermasters_ip_nameserver_1d444554_uniq` (`ip`,`nameserver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `supermasters` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tsigkeys`;
CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tsigkeys_name_algorithm_6f5ee63a_uniq` (`name`,`algorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `tsigkeys` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(32) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Uid` int(11) NOT NULL,
  `Gid` int(11) NOT NULL,
  `Dir` varchar(255) NOT NULL,
  `QuotaSize` int(11) NOT NULL,
  `Status` varchar(1) NOT NULL,
  `ULBandwidth` int(11) NOT NULL,
  `DLBandwidth` int(11) NOT NULL,
  `Date` date NOT NULL,
  `LastModif` varchar(255) NOT NULL,
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `User` (`User`),
  KEY `users_domain_id_d179d1af_fk_websiteFunctions_websites_id` (`domain_id`),
  CONSTRAINT `users_domain_id_d179d1af_fk_websiteFunctions_websites_id` FOREIGN KEY (`domain_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `users` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_aliasdomains`;
CREATE TABLE `websiteFunctions_aliasdomains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aliasDomain` varchar(75) NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_ali_master_id_726c433d_fk_websiteFu` (`master_id`),
  CONSTRAINT `websiteFunctions_ali_master_id_726c433d_fk_websiteFu` FOREIGN KEY (`master_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_aliasdomains` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_backupjob`;
CREATE TABLE `websiteFunctions_backupjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logFile` varchar(1000) NOT NULL,
  `ipAddress` varchar(50) NOT NULL,
  `port` varchar(15) NOT NULL,
  `jobSuccessSites` int(11) NOT NULL,
  `jobFailedSites` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_backupjob` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_backupjoblogs`;
CREATE TABLE `websiteFunctions_backupjoblogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_bac_owner_id_af3d15f9_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_bac_owner_id_af3d15f9_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_backupjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_backupjoblogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_backups`;
CREATE TABLE `websiteFunctions_backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(200) NOT NULL,
  `date` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_bac_website_id_a77aa1d3_fk_websiteFu` (`website_id`),
  CONSTRAINT `websiteFunctions_bac_website_id_a77aa1d3_fk_websiteFu` FOREIGN KEY (`website_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_backups` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_backupschedules`;
CREATE TABLE `websiteFunctions_backupschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(15) NOT NULL,
  `dest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_bac_dest_id_cce9d45e_fk_websiteFu` (`dest_id`),
  CONSTRAINT `websiteFunctions_bac_dest_id_cce9d45e_fk_websiteFu` FOREIGN KEY (`dest_id`) REFERENCES `websiteFunctions_dest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_backupschedules` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_childdomains`;
CREATE TABLE `websiteFunctions_childdomains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `ssl` int(11) NOT NULL,
  `phpSelection` varchar(10) NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`),
  KEY `websiteFunctions_chi_master_id_0db0702c_fk_websiteFu` (`master_id`),
  CONSTRAINT `websiteFunctions_chi_master_id_0db0702c_fk_websiteFu` FOREIGN KEY (`master_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_childdomains` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_dest`;
CREATE TABLE `websiteFunctions_dest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destLoc` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `destLoc` (`destLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_dest` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_gdrive`;
CREATE TABLE `websiteFunctions_gdrive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `auth` longtext NOT NULL,
  `runTime` varchar(20) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `websiteFunctions_gdr_owner_id_b5b1e86f_fk_loginSyst` (`owner_id`),
  CONSTRAINT `websiteFunctions_gdr_owner_id_b5b1e86f_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_gdrive` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_gdrivejoblogs`;
CREATE TABLE `websiteFunctions_gdrivejoblogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_gdr_owner_id_4cf7983e_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_gdr_owner_id_4cf7983e_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_gdrive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_gdrivejoblogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_gdrivesites`;
CREATE TABLE `websiteFunctions_gdrivesites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_gdr_owner_id_ff78b305_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_gdr_owner_id_ff78b305_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_gdrive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_gdrivesites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_gitlogs`;
CREATE TABLE `websiteFunctions_gitlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `type` varchar(5) NOT NULL,
  `message` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_git_owner_id_ce74c7de_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_git_owner_id_ce74c7de_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_gitlogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_normalbackupdests`;
CREATE TABLE `websiteFunctions_normalbackupdests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_normalbackupdests` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_normalbackupjoblogs`;
CREATE TABLE `websiteFunctions_normalbackupjoblogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_nor_owner_id_69403e73_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_nor_owner_id_69403e73_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_normalbackupjobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_normalbackupjoblogs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_normalbackupjobs`;
CREATE TABLE `websiteFunctions_normalbackupjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_nor_owner_id_3a7a13db_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_nor_owner_id_3a7a13db_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_normalbackupdests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_normalbackupjobs` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_normalbackupsites`;
CREATE TABLE `websiteFunctions_normalbackupsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_nor_domain_id_c03362bc_fk_websiteFu` (`domain_id`),
  KEY `websiteFunctions_nor_owner_id_c6ece6cc_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_nor_domain_id_c03362bc_fk_websiteFu` FOREIGN KEY (`domain_id`) REFERENCES `websiteFunctions_websites` (`id`),
  CONSTRAINT `websiteFunctions_nor_owner_id_c6ece6cc_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_normalbackupjobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_normalbackupsites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_remotebackupconfig`;
CREATE TABLE `websiteFunctions_remotebackupconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configtype` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_rem_owner_id_27340736_fk_loginSyst` (`owner_id`),
  CONSTRAINT `websiteFunctions_rem_owner_id_27340736_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_remotebackupconfig` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_remotebackupschedule`;
CREATE TABLE `websiteFunctions_remotebackupschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `timeintervel` varchar(200) NOT NULL,
  `fileretention` varchar(200) NOT NULL,
  `lastrun` varchar(200) NOT NULL,
  `config` longtext NOT NULL,
  `RemoteBackupConfig_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_rem_RemoteBackupConfig_i_224c46fb_fk_websiteFu` (`RemoteBackupConfig_id`),
  CONSTRAINT `websiteFunctions_rem_RemoteBackupConfig_i_224c46fb_fk_websiteFu` FOREIGN KEY (`RemoteBackupConfig_id`) REFERENCES `websiteFunctions_remotebackupconfig` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_remotebackupschedule` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_remotebackupsites`;
CREATE TABLE `websiteFunctions_remotebackupsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WPsites` int(11) DEFAULT NULL,
  `database` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_rem_owner_id_d6c4475a_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_rem_owner_id_d6c4475a_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_remotebackupschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_remotebackupsites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_websites`;
CREATE TABLE `websiteFunctions_websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `phpSelection` varchar(10) NOT NULL,
  `ssl` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `externalApp` varchar(30) NOT NULL,
  `config` longtext NOT NULL,
  `admin_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`),
  KEY `websiteFunctions_web_admin_id_9c73217c_fk_loginSyst` (`admin_id`),
  KEY `websiteFunctions_web_package_id_d266bd7a_fk_packages_` (`package_id`),
  CONSTRAINT `websiteFunctions_web_admin_id_9c73217c_fk_loginSyst` FOREIGN KEY (`admin_id`) REFERENCES `loginSystem_administrator` (`id`),
  CONSTRAINT `websiteFunctions_web_package_id_d266bd7a_fk_packages_` FOREIGN KEY (`package_id`) REFERENCES `packages_package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_websites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_wpplugins`;
CREATE TABLE `websiteFunctions_wpplugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_wpp_owner_id_493a02c7_fk_loginSyst` (`owner_id`),
  CONSTRAINT `websiteFunctions_wpp_owner_id_493a02c7_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_wpplugins` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_wpsites`;
CREATE TABLE `websiteFunctions_wpsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `FinalURL` varchar(255) NOT NULL,
  `AutoUpdates` varchar(100) NOT NULL,
  `PluginUpdates` varchar(15) NOT NULL,
  `ThemeUpdates` varchar(15) NOT NULL,
  `date` datetime(6) NOT NULL,
  `WPLockState` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_wps_owner_id_6d67df2a_fk_websiteFu` (`owner_id`),
  CONSTRAINT `websiteFunctions_wps_owner_id_6d67df2a_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_websites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_wpsites` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_wpsitesbackup`;
CREATE TABLE `websiteFunctions_wpsitesbackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WPSiteID` int(11) NOT NULL,
  `WebsiteID` int(11) NOT NULL,
  `config` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_wps_owner_id_8a8dd0c5_fk_loginSyst` (`owner_id`),
  CONSTRAINT `websiteFunctions_wps_owner_id_8a8dd0c5_fk_loginSyst` FOREIGN KEY (`owner_id`) REFERENCES `loginSystem_administrator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_wpsitesbackup` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `websiteFunctions_wpstaging`;
CREATE TABLE `websiteFunctions_wpstaging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `wpsite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteFunctions_wps_owner_id_543d8aec_fk_websiteFu` (`owner_id`),
  KEY `websiteFunctions_wps_wpsite_id_82843593_fk_websiteFu` (`wpsite_id`),
  CONSTRAINT `websiteFunctions_wps_owner_id_543d8aec_fk_websiteFu` FOREIGN KEY (`owner_id`) REFERENCES `websiteFunctions_wpsites` (`id`),
  CONSTRAINT `websiteFunctions_wps_wpsite_id_82843593_fk_websiteFu` FOREIGN KEY (`wpsite_id`) REFERENCES `websiteFunctions_wpsites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


LOCK TABLES `websiteFunctions_wpstaging` WRITE;
UNLOCK TABLES;


