-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.67-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for crimemanagement
CREATE DATABASE IF NOT EXISTS `crimemanagement` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crimemanagement`;


-- Dumping structure for table crimemanagement.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_permission: ~64 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add register_form', 7, 'add_register_form'),
	(26, 'Can change register_form', 7, 'change_register_form'),
	(27, 'Can delete register_form', 7, 'delete_register_form'),
	(28, 'Can view register_form', 7, 'view_register_form'),
	(29, 'Can add complaint', 8, 'add_complaint'),
	(30, 'Can change complaint', 8, 'change_complaint'),
	(31, 'Can delete complaint', 8, 'delete_complaint'),
	(32, 'Can view complaint', 8, 'view_complaint'),
	(33, 'Can add area', 9, 'add_area'),
	(34, 'Can change area', 9, 'change_area'),
	(35, 'Can delete area', 9, 'delete_area'),
	(36, 'Can view area', 9, 'view_area'),
	(37, 'Can add complaint_details', 10, 'add_complaint_details'),
	(38, 'Can change complaint_details', 10, 'change_complaint_details'),
	(39, 'Can delete complaint_details', 10, 'delete_complaint_details'),
	(40, 'Can view complaint_details', 10, 'view_complaint_details'),
	(41, 'Can add missing', 11, 'add_missing'),
	(42, 'Can change missing', 11, 'change_missing'),
	(43, 'Can delete missing', 11, 'delete_missing'),
	(44, 'Can view missing', 11, 'view_missing'),
	(45, 'Can add addcriminals', 12, 'add_addcriminals'),
	(46, 'Can change addcriminals', 12, 'change_addcriminals'),
	(47, 'Can delete addcriminals', 12, 'delete_addcriminals'),
	(48, 'Can view addcriminals', 12, 'view_addcriminals'),
	(49, 'Can add addcriminalls', 13, 'add_addcriminalls'),
	(50, 'Can change addcriminalls', 13, 'change_addcriminalls'),
	(51, 'Can delete addcriminalls', 13, 'delete_addcriminalls'),
	(52, 'Can view addcriminalls', 13, 'view_addcriminalls'),
	(53, 'Can add branches', 14, 'add_branches'),
	(54, 'Can change branches', 14, 'change_branches'),
	(55, 'Can delete branches', 14, 'delete_branches'),
	(56, 'Can view branches', 14, 'view_branches'),
	(57, 'Can add chatregg', 15, 'add_chatregg'),
	(58, 'Can change chatregg', 15, 'change_chatregg'),
	(59, 'Can delete chatregg', 15, 'delete_chatregg'),
	(60, 'Can view chatregg', 15, 'view_chatregg'),
	(61, 'Can add fileupload', 16, 'add_fileupload'),
	(62, 'Can change fileupload', 16, 'change_fileupload'),
	(63, 'Can delete fileupload', 16, 'delete_fileupload'),
	(64, 'Can view fileupload', 16, 'view_fileupload');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime default NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$180000$X1WbRGdYbAnP$kzyS8QjNhRToCkM1FRCQX5qS24zba/Q0H4g8h3/VejQ=', '2020-02-26 08:55:03', 1, 'crime', '', '', 'crime@gmail.com', 1, 1, '2020-02-22 05:05:13');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_addcriminalls
CREATE TABLE IF NOT EXISTS `crime_addcriminalls` (
  `id` int(11) NOT NULL auto_increment,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `carea` varchar(800) NOT NULL,
  `ctype` varchar(100) NOT NULL,
  `bnname` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_addcriminalls: ~2 rows (approximately)
/*!40000 ALTER TABLE `crime_addcriminalls` DISABLE KEYS */;
INSERT INTO `crime_addcriminalls` (`id`, `firstname`, `lastname`, `carea`, `ctype`, `bnname`, `image`) VALUES
	(1, 'jamir', 'aslam', 'anna nagar', 'robbery', 'kelappakam', 'image/download_1.jpg'),
	(2, 'jamir', 'aslam', 'anna nagar', 'robbery', 'kelappakam', 'image/download_1_ucL5hLX.jpg');
/*!40000 ALTER TABLE `crime_addcriminalls` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_area
CREATE TABLE IF NOT EXISTS `crime_area` (
  `id` int(11) NOT NULL auto_increment,
  `Email` varchar(254) NOT NULL,
  `doorno` varchar(50) NOT NULL,
  `stname` varchar(200) NOT NULL,
  `villcit` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `contactnumber` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_area: ~1 rows (approximately)
/*!40000 ALTER TABLE `crime_area` DISABLE KEYS */;
INSERT INTO `crime_area` (`id`, `Email`, `doorno`, `stname`, `villcit`, `district`, `state`, `pincode`, `contactnumber`) VALUES
	(1, 'prasana@gmail.com', '40, ', 'sadukaramadam 4th street', 'vellore', 'vellore', 'Tamil Nadu', '632001', '9489812765');
/*!40000 ALTER TABLE `crime_area` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_branches
CREATE TABLE IF NOT EXISTS `crime_branches` (
  `id` int(11) NOT NULL auto_increment,
  `bnname` varchar(100) NOT NULL,
  `bpass` varchar(100) NOT NULL,
  `barea` varchar(800) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `nopolice` varchar(10) NOT NULL,
  `address` varchar(2000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_branches: ~2 rows (approximately)
/*!40000 ALTER TABLE `crime_branches` DISABLE KEYS */;
INSERT INTO `crime_branches` (`id`, `bnname`, `bpass`, `barea`, `profile`, `nopolice`, `address`) VALUES
	(1, 'vadapalani', 'vadapalani', 'kospetai area', 'image/im.jpg', '50', 'SKIVE ACADEMY OF TRAINING AND RESEARCH  A DIVISION OF FABSYS TECHNOLOGIES PRIVATE LIMITED #245/2, 2nd Floor, Vellore-Chittor Main Road,  Next to MRF Tyres at VIT Chittor Busstop and Opposite to St.Joseph ITI, Katpadi,  Vellore, Tamil Nadu 632007'),
	(2, 'kelambakam', 'kelambakam', 'busterminal', 'image/im.jpg', '60', '40, sadukaramadam 4th street, sadukaramadam 4th street');
/*!40000 ALTER TABLE `crime_branches` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_chatregg
CREATE TABLE IF NOT EXISTS `crime_chatregg` (
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(15) NOT NULL,
  `time_h_m_s` varchar(15) NOT NULL,
  `dchatt` varchar(2000) NOT NULL,
  `fromm` varchar(10) NOT NULL,
  `too` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_chatregg: ~9 rows (approximately)
/*!40000 ALTER TABLE `crime_chatregg` DISABLE KEYS */;
INSERT INTO `crime_chatregg` (`id`, `date`, `time_h_m_s`, `dchatt`, `fromm`, `too`) VALUES
	(1, '2020-02-26', '15:08:31', '', 'vadapalani', 'kelambakam'),
	(2, '2020-02-26', '15:09:38', 'nice', 'vadapalani', 'kelambakam'),
	(3, '2020-02-26', '15:09:55', 'hi', 'vadapalani', 'kelambakam'),
	(4, '2020-02-26', '15:13:17', 'hi', 'vadapalani', 'kelambakam'),
	(5, '2020-02-26', '15:14:13', 'hi', 'vadapalani', 'kelambakam'),
	(6, '2020-02-26', '16:44:54', 'hii', 'kelambakam', 'vadapalani'),
	(7, '2020-02-26', '16:45:46', 'hii', 'kelambakam', 'vadapalani'),
	(8, '2020-02-26', '16:47:02', 'hii', 'kelambakam', 'vadapalani'),
	(9, '2020-02-26', '16:49:29', 'hello\r\n', 'kelambakam', 'vadapalani');
/*!40000 ALTER TABLE `crime_chatregg` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_complaint
CREATE TABLE IF NOT EXISTS `crime_complaint` (
  `id` int(11) NOT NULL auto_increment,
  `location` varchar(50) NOT NULL,
  `area` varchar(200) NOT NULL,
  `detail` varchar(2000) NOT NULL,
  `date` varchar(15) NOT NULL,
  `time_h_m_s` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_complaint: ~2 rows (approximately)
/*!40000 ALTER TABLE `crime_complaint` DISABLE KEYS */;
INSERT INTO `crime_complaint` (`id`, `location`, `area`, `detail`, `date`, `time_h_m_s`) VALUES
	(1, 'chennai', 'vadapalani', 'frequently happen chain robbery at night .....', '2020-02-26', '11:01:33'),
	(2, 'chennai', 'vadapalani', 'frequently happen  robbery at night .....', '2020-02-20', '11:01:33');
/*!40000 ALTER TABLE `crime_complaint` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_complaint_details
CREATE TABLE IF NOT EXISTS `crime_complaint_details` (
  `id` int(11) NOT NULL auto_increment,
  `Email` varchar(254) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `carea` varchar(800) NOT NULL,
  `wip` varchar(500) NOT NULL,
  `detail` varchar(2000) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_complaint_details: ~1 rows (approximately)
/*!40000 ALTER TABLE `crime_complaint_details` DISABLE KEYS */;
INSERT INTO `crime_complaint_details` (`id`, `Email`, `firstname`, `lastname`, `cname`, `carea`, `wip`, `detail`, `image`) VALUES
	(1, 'prasana@gmail.com', 'akbar', 'ali', 'akbar ali', 'urappakkam', 'chain robery', 'disturb to people', 'image/download_1_pBvrZYf.jpg');
/*!40000 ALTER TABLE `crime_complaint_details` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_fileupload
CREATE TABLE IF NOT EXISTS `crime_fileupload` (
  `id` int(11) NOT NULL auto_increment,
  `bnname` varchar(100) NOT NULL,
  `crimename` varchar(100) NOT NULL,
  `crimearea` varchar(1000) NOT NULL,
  `value` varchar(10) NOT NULL,
  `files` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_fileupload: ~1 rows (approximately)
/*!40000 ALTER TABLE `crime_fileupload` DISABLE KEYS */;
INSERT INTO `crime_fileupload` (`id`, `bnname`, `crimename`, `crimearea`, `value`, `files`) VALUES
	(1, 'kelambakam', 'akbar ali', 'urappakkam', '2', 'file/Screenshot_28_MyUcvHv.pdf');
/*!40000 ALTER TABLE `crime_fileupload` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_missing
CREATE TABLE IF NOT EXISTS `crime_missing` (
  `id` int(11) NOT NULL auto_increment,
  `Email` varchar(254) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `perno` varchar(20) NOT NULL,
  `missedarea` varchar(1000) NOT NULL,
  `my_content` varchar(2000) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_missing: ~1 rows (approximately)
/*!40000 ALTER TABLE `crime_missing` DISABLE KEYS */;
INSERT INTO `crime_missing` (`id`, `Email`, `firstname`, `lastname`, `perno`, `missedarea`, `my_content`, `image`) VALUES
	(1, 'prasana@gmail.com', 'Prasana', 'kumar', '09176990190', 'vellore', 'went to katpadi cmc', 'image/download1_uMzoptO.jpg');
/*!40000 ALTER TABLE `crime_missing` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.crime_register_form
CREATE TABLE IF NOT EXISTS `crime_register_form` (
  `id` int(11) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.crime_register_form: ~2 rows (approximately)
/*!40000 ALTER TABLE `crime_register_form` DISABLE KEYS */;
INSERT INTO `crime_register_form` (`id`, `Name`, `Email`, `Password`, `Phone`) VALUES
	(1, 'Prasana', 'prasana@gmail.com', 'prasana', '09176990190'),
	(3, 'akbar', 'akbar@gmail.com', 'akbar', '09176990190');
/*!40000 ALTER TABLE `crime_register_form` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.django_content_type: ~16 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(13, 'crime', 'addcriminalls'),
	(12, 'crime', 'addcriminals'),
	(9, 'crime', 'area'),
	(14, 'crime', 'branches'),
	(15, 'crime', 'chatregg'),
	(8, 'crime', 'complaint'),
	(10, 'crime', 'complaint_details'),
	(16, 'crime', 'fileupload'),
	(11, 'crime', 'missing'),
	(7, 'crime', 'register_form'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL auto_increment,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.django_migrations: ~28 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2020-02-20 10:54:44'),
	(2, 'auth', '0001_initial', '2020-02-20 10:54:44'),
	(3, 'admin', '0001_initial', '2020-02-20 10:54:46'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2020-02-20 10:54:47'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-02-20 10:54:47'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2020-02-20 10:54:47'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2020-02-20 10:54:48'),
	(8, 'auth', '0003_alter_user_email_max_length', '2020-02-20 10:54:48'),
	(9, 'auth', '0004_alter_user_username_opts', '2020-02-20 10:54:48'),
	(10, 'auth', '0005_alter_user_last_login_null', '2020-02-20 10:54:48'),
	(11, 'auth', '0006_require_contenttypes_0002', '2020-02-20 10:54:48'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2020-02-20 10:54:48'),
	(13, 'auth', '0008_alter_user_username_max_length', '2020-02-20 10:54:49'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2020-02-20 10:54:49'),
	(15, 'auth', '0010_alter_group_name_max_length', '2020-02-20 10:54:49'),
	(16, 'auth', '0011_update_proxy_permissions', '2020-02-20 10:54:50'),
	(17, 'sessions', '0001_initial', '2020-02-20 10:54:50'),
	(18, 'crime', '0001_initial', '2020-02-20 12:52:56'),
	(19, 'crime', '0002_complaint', '2020-02-21 06:38:24'),
	(20, 'crime', '0003_area', '2020-02-21 08:29:59'),
	(21, 'crime', '0004_auto_20200222_1159', '2020-02-22 06:29:45'),
	(22, 'crime', '0005_missing', '2020-02-22 07:11:46'),
	(23, 'crime', '0006_addcriminals', '2020-02-22 13:20:34'),
	(24, 'crime', '0007_auto_20200222_1900', '2020-02-22 13:30:51'),
	(25, 'crime', '0008_branches', '2020-02-26 07:05:24'),
	(26, 'crime', '0009_chatregg', '2020-02-26 09:29:32'),
	(27, 'crime', '0010_remove_addcriminalls_email', '2020-02-26 12:24:09'),
	(28, 'crime', '0011_fileupload', '2020-02-27 07:26:36');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- Dumping structure for table crimemanagement.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table crimemanagement.django_session: ~4 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('dh39n5zz45p2w87v15vomwhpdfq3d3qv', 'YTM3MGRiOTVjZjY0NzgxYTg3NzhhN2Y4OGUzMDg4NDFmYTMyNDBiYjp7ImVtYWlsIjoicHJhc2FuYUBnbWFpbC5jb20iLCJibm5hbWUiOiJ2YWRhcGFsYW5pIn0=', '2020-03-13 06:09:21'),
	('ik7p2t5icqkkof0f5y5fp1d3brcuiziu', 'NmQ3ODUxYzljOTYxN2IyODI5NTNmMDJhNWYzMGRjZDA1YjNhZTQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNWNlNzM4Yzc1NzVkZGU4NWZiN2Y3N2UxZmYyNzg3MTBjMmJlNjc2IiwiYm5uYW1lIjoidmFkYXBhbGFuaSIsImVtYWlsIjoicHJhc2FuYUBnbWFpbC5jb20ifQ==', '2020-03-12 10:50:49'),
	('pd7vu14u4rw8kl8d3box79eh50tgrey5', 'YjU1MGJlMTlhZjI0ZDJmZDI4YWY1NjZkZTg0YjNjOGQ4OGUzNjM0Yzp7ImVtYWlsIjoicHJhc2FuYUBnbWFpbC5jb20ifQ==', '2020-03-10 08:08:00'),
	('w2oyu6oqyzqpalra7fydssvgvf3nnuvz', 'N2VjODg3OWZiMzhhMzhlZTdhMTQzOTk5MDNkZDk4MjM2ZGFiMzY2ZDp7ImVtYWlsIjoicHJhc2FuYUBnbWFpbC5jb20iLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTVjZTczOGM3NTc1ZGRlODVmYjdmNzdlMWZmMjc4NzEwYzJiZTY3NiJ9', '2020-03-07 08:24:29');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
