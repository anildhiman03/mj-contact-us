<?php 

ob_start();
$upload_dir	=	wp_upload_dir();
/* defined variables */
$atn	=	(isset($_REQUEST['atn'])) ? $_REQUEST['atn'] :  '';
define('NAME', 'mj-contact-us');
define('IMGPATH' , plugins_url('/'.NAME.'/images/'));
define('CSSPATH' , plugins_url('/'.NAME.'/css/mj.css'));
define('URL' , admin_url('admin.php?page=mj-mainpage'));
define('FORMURL' , admin_url('admin.php?page=mj-contact-forms'));
define('ADDFORM' , add_query_arg(array('atn'=>'add'), admin_url('admin.php?page=mj-contact-forms')));
define('EDITFORM' , add_query_arg(array('atn'=>'edit'), admin_url('admin.php?page=mj-contact-forms')));
define('FIELDSURL' , admin_url('admin.php?page=mj-contact-fields'));
define('ADDFIELD' , add_query_arg(array('atn'=>'add'), admin_url('admin.php?page=mj-contact-fields')));
define('EDITFIELD' , add_query_arg(array('atn'=>'edit'), admin_url('admin.php?page=mj-contact-fields')));
define('STOREDDATAVIEW' , add_query_arg(array('atn'=>'view','id'=>''), admin_url('admin.php?page=mj-store-fields')));
define('ACTION' , $atn);
define('WP_CAPTCHA_DIR_URL', plugin_dir_url(__FILE__));
define('WP_CAPTCHA_DIR', dirname(__FILE__));

include( plugin_dir_path( __FILE__ ) . '/mj-class-functions.php');
include( plugin_dir_path( __FILE__ ) . '/mj-class-process.php');
include( plugin_dir_path( __FILE__ ) . '/mj-class-html.php');
include( plugin_dir_path( __FILE__ ) . '/db.php');

?>