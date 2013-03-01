-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2013 at 04:21 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wp`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_commentmeta`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://wordpress.org/', '', '2013-01-14 16:02:49', '2013-01-14 16:02:49', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `wp_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `wp_mj_contact_fields`
--

CREATE TABLE IF NOT EXISTS `wp_mj_contact_fields` (
  `column_id` int(10) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(225) DEFAULT NULL,
  `column_name_id` varchar(225) DEFAULT NULL,
  `column_lable` varchar(225) DEFAULT NULL,
  `column_type` int(5) DEFAULT NULL COMMENT 'text,check,password',
  `column_description` text COMMENT 'description',
  `column_classes` text,
  `column_required` tinyint(1) NOT NULL DEFAULT '0',
  `column_validation_type` int(5) DEFAULT NULL,
  `form_ref_id` int(5) DEFAULT NULL,
  `column_status` tinyint(1) DEFAULT NULL,
  `serial` int(3) NOT NULL DEFAULT '0',
  `added_by` int(10) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `wp_mj_contact_fields`
--

INSERT INTO `wp_mj_contact_fields` (`column_id`, `column_name`, `column_name_id`, `column_lable`, `column_type`, `column_description`, `column_classes`, `column_required`, `column_validation_type`, `form_ref_id`, `column_status`, `serial`, `added_by`, `added_on`) VALUES
(6, 'name', 'name', 'name', 1, 'name', 'class1', 1, 0, 4, 1, 1, 1, '2013-02-17 23:09:23'),
(7, 'phone number', 'phone number', 'phone number', 1, 'phone number', 'class1', 1, 2, 4, 1, 2, 1, '2013-02-17 23:09:56'),
(8, 'url', 'url', 'url', 1, 'url', 'class1', 1, 3, 4, 1, 3, 1, '2013-02-17 23:11:34'),
(9, 'email', 'email', 'email', 1, 'email', 'class', 1, 1, 4, 1, 5, 1, '2013-02-17 23:12:31'),
(10, 'subject', 'subject', 'subject', 1, 'subject', 'class1', 1, 0, 4, 1, 5, 1, '2013-02-17 23:13:40'),
(11, 'comment', 'comment', 'comment', 2, 'comment', 'classs1', 1, 0, 4, 1, 7, 1, '2013-02-17 23:14:06'),
(12, 'submit', 'submit', 'submit', 3, 'submit', 'class1', 1, 0, 4, 1, 10, 1, '2013-02-17 23:14:29'),
(13, 'sex', 'sex', 'sex', 4, 'male\r\nfemale', 'male', 0, 0, 4, 1, 4, 1, '2013-02-24 12:43:10'),
(14, 'country', 'country', 'country', 6, 'a\r\nb\r\nc\r\nd\r\ne\r\nf\r\ng\r\nh\r\ni\r\nj\r\nk\r\nl\r\nm\r\nn\r\no\r\np\r\n', 'abc', 1, 0, 4, 1, 7, 1, '2013-02-24 12:44:05'),
(15, 'checkbox1', 'checkbox1', 'checkbox1', 8, 'checkbox1', 'checkbox1', 0, 0, 4, 1, 9, 1, '2013-02-24 12:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `wp_mj_contact_forms`
--

CREATE TABLE IF NOT EXISTS `wp_mj_contact_forms` (
  `form_id` int(10) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(225) DEFAULT NULL,
  `form_div_id` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `added_by` int(10) DEFAULT NULL,
  `added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_mj_contact_forms`
--

INSERT INTO `wp_mj_contact_forms` (`form_id`, `form_name`, `form_div_id`, `email`, `status`, `added_by`, `added_on`) VALUES
(4, 'form23', 'ksjfk', 'asdfasdfa@asdfasd.com', 1, NULL, '2013-01-27 23:23:08'),
(5, 'new form name', 'form id', NULL, 1, NULL, '2013-01-27 23:32:06'),
(6, 'formdf', 'testing', NULL, 0, NULL, '2013-01-27 23:32:17'),
(7, 'form - name', 'form - id', NULL, 1, NULL, '2013-01-27 23:34:59'),
(8, 'f-1', 'kjk', NULL, 1, NULL, '2013-01-27 23:59:03'),
(10, 'form name', 'forme id', 'anil@anil.com', 1, NULL, '2013-02-15 23:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=615 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/blog', 'yes'),
(2, 'blogname', 'plugin', 'yes'),
(3, 'blogdescription', 'Just another WordPress site', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'anil.dhiman@emptask.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:1:{i:0;s:23:"mj-contact-us/index.php";}', 'yes'),
(36, 'home', 'http://localhost/blog', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:2:{i:0;s:55:"D:\\wamp\\www\\blog/wp-content/plugins/akismet/akismet.php";i:1;s:0:"";}', 'no'),
(44, 'template', 'twentytwelve', 'yes'),
(45, 'stylesheet', 'twentytwelve', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '22441', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'posts', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:0:{}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '0', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, '_transient_random_seed', '42473ddd3d6094559b4a88fb717fee2f', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(100, 'cron', 'a:4:{i:1361937776;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1361977781;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1361981014;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(103, '_site_transient_update_plugins', 'O:8:"stdClass":2:{s:12:"last_checked";i:1361900800;s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":5:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:11:"new_version";s:5:"2.5.7";s:3:"url";s:44:"http://wordpress.org/extend/plugins/akismet/";s:7:"package";s:55:"http://downloads.wordpress.org/plugin/akismet.2.5.7.zip";}}}', 'yes'),
(106, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1361900803;s:7:"checked";a:2:{s:12:"twentyeleven";s:3:"1.5";s:12:"twentytwelve";s:3:"1.1";}s:8:"response";a:0:{}}', 'yes'),
(109, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:21:"http://localhost/blog";s:4:"link";s:97:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/blog/";s:3:"url";s:130:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/blog/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(112, 'can_compress_scripts', '1', 'yes'),
(143, 'recently_activated', 'a:0:{}', 'yes'),
(149, 'category_children', 'a:0:{}', 'yes'),
(202, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1358532439', 'yes'),
(203, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3406";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2207";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2091";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1732";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1645";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1450";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1165";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1161";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1153";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1119";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1066";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:3:"983";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"892";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"836";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"826";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:3:"767";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"724";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"719";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"665";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"664";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"617";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"613";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"593";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"573";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"524";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"503";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"498";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"496";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"490";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"471";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"466";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"444";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"441";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"432";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"404";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"401";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"399";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"383";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"382";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"378";}}', 'yes'),
(243, '_site_transient_timeout_browser_94087c43d51ff6840604d50f48ee69f0', '1359476509', 'yes'),
(244, '_site_transient_browser_94087c43d51ff6840604d50f48ee69f0', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"24.0.1312.52";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(279, 'asdf', 'asdfasdasd', 'yes'),
(280, 'dfas', 'afdas', 'yes'),
(316, 'MJmailto', 'anil.dhiman@emptask.com', 'yes'),
(317, 'MJcopytome', '0', 'yes'),
(318, 'MJname', '0', 'yes'),
(319, 'MJemail', '1', 'yes'),
(320, 'MJsubject', '0', 'yes'),
(321, 'MJwebsite', '0', 'yes'),
(322, 'MJcomment', '0', 'yes'),
(323, 'MJattachment', '0', 'yes'),
(348, '_transient_timeout_feed_d08bd582b4774620f5657aef0335c659', '1359697256', 'no'),
(349, '_transient_feed_d08bd582b4774620f5657aef0335c659', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:4:"\n  \n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:83:"\n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n  ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:4:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"link:http://localhost/blog/ - Google Blog Search";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://www.google.com/search?ie=utf-8&q=link:http://localhost/blog/&tbm=blg&tbs=sbd:1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:21:"About 144,000 results";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"The Art of Suversive War - US BRITAM HALLIBURTON SHELL &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://w2sparta.blogspot.com/2013/01/the-art-of-suversive-war-us-britam.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:598:"by <em>localhost</em> (titanium.netdns.net [127.0.0.1]) (amavisd-new, port 10024). with ESMTP id nWRHL2NRVdAP for &lt;pdoughty@britamdefence.com&gt;; <b>...</b> xmlns:m=3D&quot;<em>http</em>://schemas.microsoft.com/office/2004/12/omml&quot; = <b>...</b> mso-style-<em>link</em>:&quot;Balloon Text&quot; ;. font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;} .MsoChpDefault. {mso-style-type:export-only;}. @page WordSection1. {size:612.0pt 792.0pt;. margin:72.0pt 72.0pt 72.0pt 72.0pt;}. div.WordSection1. {page:WordSection1;}. --&gt;&lt;/style&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt; <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:8:"W2SPARTA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Photi Bouri";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 17:31:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:100:"VERBRAUCHERSCHUTZ.ag » &lt;b&gt;Blog&lt;/b&gt; Archive » Premium-Hotels und &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://www.verbraucherschutz.ag/?p=56536";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:517:"Einige der neu im Verkauf stehenden Hotels (<em>http</em>://www.aspimmo.com/deu_cat_6.html). Der Hauptgrund für den Verkauf von erfolgreichen <b>...</b> Da bei ASP Hotel Brokers immer wieder viele Nachfragen über die Arten von Betreiberverträgen ( Pachtvertrag oder Managementvertrag) für Hotelimmobilien eingehen, zeigen die Hotelmakler unter dem folgenen <em>Link</em> die Arten, Vorteile und Nachteile der einzelnen Betreiberverträge für Hotelimmobilien: Exkurs: Betreiberverträge für Hotels und <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:20:"VERBRAUCHERSCHUTZ.ag";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"prgateway";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 17:07:36 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:92:"VERBRAUCHERSCHUTZ.ag » &lt;b&gt;Blog&lt;/b&gt; Archive » Gutscheine &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://www.verbraucherschutz.ag/?p=56531";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:504:"Diese erhalten Sie unter dem <em>Link</em>: Gutschein-Toolbar . Die Toolbar erfüllt dir die Aufgabe, bestimme Angebote zu deinem <b>...</b> Probieren Si. Kledy.de ist ein Social-News und Bookmarkdienst. Benutzer können kostenlos Ihre Lieblingswebseiten oder interessante Artikel und Informationen im WWW mit anderen Besuchern austauschen. Kontakt: Kledy.de. Paolo Capurso Beim Brestenberg 12 79395 Neuenburg am Rhein 07631-798751 info@kledy.de. <em>http</em>://www.kledy.de/. Post to Twitter <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:20:"VERBRAUCHERSCHUTZ.ag";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"prgateway";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 15:20:29 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"c# - How to use URL Rewrite in ASP.Net - Stack Overflow";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://stackoverflow.com/questions/14628701/how-to-use-url-rewrite-in-asp-net";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:281:"<em>http</em>://<em>localhost</em>:64341/Report/MainPage.aspx. when the page loads; I want to see this: <em>http</em>://<em>localhost</em>:64341/Report/MainPage <b>...</b> Know someone who can answer? Share a <em>link</em> to this question via email, Google+, Twitter, or Facebook.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:33:"Recent Questions - Stack Overflow";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"moe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 14:57:44 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"MongoDB | A arte da programação";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://alfavillecode.blogspot.com/2013/01/mongodb.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:513:"No MongoDB, seu documento de post de <em>blog</em> teria um atributo comments para armazenar esses comentários referentes a esse post. Em um banco de <b>...</b> No seu navegador da Web favorito, acesse <em>http</em>://www.mongodb.org/downloads e faça o download do mais recente release de produção estável para Windows. Recomendamos a <b>.....</b> Para obter mais detalhes sobre todos esses operadores, consulte a documentação do MongoDB (veja Recursos para obter um <em>link</em>). É possível <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:23:"A arte da programação";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Felipe Alfaville";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 14:25:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:118:"学习建立自己的Linux系统- mlfever的专栏- 博客频道 &lt;b&gt;...&lt;/b&gt; - CSDN &lt;b&gt;blog&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://blog.csdn.net/mlfever/article/details/8561214";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:623:"声明：以下内容大部分收集自网络，有不明白的请查看原作者的详细说明参考网址:<em>http</em>://www.linuxfromscratch.org/(LF. <b>...</b> <em>http</em>://<em>blog</em>.chinaunix.net/u2/81513/showart.php?id=1276389. LFS6.3完成后继续 <b>.....</b> 127.0.0.1 <em>localhost</em>. 192.168.0.76 talon. # End /etc/hosts (network card version). EOF. #. cat &gt; /etc/sysconfig/network-devices/ifconfig.eth0/ipv4 &lt;&lt; &quot;EOF&quot;. ONBOOT=yes. SERVICE=ipv4-static. IP=192.168.0.76. GATEWAY=192.168.0.1 <b>....</b> echo &quot;start:<em>Link</em> menu.lst To /etc---------------&quot; <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:16:"mlfever的专栏";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"mlfever";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 14:21:40 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Planet Eclipse";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:29:"http://www.planeteclipse.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:275:"About; Add your <em>blog</em>; Friends of Eclipse; <em>Links</em>. Eclipse.org <b>....</b> Looking up string values is probably one of the most common activities in a <em>HTTP</em> server, as header lines are parsed and the semantic meaning interpreted from the text headers.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:18:"The Swordfish Blog";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Oliver Wolf";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 14:18:27 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"website | INFORMATIKA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://multimedia-pamere.blogspot.com/2013/01/website.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:281:"Buka browser baru - Pada Address isikan <em>http</em>://<em>localhost</em>/phpmyadmin <b>...</b> phpnet.us 16. Lakukan editing script pada config.php aura cms dengan masuk ke file manager phpnet.us, klik <em>link</em> www, edit file config.php yang terletak pada include <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:11:"INFORMATIKA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"sri juju";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 13:38:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"c# - Getting [ERR!] as output when trying to use the Nancy &lt;b&gt;...&lt;/b&gt;";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:121:"http://stackoverflow.com/questions/14626630/getting-err-as-output-when-trying-to-use-the-nancy-supersimpleviewengine-to-r";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:297:"When I then go to visit <em>localhost</em> in my browser I get a text simply saying &quot;[ERR!]&quot;, instead of the <b>...</b> can answer? Share a <em>link</em> to this question via email, Google+, Twitter, or Facebook. <b>...</b> Return <em>HTTP</em> substatus error codes from NancyFX? Nancy.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:33:"Recent Questions - Stack Overflow";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Mikkel Løkke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 13:13:06 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:47:"\n      \n      \n      \n      \n      \n      \n    ";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:3:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Kamalesh Kumar: JBoss";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://jbgroups23.blogspot.com/2013/01/jboss.html";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:284:"<b>...</b> <em>localhost</em> and run the process in baground [root@server1 ~]# cd /usr/local/EnterprisePlatform-5.1.0/jboss-eap-5.1/jboss-as/bin/ [root@server1 ~]#nohup ./run.sh -b 192.168.11.210(ip of server) &amp; go to <em>link http</em>://192.168.11.210:8181 enjoy the <b>...</b>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:3:{s:9:"publisher";a:1:{i:0;a:5:{s:4:"data";s:14:"Kamalesh Kumar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"KAMALESH";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"date";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 31 Jan 2013 13:10:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:36:"http://a9.com/-/spec/opensearch/1.1/";a:3:{s:12:"totalResults";a:1:{i:0;a:5:{s:4:"data";s:6:"144000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:10:"startIndex";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:12:"itemsPerPage";a:1:{i:0;a:5:{s:4:"data";s:2:"10";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:12:"content-type";s:28:"text/xml; charset=ISO-8859-1";s:4:"date";s:29:"Thu, 31 Jan 2013 17:38:06 GMT";s:7:"expires";s:2:"-1";s:13:"cache-control";s:18:"private, max-age=0";s:10:"set-cookie";a:2:{i:0;s:143:"PREF=ID=f10ee9a10aa253d0:FF=0:TM=1359653886:LM=1359653886:S=8sh9LR0MCd4g5Mq9; expires=Sat, 31-Jan-2015 17:38:06 GMT; path=/; domain=.google.com";i:1;s:212:"NID=67=imODBH5kje6_zCqogpRm8Nw0DEXCNoL2cPiaFqmK0zZEJP-WvgfrefF56_PaWudzYpcANlnU0BGYJMNPO5cEQJzuuba8In1nFAqum6GZ0O9yoI9nvhp6m6vhmkxPM0XB; expires=Fri, 02-Aug-2013 17:38:06 GMT; path=/; domain=.google.com; HttpOnly";}s:3:"p3p";s:122:"CP="This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info."";s:6:"server";s:3:"gws";s:16:"x-xss-protection";s:13:"1; mode=block";s:15:"x-frame-options";s:10:"SAMEORIGIN";}s:5:"build";s:14:"20121202111312";}', 'no'),
(350, '_transient_timeout_feed_mod_d08bd582b4774620f5657aef0335c659', '1359697256', 'no'),
(351, '_transient_feed_mod_d08bd582b4774620f5657aef0335c659', '1359654056', 'no'),
(490, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:6:"latest";s:8:"download";s:40:"http://wordpress.org/wordpress-3.5.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.5.1.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.5.1-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.5.1-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"3.5.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.5";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1361900800;s:15:"version_checked";s:5:"3.5.1";}', 'yes'),
(491, '_site_transient_timeout_wordpress_credits_en_US', '1361177425', 'yes'),
(492, '_site_transient_wordpress_credits_en_US', 'a:2:{s:6:"groups";a:6:{s:15:"project-leaders";a:4:{s:4:"name";s:15:"Project Leaders";s:4:"type";s:6:"titles";s:7:"shuffle";b:1;s:4:"data";a:6:{s:4:"ryan";a:4:{i:0;s:10:"Ryan Boren";i:1;s:32:"86d6e7e4c83578afd9cdc6935bf65abd";i:2;s:4:"ryan";i:3;s:14:"Lead Developer";}s:11:"markjaquith";a:4:{i:0;s:12:"Mark Jaquith";i:1;s:32:"097a87a525e317519b5ee124820012fb";i:2;s:11:"markjaquith";i:3;s:14:"Lead Developer";}s:4:"matt";a:4:{i:0;s:14:"Matt Mullenweg";i:1;s:32:"767fc9c115a1b989744c755db47feb60";i:2;s:4:"matt";i:3;s:23:"Cofounder, Project Lead";}s:5:"nacin";a:4:{i:0;s:12:"Andrew Nacin";i:1;s:32:"01cfe9feaafb068590891bbd1f6a7f5a";i:2;s:5:"nacin";i:3;s:14:"Lead Developer";}s:6:"azaozz";a:4:{i:0;s:10:"Andrew Ozz";i:1;s:32:"4e84843ebff0918d72ade21c6ee7b1e4";i:2;s:6:"azaozz";i:3;s:14:"Lead Developer";}s:5:"westi";a:4:{i:0;s:14:"Peter Westwood";i:1;s:32:"5b3b5ce04dd402124aba53142b3e47f6";i:2;s:5:"westi";i:3;s:14:"Lead Developer";}}}s:15:"core-developers";a:4:{s:4:"name";s:15:"Core Developers";s:4:"type";s:6:"titles";s:7:"shuffle";b:1;s:4:"data";a:3:{s:4:"dd32";a:4:{i:0;s:10:"Dion Hulse";i:1;s:32:"fa63bbe285f64ba10985551154474e25";i:2;s:4:"dd32";i:3;s:14:"Core Developer";}s:11:"koopersmith";a:4:{i:0;s:17:"Daryl Koopersmith";i:1;s:32:"84e6e5080ee6af9e93464012cf084b8f";i:2;s:11:"koopersmith";i:3;s:14:"Core Developer";}s:5:"duck_";a:4:{i:0;s:8:"Jon Cave";i:1;s:32:"c422d58d80cf37281d34221f21a4a557";i:2;s:5:"duck_";i:3;s:15:"Guest Committer";}}}s:23:"contributing-developers";a:4:{s:4:"name";s:23:"Contributing Developers";s:4:"type";s:6:"titles";s:7:"shuffle";b:1;s:4:"data";a:5:{s:6:"scribu";a:4:{i:0;s:17:"Cristi Burc&#259;";i:1;s:32:"d22c48810052c48be3559293fa07f85f";i:2;s:6:"scribu";i:3;s:0:"";}s:7:"ocean90";a:4:{i:0;s:17:"Dominik Schilling";i:1;s:32:"d9224e70b6bf5e118de06358e53fb498";i:2;s:7:"ocean90";i:3;s:0:"";}s:14:"sergeybiryukov";a:4:{i:0;s:15:"Sergey Biryukov";i:1;s:32:"750b7b0fcd855389264c2b1294d61bd6";i:2;s:14:"sergeybiryukov";i:3;s:0:"";}s:5:"helen";a:4:{i:0;s:15:"Helen Hou-Sandi";i:1;s:32:"6506162ada6b700b151ad8a187f65842";i:2;s:5:"helen";i:3;s:0:"";}s:12:"lancewillett";a:4:{i:0;s:13:"Lance Willett";i:1;s:32:"e9c1bec8fef70a4c6f703a2f48ba0aa6";i:2;s:12:"lancewillett";i:3;s:0:"";}}}s:16:"recent-rockstars";a:4:{s:4:"name";s:16:"Recent Rockstars";s:4:"type";s:6:"titles";s:7:"shuffle";b:1;s:4:"data";a:6:{s:9:"lessbloat";a:4:{i:0;s:11:"Dave Martin";i:1;s:32:"4c5da16f1f65bd9824bc30cb1cc62e8f";i:2;s:9:"lessbloat";i:3;s:0:"";}s:8:"obenland";a:4:{i:0;s:19:"Konstantin Obenland";i:1;s:32:"5e1afe574a796b2194bb6a8088162033";i:2;s:8:"obenland";i:3;s:0:"";}s:11:"DH-Shredder";a:4:{i:0;s:13:"Mike Schroder";i:1;s:32:"76424a001dc6b3ebb4faca0c567800c4";i:2;s:11:"DH-Shredder";i:3;s:0:"";}s:11:"drewstrojny";a:4:{i:0;s:12:"Drew Strojny";i:1;s:32:"bf2b361113b9b05772066ff2924e9245";i:2;s:11:"drewstrojny";i:3;s:0:"";}s:14:"wonderboymusic";a:4:{i:0;s:12:"Scott Taylor";i:1;s:32:"0e9fc8ea22885ed718ee37d31dcffb8c";i:2;s:14:"wonderboymusic";i:3;s:0:"";}s:9:"mattwiebe";a:4:{i:0;s:10:"Matt Wiebe";i:1;s:32:"3f7cda86b0d471afad79a0b5423d1677";i:2;s:9:"mattwiebe";i:3;s:0:"";}}}s:5:"props";a:4:{s:4:"name";s:33:"Core Contributors to WordPress %s";s:12:"placeholders";a:1:{i:0;s:3:"3.5";}s:4:"type";s:4:"list";s:4:"data";a:243:{s:13:"aaroncampbell";s:17:"Aaron D. Campbell";s:13:"aaronholbrook";s:14:"Aaron Holbrook";s:6:"jorbin";s:12:"Aaron Jorbin";s:7:"kawauso";s:11:"Adam Harley";s:10:"alyssonweb";s:9:"akbortoli";s:8:"alecrust";s:8:"alecrust";s:9:"alexvorn2";s:20:"Alexandru Vornicescu";s:6:"xknown";s:11:"Alex Concha";s:11:"alexkingorg";s:9:"Alex King";s:12:"viper007bond";s:25:"Alex Mills (Viper007Bond)";s:4:"ampt";s:4:"ampt";s:8:"sabreuse";s:22:"Amy Hendrix (sabreuse)";s:7:"andrear";s:11:"Andrea Riva";s:10:"andrewryno";s:11:"Andrew Ryno";s:13:"andrewspittle";s:14:"Andrew Spittle";s:4:"andy";s:12:"Andy Skelton";s:11:"apokalyptik";s:11:"apokalyptik";s:10:"bainternet";s:10:"Bainternet";s:5:"barry";s:5:"Barry";s:10:"barrykooij";s:11:"Barry Kooij";s:7:"bbrooks";s:7:"bbrooks";s:8:"casben79";s:9:"Ben Casey";s:6:"husobj";s:9:"Ben Huson";s:12:"benkulbertis";s:13:"Ben Kulbertis";s:7:"bergius";s:7:"bergius";s:5:"neoxx";s:14:"Bernhard Riedl";s:15:"bananastalktome";s:23:"Billy (bananastalktome)";s:8:"bolo1988";s:8:"bolo1988";s:9:"bradparbs";s:9:"bradparbs";s:13:"bradthomas127";s:13:"bradthomas127";s:12:"bradyvercher";s:13:"Brady Vercher";s:11:"brandondove";s:12:"Brandon Dove";s:11:"brianlayman";s:12:"Brian Layman";s:4:"rzen";s:14:"Brian Richards";s:6:"sennza";s:13:"Bronson Quick";s:6:"bpetty";s:11:"Bryan Petty";s:7:"cannona";s:7:"cannona";s:8:"sixhours";s:14:"Caroline Moore";s:6:"caspie";s:6:"Caspie";s:4:"cdog";s:14:"Catalin Dogaru";s:6:"thee17";s:20:"Charles Frees-Melvin";s:9:"chellycat";s:9:"chellycat";s:6:"chexee";s:14:"Chelsea Otakan";s:6:"chouby";s:6:"Chouby";s:10:"c3mdigital";s:14:"Chris Olbekson";s:6:"cfinke";s:17:"Christopher Finke";s:12:"chriswallace";s:13:"Chris Wallace";s:14:"corvannoorloos";s:16:"Cor van Noorloos";s:11:"mrroundhill";s:3:"Dan";s:10:"dan-rivera";s:10:"Dan Rivera";s:12:"deltafactory";s:12:"deltafactory";s:6:"djzone";s:6:"DjZoNe";s:4:"dllh";s:4:"dllh";s:11:"doublesharp";s:11:"doublesharp";s:12:"drewapicture";s:26:"Drew Jaynes (DrewAPicture)";s:9:"eddiemoya";s:10:"Eddie Moya";s:6:"elyobo";s:6:"elyobo";s:10:"emiluzelac";s:11:"Emil Uzelac";s:13:"empireoflight";s:13:"Empireoflight";s:9:"ericlewis";s:17:"Eric Andrew Lewis";s:8:"ethitter";s:12:"Erick Hitter";s:8:"ericmann";s:9:"Eric Mann";s:13:"ericwahlforss";s:13:"ericwahlforss";s:11:"evansolomon";s:12:"Evan Solomon";s:10:"fadingdust";s:10:"fadingdust";s:7:"foxinni";s:7:"foxinni";s:10:"f-j-kaiser";s:18:"Franz Josef Kaiser";s:7:"garyc40";s:8:"Gary Cao";s:5:"garyj";s:10:"Gary Jones";s:5:"pento";s:15:"Gary Pendergast";s:7:"geertdd";s:7:"GeertDD";s:8:"mamaduka";s:19:"George Mamadashvili";s:15:"georgestephanis";s:16:"George Stephanis";s:10:"ghosttoast";s:10:"GhostToast";s:5:"gnarf";s:5:"gnarf";s:12:"goldenapples";s:12:"goldenapples";s:6:"webord";s:15:"Gustavo Bordoni";s:5:"hakre";s:5:"hakre";s:5:"hanni";s:5:"hanni";s:8:"hardy101";s:8:"hardy101";s:6:"hebbet";s:6:"hebbet";s:9:"hugobaeta";s:10:"Hugo Baeta";s:11:"iandstewart";s:11:"Ian Stewart";s:6:"ikailo";s:6:"ikailo";s:7:"ipstenu";s:22:"Ipstenu (Mika Epstein)";s:6:"itworx";s:6:"itworx";s:7:"j-idris";s:7:"j-idris";s:9:"jakemgold";s:12:"Jake Goldman";s:11:"jakubtyrcha";s:12:"jakub.tyrcha";s:12:"jamescollins";s:13:"James Collins";s:8:"jammitch";s:8:"jammitch";s:4:"jane";s:4:"jane";s:4:"japh";s:4:"Japh";s:7:"jarretc";s:7:"JarretC";s:11:"madtownlems";s:28:"Jason Lemahieu (MadtownLems)";s:8:"javert03";s:8:"javert03";s:6:"jcakec";s:6:"jcakec";s:4:"jblz";s:10:"Jeff Bowen";s:11:"jeffsebring";s:12:"Jeff Sebring";s:10:"jeremyfelt";s:11:"Jeremy Felt";s:4:"hd-j";s:12:"Jeremy Herve";s:14:"jerrysarcastic";s:28:"Jerry Bates (JerrySarcastic)";s:6:"jayjdk";s:24:"Jesper Johansen (Jayjdk)";s:11:"jndetlefsen";s:11:"jndetlefsen";s:8:"joehoyle";s:9:"Joe Hoyle";s:9:"joelhardi";s:9:"joelhardi";s:7:"jkudish";s:11:"Joey Kudish";s:11:"johnbillion";s:29:"John Blackbourn (johnbillion)";s:15:"johnjamesjacoby";s:17:"John James Jacoby";s:10:"johnpbloch";s:13:"John P. Bloch";s:6:"jond3r";s:23:"Jonas Bolinder (jond3r)";s:8:"jbrinley";s:16:"Jonathan Brinley";s:12:"jondavidjohn";s:34:"Jonathan D. Johnson (jondavidjohn)";s:14:"joostdekeijzer";s:16:"joost de keijzer";s:4:"koke";s:12:"Jorge Bernal";s:11:"josephscott";s:12:"Joseph Scott";s:8:"betzster";s:9:"Josh Betz";s:11:"picklewagon";s:13:"Josh Harrison";s:9:"pottersys";s:19:"Juan C. (PotterSys)";s:13:"justinsainton";s:14:"Justin Sainton";s:11:"jtsternberg";s:16:"Justin Sternberg";s:10:"greenshady";s:14:"Justin Tadlock";s:7:"trepmal";s:24:"Kailey Lampert (trepmal)";s:6:"ryelle";s:10:"Kelly Dwan";s:7:"keruspe";s:7:"Keruspe";s:7:"kitchin";s:7:"kitchin";s:6:"knutsp";s:13:"Knut Sparhell";s:9:"kovshenin";s:20:"Konstantin Kovshenin";s:9:"kopepasah";s:9:"Kopepasah";s:8:"klagraff";s:18:"Kristopher Lagraff";s:9:"kurtpayne";s:10:"Kurt Payne";s:6:"kyrylo";s:6:"Kyrylo";s:6:"larysa";s:13:"Larysa Mykhas";s:10:"leogermani";s:10:"leogermani";s:7:"lesteph";s:7:"lesteph";s:11:"linuxologos";s:11:"linuxologos";s:10:"ldebrouwer";s:14:"Luc De Brouwer";s:7:"lgedeon";s:11:"Luke Gedeon";s:4:"latz";s:12:"Lutz Schroer";s:12:"mailnew2ster";s:12:"mailnew2ster";s:7:"targz-1";s:18:"Manuel Schmalstieg";s:4:"maor";s:11:"Maor Chasen";s:8:"mimecine";s:5:"Marco";s:10:"marcuspope";s:10:"MarcusPope";s:12:"markoheijnen";s:13:"Marko Heijnen";s:13:"martythornley";s:13:"MartyThornley";s:10:"mattdanner";s:10:"mattdanner";s:9:"bigdawggi";s:16:"Matthew Richmond";s:5:"sivel";s:10:"Matt Martz";s:13:"iammattthomas";s:11:"Matt Thomas";s:8:"mattyrob";s:8:"mattyrob";s:9:"maxcutler";s:10:"Max Cutler";s:9:"melchoyce";s:10:"Mel Choyce";s:5:"merty";s:15:"Mert Yazicioglu";s:8:"mdawaffe";s:24:"Michael Adams (mdawaffe)";s:7:"mfields";s:14:"Michael Fields";s:6:"mbijon";s:10:"Mike Bijon";s:4:"mdgl";s:16:"Mike Glendinning";s:12:"mikehansenme";s:11:"Mike Hansen";s:10:"mikelittle";s:11:"Mike Little";s:12:"mikeschinkel";s:13:"Mike Schinkel";s:5:"toppa";s:10:"Mike Toppa";s:7:"dimadin";s:11:"Milan Dinic";s:15:"mitchoyoshitaka";s:35:"mitcho (Michael Yoshitaka Erlewine)";s:6:"batmoo";s:15:"Mohammad Jangda";s:9:"mohanjith";s:9:"mohanjith";s:13:"mpvanwinkle77";s:13:"mpvanwinkle77";s:10:"usermrpapa";s:7:"Mr Papa";s:8:"mtdesign";s:8:"mtdesign";s:5:"murky";s:5:"murky";s:3:"Nao";s:12:"Naoko Takano";s:7:"alex-ye";s:14:"Nashwan Doaqan";s:12:"niallkennedy";s:13:"Niall Kennedy";s:10:"nbachiyski";s:17:"Nikolay Bachiyski";s:3:"ntm";s:3:"ntm";s:11:"nvartolomei";s:11:"nvartolomei";s:7:"op12no2";s:7:"op12no2";s:7:"pdclark";s:10:"Paul Clark";s:9:"pavelevap";s:9:"pavelevap";s:8:"petemall";s:9:"Pete Mall";s:7:"pas5027";s:13:"Pete Schuster";s:17:"philiparthurmoore";s:19:"Philip Arthur Moore";s:11:"phill_brown";s:11:"Phill Brown";s:10:"picklepete";s:10:"picklepete";s:11:"nprasath002";s:17:"Prasath Nadarajah";s:5:"r-a-y";s:5:"r-a-y";s:5:"ramiy";s:14:"Rami Yushuvaev";s:11:"moraleidame";s:17:"Ricardo Moraleida";s:11:"iamfriendly";s:12:"Richard Tape";s:11:"miqrogroove";s:27:"Robert Chapin (miqrogroove)";s:3:"wet";s:16:"Robert Wetzlmayr";s:8:"wpmuguru";s:11:"Ron Rennick";s:6:"rstern";s:6:"rstern";s:8:"ryanimel";s:9:"Ryan Imel";s:12:"ryanjkoehler";s:12:"Ryan Koehler";s:6:"markel";s:11:"Ryan Markel";s:6:"rmccue";s:10:"Ryan McCue";s:3:"zeo";s:15:"Safirul Alredha";s:6:"gluten";s:13:"Sam Margulies";s:6:"otto42";s:18:"Samuel Wood (Otto)";s:10:"saracannon";s:11:"sara cannon";s:7:"gandham";s:14:"Satish Gandham";s:13:"scottgonzalez";s:14:"scott.gonzalez";s:11:"sc0ttkclark";s:20:"Scott Kingsley Clark";s:11:"coffee2code";s:12:"Scott Reilly";s:8:"greglone";s:12:"ScreenfeedFr";s:21:"sergeysbetkenovgaroru";s:14:"Sergey.S.Betke";s:5:"pross";s:13:"Simon Prosser";s:13:"simonwheatley";s:36:"Simon Wheatley (Code for the People)";s:8:"sirzooro";s:8:"sirzooro";s:12:"solarissmoke";s:12:"solarissmoke";s:8:"ssamture";s:8:"ssamture";s:6:"sterlo";s:17:"Sterling Hamilton";s:12:"sumindmitriy";s:12:"sumindmitriy";s:7:"sushkov";s:7:"sushkov";s:10:"swekitsune";s:10:"swekitsune";s:10:"iamtakashi";s:12:"Takashi Irie";s:8:"taylorde";s:12:"Taylor Dewey";s:8:"tlovett1";s:13:"Taylor Lovett";s:7:"saltcod";s:12:"Terry Sutton";s:9:"griffinjt";s:14:"Thomas Griffin";s:4:"tott";s:12:"Thorsten Ott";s:8:"tmoorewp";s:3:"Tim";s:7:"timbeks";s:8:"Tim Beks";s:5:"timfs";s:5:"timfs";s:8:"tobiasbg";s:8:"TobiasBg";s:6:"tomasm";s:6:"TomasM";s:8:"tomauger";s:9:"Tom Auger";s:11:"tommcfarlin";s:12:"Tom McFarlin";s:7:"willmot";s:11:"Tom Willmot";s:6:"toscho";s:6:"toscho";s:7:"wpsmith";s:12:"Travis Smith";s:6:"vhauri";s:12:"Vasken Hauri";s:19:"viniciusmassuchetto";s:20:"Vinicius Massuchetto";s:15:"lightningspirit";s:14:"Vitor Carvalho";s:11:"waclawjacek";s:6:"Waclaw";s:12:"waldojaquith";s:13:"Waldo Jaquith";s:14:"wojtekszkutnik";s:15:"Wojtek Szkutnik";s:4:"xibe";s:15:"Xavier Borderie";s:5:"yoavf";s:10:"Yoav Farhi";s:6:"yogi-t";s:6:"Yogi T";s:8:"tollmanz";s:12:"Zack Tollman";s:7:"zamoose";s:7:"ZaMoose";}}s:9:"libraries";a:3:{s:4:"name";s:18:"External Libraries";s:4:"type";s:9:"libraries";s:4:"data";a:26:{i:0;a:2:{i:0;s:8:"Backbone";i:1;s:22:"http://backbonejs.org/";}i:1;a:2:{i:0;s:10:"Class POP3";i:1;s:24:"http://squirrelmail.org/";}i:2;a:2:{i:0;s:16:"Color Animations";i:1;s:39:"http://plugins.jquery.com/project/color";}i:3;a:2:{i:0;s:15:"Horde Text Diff";i:1;s:22:"http://pear.horde.org/";}i:4;a:2:{i:0;s:11:"hoverIntent";i:1;s:45:"http://plugins.jquery.com/project/hoverIntent";}i:5;a:2:{i:0;s:13:"imgAreaSelect";i:1;s:42:"http://odyniec.net/projects/imgareaselect/";}i:6;a:2:{i:0;s:4:"Iris";i:1;s:34:"https://github.com/Automattic/Iris";}i:7;a:2:{i:0;s:6:"jQuery";i:1;s:18:"http://jquery.com/";}i:8;a:2:{i:0;s:9:"jQuery UI";i:1;s:20:"http://jqueryui.com/";}i:9;a:2:{i:0;s:14:"jQuery Hotkeys";i:1;s:41:"https://github.com/tzuryby/jquery.hotkeys";}i:10;a:2:{i:0;s:14:"jQuery Masonry";i:1;s:28:"http://masonry.desandro.com/";}i:11;a:2:{i:0;s:22:"jQuery serializeObject";i:1;s:49:"http://benalman.com/projects/jquery-misc-plugins/";}i:12;a:2:{i:0;s:12:"jQuery.query";i:1;s:46:"http://plugins.jquery.com/project/query-object";}i:13;a:2:{i:0;s:14:"jQuery.suggest";i:1;s:41:"http://plugins.jquery.com/project/suggest";}i:14;a:2:{i:0;s:21:"jQuery UI Touch Punch";i:1;s:27:"http://touchpunch.furf.com/";}i:15;a:2:{i:0;s:5:"json2";i:1;s:43:"https://github.com/douglascrockford/JSON-js";}i:16;a:2:{i:0;s:6:"PclZip";i:1;s:33:"http://www.phpconcept.net/pclzip/";}i:17;a:2:{i:0;s:6:"PemFTP";i:1;s:50:"http://www.phpclasses.org/browse/package/1743.html";}i:18;a:2:{i:0;s:6:"phpass";i:1;s:31:"http://www.openwall.com/phpass/";}i:19;a:2:{i:0;s:9:"PHPMailer";i:1;s:55:"http://code.google.com/a/apache-extras.org/p/phpmailer/";}i:20;a:2:{i:0;s:8:"Plupload";i:1;s:24:"http://www.plupload.com/";}i:21;a:2:{i:0;s:9:"SimplePie";i:1;s:21:"http://simplepie.org/";}i:22;a:2:{i:0;s:27:"The Incutio XML-RPC Library";i:1;s:34:"http://scripts.incutio.com/xmlrpc/";}i:23;a:2:{i:0;s:8:"Thickbox";i:1;s:32:"http://jquery.com/demo/thickbox/";}i:24;a:2:{i:0;s:7:"TinyMCE";i:1;s:23:"http://www.tinymce.com/";}i:25;a:2:{i:0;s:10:"Underscore";i:1;s:24:"http://underscorejs.org/";}}}}s:4:"data";a:2:{s:8:"profiles";s:32:"http://profiles.wordpress.org/%s";s:7:"version";s:3:"3.5";}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(495, '_site_transient_timeout_wporg_theme_feature_list', '1361116876', 'yes'),
(496, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(521, '_site_transient_timeout_browser_5d1b138b01487e672555b2d121154b40', '1361906165', 'yes'),
(522, '_site_transient_browser_5d1b138b01487e672555b2d121154b40', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"24.0.1312.57";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(535, 'mjNumberCaptcha', '0', 'yes'),
(536, 'mjStringCaptcha', '1', 'yes'),
(537, 'mjEnableCaptcha', '0', 'yes'),
(541, '_site_transient_timeout_browser_013accafa1d7729e25f03df1a3cf16f1', '1361939662', 'yes'),
(542, '_site_transient_browser_013accafa1d7729e25f03df1a3cf16f1', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"18.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(560, '_site_transient_timeout_browser_051d97feff8e807ffa89716878f9c9ad', '1362237148', 'yes'),
(561, '_site_transient_browser_051d97feff8e807ffa89716878f9c9ad', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"25.0.1364.97";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(598, '_transient_timeout_plugin_slugs', '1361905076', 'no'),
(599, '_transient_plugin_slugs', 'a:4:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:23:"mj-contact-us/index.php";i:3;s:24:"user-dashboard/index.php";}', 'no'),
(603, '_site_transient_timeout_theme_roots', '1361902602', 'yes'),
(604, '_site_transient_theme_roots', 'a:2:{s:12:"twentyeleven";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(605, '_transient_timeout_feed_a5420c83891a9c88ad2a4f04584a5efc', '1361944021', 'no'),
(606, '_transient_feed_a5420c83891a9c88ad2a4f04584a5efc', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wordpress.org/extend/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 26 Feb 2013 17:35:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wordpress.org/extend/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:39:"15@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wordpress.org/extend/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"2141@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"1169@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:120:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 6 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/extend/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"23862@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:104:"Supercharge your WordPress site with powerful features previously only available to WordPress.com users.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:24:"Michael Adams (mdawaffe)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wordpress.org/extend/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:40:"132@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Arne";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wordpress.org/extend/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:40:"753@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:86:"WordPress SEO plugin to automatically optimize your Wordpress blog for Search Engines.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/extend/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"8321@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the WordPress SEO plugin by Yoast.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"18101@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"12073@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Contact Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://wordpress.org/extend/plugins/contact-form-plugin/#post-26890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 May 2011 07:34:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"26890@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:43:"Add Contact Form to your WordPress website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bestwebsoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Yet Another Related Posts Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wordpress.org/extend/plugins/yet-another-related-posts-plugin/#post-2769";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Jan 2008 13:05:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"2769@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:122:"Display a list of related entries on your site and feeds based on a unique algorithm. Now with thumbnail support built-in!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:35:"mitcho (Michael Yoshitaka Erlewine)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Image Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/extend/plugins/image-widget/#post-6343";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 Jul 2008 15:13:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"6343@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"A simple image widget that uses the native WordPress media manager to add image widgets to your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Peter Chester";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Ultimate TinyMCE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/extend/plugins/ultimate-tinymce/#post-32088";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Nov 2011 09:06:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"32088@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:84:"Description: Beef up your visual tinymce editor with a plethora of advanced options.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Josh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Facebook";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/extend/plugins/facebook/#post-37351";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 May 2012 19:36:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"37351@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:75:"Make your WordPress site social in a couple of clicks, powered by Facebook.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:18:"Samuel Wood (Otto)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Share Buttons by AddThis";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/extend/plugins/addthis/#post-8124";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Dec 2008 16:03:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"8124@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"AddThis Share Buttons help drive traffic to your site by helping visitors share, bookmark and email your content to over 330 services.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"_mjk_";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:52:"http://wordpress.org/extend/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:7:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 26 Feb 2013 17:44:01 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Fri, 09 Mar 2007 22:11:30 GMT";s:4:"x-nc";s:11:"HIT luv 138";}s:5:"build";s:14:"20121202111312";}', 'no'),
(607, '_transient_timeout_feed_mod_a5420c83891a9c88ad2a4f04584a5efc', '1361944021', 'no'),
(608, '_transient_feed_mod_a5420c83891a9c88ad2a4f04584a5efc', '1361900821', 'no'),
(609, '_transient_timeout_feed_57bc725ad6568758915363af670fd8bc', '1361944022', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(610, '_transient_feed_57bc725ad6568758915363af670fd8bc', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/extend/plugins/browse/new/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress Plugins » View: Newest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 26 Feb 2013 17:11:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Urdu Date and Time Display";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wordpress.org/extend/plugins/urdu-date-and-time-display/#post-49806";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 21 Feb 2013 08:56:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49806@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:100:"Urdu Date and Time Display to covert date and time into Urdu Language according to English calendar.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Imran Ali Mughal";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Post Share";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/extend/plugins/post-share/#post-48881";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 31 Jan 2013 02:15:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"48881@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:57:"Post Share, a simple plugin to sharing your content easy.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"himeneznios";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Playerzbr";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://wordpress.org/extend/plugins/playerzbr/#post-49756";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 20 Feb 2013 14:02:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49756@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"PlayerZBr is the streaming player to your radio or your online music site, done in HTML 5 for you to use with streaming audio.\n\nPS - Mozilla Firefox i";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"pedrolaxe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Polaroid Slider Lite";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/extend/plugins/polaroid-slider-lite/#post-49977";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 17:27:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49977@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"A nice looking polaroid-style image/video slider.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"wpdreams";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WPML flag in menu Extended";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wordpress.org/extend/plugins/wpml-flag-in-menu-extended/#post-49933";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 24 Feb 2013 22:28:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49933@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:95:"Shows translated flags (for every language except current viewing lang) in selected menu&#039;s";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"jvandemerwe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Color Scheme every Theme";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wordpress.org/extend/plugins/color-scheme-every-theme/#post-49932";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 24 Feb 2013 21:53:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49932@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"This plugin lets you change the entire color scheme of the current theme via the theme customizer.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"danielauener";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Posts Most Read";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/wp-posts-most-read/#post-49925";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 24 Feb 2013 16:11:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49925@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:87:"Count the number of posts views and display a list in a widget. Display thumbnails too.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"iziweb_@venir";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"HonestyBoxx Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/extend/plugins/honestyboxx/#post-49813";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 21 Feb 2013 16:01:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49813@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"HonestyBoxx displays the HonestyBoxx Widget on your WordPress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"HonestyBoxx";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"Docebo LMS E-Learning Platform Integration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wordpress.org/extend/plugins/docebo-lms-elearning-platform-integration/#post-49900";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Feb 2013 08:59:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49900@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"By enabling the integration between the Docebo E-Learning platform and WordPress, this plug­in transforms any WP site into an E-Lea";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Docebo SRL";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Webloggerz WP Social Media Wigdet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"http://wordpress.org/extend/plugins/webloggerz-wp-social-media-widget/#post-49969";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 12:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49969@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Webloggerz Social Media Wigdet : A beautiful widget to be used in sidebar or footer, it allows you to add your Twitter , Facebook, Google Plus and Fee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Ansh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"YourDeveloper Profanity Filter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wordpress.org/extend/plugins/yourdeveloper-profanity-filter/#post-49970";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 12:43:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49970@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:93:"Replace &#34;banned&#34; words with another word or symbol to keep your wordpress site clean.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"yourdeveloper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Plugin Name";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/extend/plugins/smslist/#post-49964";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 11:29:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49964@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7:"SMSList";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"GayretSoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Permalauts Plus";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/extend/plugins/permalauts-plus/#post-49960";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 25 Feb 2013 08:56:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49960@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:106:"Erm&#246;glicht das automatisierte Umschreiben von deutschen Umlauten in URLs in einen lesbaren Permalink.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"clearboth";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Domain Redirect";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/extend/plugins/wp-domain-redirect/#post-49561";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Feb 2013 12:20:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49561@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:78:"WP Domain Redirect plugin is intended for domain redirection based on country.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"dmitritechs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Wordpress Button Creator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wordpress.org/extend/plugins/button-creator/#post-49751";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 20 Feb 2013 09:37:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"49751@http://wordpress.org/extend/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Easily create a submit button for your Wordpress site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"jeffb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:48:"http://wordpress.org/extend/plugins/rss/view/new";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 26 Feb 2013 17:44:02 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:7:"expires";s:29:"Tue, 26 Feb 2013 17:46:44 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 26 Feb 2013 17:11:44 +0000";s:4:"x-nc";s:11:"HIT luv 138";}s:5:"build";s:14:"20121202111312";}', 'no'),
(611, '_transient_timeout_feed_mod_57bc725ad6568758915363af670fd8bc', '1361944022', 'no'),
(612, '_transient_feed_mod_57bc725ad6568758915363af670fd8bc', '1361900822', 'no'),
(613, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1361944022', 'no'),
(614, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '<h4>Most Popular</h4>\n<h5><a href=''http://wordpress.org/extend/plugins/contact-form-plugin/''>Contact Form</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=contact-form-plugin&amp;_wpnonce=cc9b919825&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Contact Form''>Install</a>)</span>\n<p>Add Contact Form to your WordPress website.</p>\n<h4>Newest Plugins</h4>\n<h5><a href=''http://wordpress.org/extend/plugins/yourdeveloper-profanity-filter/''>YourDeveloper Profanity Filter</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=yourdeveloper-profanity-filter&amp;_wpnonce=632121945c&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''YourDeveloper Profanity Filter''>Install</a>)</span>\n<p>Replace &quot;banned&quot; words with another word or symbol to keep your wordpress site clean.</p>\n', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 2, '_edit_lock', '1361122595:1'),
(3, 2, '_edit_last', '1'),
(4, 1, '_edit_lock', '1358277769:1'),
(5, 1, '_edit_last', '1'),
(8, 11, '_edit_last', '1'),
(9, 11, '_edit_lock', '1358522127:1'),
(10, 11, '_wp_page_template', 'default'),
(11, 17, '_edit_last', '1'),
(12, 17, '_edit_lock', '1361697117:1'),
(13, 17, '_wp_page_template', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-01-14 16:02:49', '2013-01-14 16:02:49', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2013-01-15 19:24:36', '2013-01-15 19:24:36', '', 0, 'http://localhost/blog/?p=1', 0, 'post', '', 1),
(2, 1, '2013-01-14 16:02:49', '2013-01-14 16:02:49', '[user-dashboard]', 'Dashboard', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2013-01-14 16:05:57', '2013-01-14 16:05:57', '', 0, 'http://localhost/blog/?page_id=2', 0, 'page', '', 0),
(4, 1, '2013-01-14 16:02:49', '2013-01-14 16:02:49', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/blog/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision', '', '', '2013-01-14 16:02:49', '2013-01-14 16:02:49', '', 2, 'http://localhost/blog/?p=4', 0, 'revision', '', 0),
(6, 2, '2013-01-14 16:11:44', '2013-01-14 16:11:44', 'this is testing 2- category post', 'testing2', '', 'publish', 'open', 'open', '', 'testing2', '', '', '2013-01-14 16:11:44', '2013-01-14 16:11:44', '', 0, 'http://localhost/blog/testing2/', 0, 'post', '', 0),
(7, 1, '2013-01-15 19:22:09', '2013-01-15 19:22:09', '[user-dashboard]', 'Dashboard', '', 'inherit', 'open', 'open', '', '2-autosave', '', '', '2013-01-15 19:22:09', '2013-01-15 19:22:09', '', 2, 'http://localhost/blog/2-autosave/', 0, 'revision', '', 0),
(8, 1, '2013-01-14 16:02:49', '2013-01-14 16:02:49', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision', '', '', '2013-01-14 16:02:49', '2013-01-14 16:02:49', '', 1, 'http://localhost/blog/1-revision/', 0, 'revision', '', 0),
(9, 1, '2013-01-15 19:24:25', '2013-01-15 19:24:25', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-2', '', '', '2013-01-15 19:24:25', '2013-01-15 19:24:25', '', 1, 'http://localhost/blog/1-revision-2/', 0, 'revision', '', 0),
(11, 1, '2013-01-18 15:10:28', '2013-01-18 15:10:28', '[mjcontactus]', 'mj contact us', '', 'publish', 'open', 'open', '', 'mj-contact-us', '', '', '2013-01-18 15:10:28', '2013-01-18 15:10:28', '', 0, 'http://localhost/blog/?page_id=11', 0, 'page', '', 0),
(12, 1, '2013-01-18 15:10:00', '2013-01-18 15:10:00', '', 'mj contact us', '', 'inherit', 'open', 'open', '', '11-revision', '', '', '2013-01-18 15:10:00', '2013-01-18 15:10:00', '', 11, 'http://localhost/blog/11-revision/', 0, 'revision', '', 0),
(13, 1, '2013-01-18 15:11:29', '2013-01-18 15:11:29', '[mjcontactus]', 'mj contact us', '', 'inherit', 'open', 'open', '', '11-autosave', '', '', '2013-01-18 15:11:29', '2013-01-18 15:11:29', '', 11, 'http://localhost/blog/11-autosave/', 0, 'revision', '', 0),
(17, 1, '2013-02-17 17:37:49', '2013-02-17 17:37:49', '[mjform id=4]', 'dynamic contact us', '', 'publish', 'open', 'open', '', 'dynamic-contact-us', '', '', '2013-02-17 17:38:40', '2013-02-17 17:38:40', '', 0, 'http://localhost/blog/?page_id=17', 0, 'page', '', 0),
(18, 1, '2013-02-17 17:37:42', '2013-02-17 17:37:42', '', 'dynamic contact us', '', 'inherit', 'open', 'open', '', '17-revision', '', '', '2013-02-17 17:37:42', '2013-02-17 17:37:42', '', 17, 'http://localhost/blog/17-revision/', 0, 'revision', '', 0),
(19, 1, '2013-02-17 17:37:49', '2013-02-17 17:37:49', '[mjform id=1]', 'dynamic contact us', '', 'inherit', 'open', 'open', '', '17-revision-2', '', '', '2013-02-17 17:37:49', '2013-02-17 17:37:49', '', 17, 'http://localhost/blog/17-revision-2/', 0, 'revision', '', 0),
(20, 1, '2013-02-23 15:12:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-02-23 15:12:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/blog/?p=20', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'category-1', 'category-1', 0),
(3, 'category-2', 'category-2', 0),
(4, 'category-3', 'category-3', 0),
(5, 'category-4', 'category-4', 0),
(6, 'test,test2', 'testtest2', 0),
(7, 'test', 'test', 0),
(8, 'test2', 'test2', 0),
(9, 'testing,testing2', 'testingtesting2', 0),
(10, 'testing', 'testing', 0),
(11, 'testing2', 'testing2', 0),
(12, 'tag1', 'tag1', 0),
(13, 'tags2', 'tags2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 3, 0),
(1, 12, 0),
(1, 13, 0),
(6, 3, 0),
(6, 10, 0),
(6, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 0),
(3, 3, 'category', '', 0, 2),
(4, 4, 'category', '', 0, 0),
(5, 5, 'category', '', 0, 0),
(6, 6, 'post_tag', '', 0, 0),
(7, 7, 'post_tag', '', 0, 0),
(8, 8, 'post_tag', '', 0, 0),
(9, 9, 'post_tag', '', 0, 0),
(10, 10, 'post_tag', '', 0, 1),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'post_tag', '', 0, 1),
(13, 13, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(14, 1, 'show_welcome_panel', '0'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '20'),
(16, 1, 'wp_user-settings', 'editor=tinymce'),
(17, 1, 'wp_user-settings-time', '1358531502'),
(18, 2, 'first_name', 'anil'),
(19, 2, 'last_name', 'kumar'),
(20, 2, 'nickname', 'anil'),
(21, 2, 'description', ''),
(22, 2, 'rich_editing', 'true'),
(23, 2, 'comment_shortcuts', 'false'),
(24, 2, 'admin_color', 'fresh'),
(25, 2, 'use_ssl', '0'),
(26, 2, 'show_admin_bar_front', 'true'),
(27, 2, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(28, 2, 'wp_user_level', '0'),
(29, 2, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(30, 1, 'closedpostboxes_dashboard', 'a:7:{i:0;s:19:"dashboard_right_now";i:1;s:25:"dashboard_recent_comments";i:2;s:24:"dashboard_incoming_links";i:3;s:21:"dashboard_quick_press";i:4;s:23:"dashboard_recent_drafts";i:5;s:17:"dashboard_primary";i:6;s:19:"dashboard_secondary";}'),
(31, 1, 'metaboxhidden_dashboard', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$Bj7dlp.9sPPoG2tYGC4j13ZEuakXML/', 'admin', 'anil.dhiman@emptask.com', '', '2013-01-14 16:02:49', '', 0, 'admin'),
(2, 'anil', '21232f297a57a5a743894a0e4a801fc3', 'anil', 'testing@testing.com', '', '2013-01-14 16:10:17', '', 0, 'anil kumar');
