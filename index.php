<?php
/*
Plugin Name: MJ Contact us
Plugin URI: http://mecontact.wordpress.com/mj-contact-us-plugin/
Description: mj contact us a simple form with 4-5 fields to send email address to admin . its a simple contact us form with easy to customize coding standard and easy to customize html standard. <strong>add this code</strong> [mjcontactus] <strong>in page from admin section to activate plugin form also be sure that you have get_header() function in your header file so that validation can be work properly</strong>
Author: anil kumar
Version: 5.2.2
Author URI: http://about.me/anilDhiman
*/

global $MjCon_db_version;
$MjCon_db_version = "5.2.2";

include( plugin_dir_path( __FILE__ ) . 'files/includes.php');
add_action("wp_enqueue_scripts", "my_jquery_enqueue"); 
add_shortcode('mjcontactus', 'mj_contact_us');
add_action('admin_menu', 'AdminIndex');
add_action( 'admin_init', 'my_jquery_enqueue' );
add_action('init', '_init_sessions');


function my_jquery_enqueue() {
   //wp_deregister_script('mjform');
   wp_register_script( 'JsMj', plugins_url( '/js/mjCon.js', __FILE__ ),__FILE__,'1.0'  );
   wp_register_script( 'jQuery.validation', plugins_url( '/js/jquery.validate.js', __FILE__ ) );
   wp_enqueue_script('jquery');
   wp_enqueue_script('JsMj');
   wp_enqueue_script('jQuery.validation');
   wp_register_style( 'CssMj', plugins_url( '/css/mjCont.css', __FILE__ ) );
   wp_enqueue_style( 'CssMj' );
}


function mj_contact_us(){
    $MjObj	=	new mjContactHTML;
    $MjObj->SendMail();
    echo $MjObj->mjForm();
}
function AdminIndex(){
	add_menu_page('Contact US', 'Contact US', 'manage_options', 'mj-mainpage', 'AdminMainPage');
	add_submenu_page( 'mj-mainpage', 'Mj Contact form', 'Contact Forms', 'manage_options', 'mj-contact-forms', 'MjContactForms');
	add_submenu_page( 'mj-mainpage', 'Mj Contact fields', 'Contact Field', 'manage_options', 'mj-contact-fields', 'MjContactFields');
	add_submenu_page( 'mj-mainpage', 'Mj store fields', 'Stored Data', 'manage_options', 'mj-store-fields', 'MjContactStoreForms');
}
function AdminMainPage(){
    $MjObj	=	new mjContactHTML;
    $MjObj->AdminSwitch();
}

function MjContactForms(){
	MjFunctions::message();
    $MjObj	=	new mjContactHTML;
    $MjObj->ManageForms();
}

function MjContactFields(){
	$MjObj	=	new mjContactHTML;
    $MjObj->ManageFields();
}

function MjContactStoreForms(){
	$MjObj	=	new mjContactHTML;
    $MjObj->ManageStoreForms();
}
function addShortCode($attr){

	if(!isset($attr['id'])){
		echo "Please place form id";
	}else{
		MjFunctions::dynamicForm($attr['id']);
	}
}
add_shortcode('mjform', 'addShortCode');

function _init_sessions(){
    MjFunctions::mj_captcha_init_sessions();
}

function MjCon_deinstall(){
	global $wpdb;
	$field 	= $wpdb->prefix . "mj_contact_fields";
	$form 	= $wpdb->prefix . "mj_contact_forms";
	$save 	= $wpdb->prefix . "mj_contact_saved_forms";
	mysql_query("DROP TABLE $save,$form,$field") or die(mysql_error());
	delete_option('MjCon_db_version');
}

register_deactivation_hook(__FILE__,'MjCon_deinstall');

?>