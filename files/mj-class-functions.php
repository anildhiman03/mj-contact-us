<?php
/**
 * simple function file
 */
class MjFunctions{

	public static $fieldType	=	array(
							1=>'Text',
							2=>'Textarea',
							3=>'Submit',
							4=>'Radio',
							5=>'Checkbox',
							6=>'Dropdown',
							//7=>'File',
							8=>'Chapcha',
						);
	public static $validationRules	=	array(
							0=>'text',
							1=>'email',
							2=>'number',
							3=>'url',
							//5=>'Regular Expression',
						);
	
    public static function MathCaptcha(){
        $rand_int1 = substr(mt_rand(),0,2);
        $rand_int2 = substr(mt_rand(),0,1);
        $rand_int3 = substr(mt_rand(),0,1);
        $captcha_answer = $rand_int1 + $rand_int2 - $rand_int3;
        $_SESSION['captcha_answer'] = $captcha_answer;
        return $rand_int1.' + '.$rand_int2.' - '.$rand_int3." = ?";
    }
    public static function BaseIncode(){
        return base64_encode($_SESSION['captcha_answer']);
    }
    public static function BaseDecode($value){
        return base64_decode($value);
    }
	
	public static function GetFormData(){
		global $wpdb;
		$table_name = $wpdb->prefix . "mj_contact_forms";
		$active_rows = $wpdb->get_results(
			"SELECT * FROM {$table_name}"
		);
		return $active_rows;
	}
	
	public static function GetFormFielsData(){
		global $wpdb;
		$table_name = $wpdb->prefix . "mj_contact_fields";
		$active_rows = $wpdb->get_results(
			"SELECT * FROM {$table_name}"
		);
		return $active_rows;
	}
	
	
	public static function message(){
		$MSG	=	(isset($_REQUEST['MSG'])) ? $_REQUEST['MSG']: '';
		switch($MSG){
			case 'A01BC':
				echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data saved Successfully</div></div>";
			break;
			case 'AS091K23':
				echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data saved Successfully</div></div>";
			break;
			case 'C02SC':
				echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data updated Successfully</div></div>";
			break;
			case 'F02AF':
				echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data deleted Successfully</div></div>";
			break;
			case 'S02AS':
				echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data status Changed Successfully</div></div>";
			break;
			case 'AS091K24':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Error while saving data. Please try it later</div></div>";
			break;
            # new message
            case 'E-FRM-NAME':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Empty Form Name</div></div>";
			    break;
			case 'E-FRM-ID':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Empty Form ID</div></div>";
			    break;
			case 'E-FRM-INVALID':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Invalid Request</div></div>";
			    break;
			case 'E-FIELD-NAME':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Empty Field Name</div></div>";
			    break;
			case 'E-FIELD-ID':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : Empty Field ID</div></div>";
			    break;
			case 'E-FIELD-TYPE':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : No Field Type Selected</div></div>";
			    break;
			case 'E-FIELD-FORM':
				echo "<div class='error p-12' id='message'><div class='p-12'>Error : No Form Selected</div></div>";
			    break;
			case 'S-INSERTED':
                echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data Saved Successfully !</div></div>";
			    break;
			case 'STATUS':
                echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Status Updated Successfully !</div></div>";
			    break;
			case 'DELETED':
                echo "<div class='updated p-12' id='message'><div class='p-12'>Success : Data Deleted Successfully !</div></div>";
			    break;
			default:
			break;
		}
	}
	
	public static function GetFormDataById($id='0'){
		global $wpdb;
		$table_name = $wpdb->prefix . "mj_contact_forms";
		$data 		= $wpdb->get_row("SELECT * FROM $table_name WHERE form_id = '$id'", ARRAY_A);
		return $data;
	}
	
	
	public static function GetFormFieldDataById($id = '0'){
		global $wpdb;
		$table_name = $wpdb->prefix . "mj_contact_fields";
		$data 		= $wpdb->get_row("SELECT * FROM $table_name WHERE `column_id` = '$id'", ARRAY_A);
		return $data;
	}
	
	public static function getFormFieldbyFormId($form_ref_id	=	'0'){
		global $wpdb;
		$table_name = $wpdb->prefix . "mj_contact_fields";
		$data 		= $wpdb->get_results("SELECT * FROM $table_name WHERE `form_ref_id` = '$form_ref_id' AND column_status='1' order by serial", ARRAY_A);
		return $data;
	}
	
	public static function GetFormDataDropdown($selected = '',$class){
		$data 	=	self::GetFormData();
		echo "<select name='formrefid' id='formrefid' class='{$class}'>";
		echo "<option value='0'>Select a form</option>";
			foreach($data as $value){
				if($value->form_id==$selected){
					echo "<option value='{$value->form_id}' selected='selected' >{$value->form_name}</option>";
				}else{
					echo "<option value='{$value->form_id}'>{$value->form_name}</option>";
				}
			}
		echo "</select>";
	}
	
	public static function getFieldType($selected = '',$class=''){
		
		$data 	=	self::$fieldType;
		echo "<select name='column_type' id='column_type' class='{$class}'>";
		echo "<option value='0'>Select a field type</option>";
			foreach($data as $key=>$value){
				if($key==$selected){
					echo "<option selected='selected' value='{$key}'>{$value}</option>";
				}else{
					echo "<option value='{$key}'>{$value}</option>";
				}
			}
		echo "</select>";
	}
	
	public static function getFieldValidationType($selected = '',$class=''){
		$data 	=	self::$validationRules;
		echo "<select name='fieldvalidation' id='fieldvalidation' class='{$class}'>";
		echo "<option value='0'>Select a validation type</option>";
			foreach($data as $key=>$value){
				if($key==$selected){
					echo "<option selected='selected' value='{$key}'>{$value}</option>";
				}else{
					echo "<option value='{$key}'>{$value}</option>";
				}
			}
		echo "</select>";
	}

	/*
	 *  function user to update field status
	 */

	public static function updateFieldStatus(){
		    global $wpdb;
			$table_name = 	$wpdb->prefix . "mj_contact_fields";
			$id			=	$_REQUEST['id'];

			if(empty($id) && !is_numeric($id)){
                return 'InValidCode';
            }

			$Update		=	$wpdb->query("UPDATE $table_name SET `column_status`= CASE WHEN `column_status` = 1 THEN 0 WHEN `column_status` = 0 THEN 1 END WHERE `column_id`=$id");
			return $Update;
	}


/*
 *  function use to delete field
 */

    public static function deleteField(){
        global $wpdb;
        $table_name = $wpdb->prefix . "mj_contact_fields";
        $id			=	$_REQUEST['id'];

        if(empty($id) && !is_numeric($id)){
            return 'InValidCode';
        }

        $Delete		=	$wpdb->query( $wpdb->prepare(
            "delete from $table_name where `column_id`='%d'"
        ,array(
                $id,
        )
        ));
        return $Delete;

    }

    public static function editField(){

        if(isset($_POST['MJfieldact'])) {

            global $wpdb;
            $table_name = $wpdb->prefix . "mj_contact_fields";

            $serial		=	(isset($_POST['serial']) 		&& !empty($_POST['serial'])) ? $_POST['serial']				:'';
            $column_name		=	(isset($_POST['column_name']) 		&& !empty($_POST['column_name'])) ? $_POST['column_name']				:'';
            $column_name_id		=	(isset($_POST['column_name_id']) 	&& !empty($_POST['column_name_id'])) ? $_POST['column_name_id']			:'';
            $column_lable		=	(isset($_POST['column_lable']) 		&& !empty($_POST['column_lable'])) ? $_POST['column_lable']			:'';
            $column_type		=	(isset($_POST['column_type']) 		&& !empty($_POST['column_type'])) ? $_POST['column_type']				:'0';
            $column_description	=	(isset($_POST['column_description']) && !empty($_POST['column_description'])) ? $_POST['column_description']:'';
            $column_classes		=	(isset($_POST['column_classes']) 	&& !empty($_POST['column_classes'])) ? $_POST['column_classes']			:'';
            $column_required	=	(isset($_POST['column_required']) 	&& !empty($_POST['column_required'])) ? $_POST['column_required']		:'0';
            $fieldvalidation	=	(isset($_POST['fieldvalidation']) 	&& !empty($_POST['fieldvalidation'])) ? $_POST['fieldvalidation']		:'0';
            $formrefid			=	(isset($_POST['formrefid']) 		&& !empty($_POST['formrefid'])) ? $_POST['formrefid']					:'0';
            $column_status		=	(isset($_POST['column_status']) 	&& !empty($_POST['column_status'])) ? $_POST['column_status']			:'0';
            $current_user		=	get_current_user_id();
            $column_id			=	$_POST['id'];

            if(empty($column_name)){

                return 'EmptyColumnName';

            }elseif(empty($column_name_id)){

                return 'EmptyColumnId';

            }elseif($column_type==0){

                return 'EmptyColumnType';

            }elseif($formrefid==0){

                return 'EmptyFormType';

            }

		$update  = $wpdb->update(
				$table_name,
				array(
                    'column_name' 			=> $column_name,
                    'column_name_id' 		=> $column_name_id,
                    'column_lable' 			=> $column_lable,
                    'column_type' 			=> $column_type,
                    'column_description' 	=> $column_description,
                    'column_classes' 		=> $column_classes,
                    'column_required' 		=> $column_required,
                    'column_Validation_type'=> $fieldvalidation,
                    'form_ref_id' 			=> $formrefid,
                    'column_status' 		=> $column_status,
                    'serial' 		        => $serial,
                    'added_by' 				=> $current_user
				),
            array('column_id'=>$column_id),
				array(
                    '%s',
                    '%s',
                    '%s',
                    '%d',
                    '%s',
                    '%s',
                    '%d',
                    '%d',
                    '%d',
                    '%d',
                    '%d',
                    '%d'
				),
            array('%d')
			);
            return $update;
        }
    }


    public function dynamicForm($formId){
        $data 	=	self::GetFormDataById($formId);
        if($data){
            mjContactPRO::dynamicFormProcess();
            self::createDynamicForm($formId);
        }else{
            echo "invalid Form Id";
        }
    }

    public function createDynamicForm($formid){
        global $post;
        $form   =    self::GetFormDataById($formid);
        $data	=	self::getFormFieldbyFormId($formid);
        $action =   get_permalink($post->ID);
        $name   =   (is_page())?  'page_id' : (is_home()) ? 'page_id' : 'post_id';
        $form_name    =   self::removeSpace($form[form_name]);
        $form_div_id  =   self::removeSpace($form[form_div_id]);
        ?>
    <script>jQuery(document).ready(function() { jQuery("#<?php echo $form_div_id; ?>").validate(); });</script>
    <?php
        echo "<form id='$form_div_id' action='$action' method='post'>";
        foreach($data as $key => $value){
            echo "<div class='fieldBlock'>";
                echo '<div for="label" class="label">'.self::Labels($value).'</div>';
                echo '<div for="field" class="field">'.self::Fields($value).'</div>';
            echo "</div>";
        } ?>
    <?php
        echo "<input type='hidden' name='page_id' value='$post->ID'>";
        echo "<input type='hidden' name='dnForm' value='$formid'>";
        echo '</form>';
    }

/*
 * function to generate dynamic field
 * 1=>'Text',2=>'Textarea',3=>'Submit',4=>'Radio',5=>'Checkbox',6=>'DropDown',
 */
    public static function Fields($field){
        $id             =   $field['column_validation_type'];
        $column_classes =   $field['column_classes'];
        $textFieldType  =   self::$validationRules[$id];
        $column_id      =   $field[column_id];
        $column_name    =   self::removeSpace($field[column_name]);
        //$column_name    =   ($column_name=='name')? 'mj_'.$column_name : $column_name;
        $column_name_id =   self::removeSpace($field[column_name_id]);
        $required   =   (isset($field['column_required']) && $field['column_required']==1)? "required='required'" : "";
        switch($field['column_type']){
            case '1': # text field
                $data      =   "<input type='$textFieldType' $required name='field[$column_id]' id='$column_name_id' class='$column_classes'>";

                break;

            case '2': # textarea
                $data      =   "<textarea $required name='field[$column_id]' id='$column_name_id' class='$field[column_classes]' ></textarea>";
                break;

            case '3': # radio
                $data      =   "<input type='submit' name='$column_name' id='submit' class='$field[column_classes] btnsubmit' value='send'>";
                break;

            case '4': # radio
                $count  =   strlen(strstr($field[column_description],"\r\n"));
                if((int)$count>0){
                    $list   =   explode("\r\n",$field[column_description]);
                    foreach($list as $value){
                        $data      .=   "$value : <input type='radio' $required name='field[$column_id]' id='$column_name_id' class='$field[column_classes]' value='$value' >";
                    }
                }else{
                    $data      =   "<input type='radio' $required name='field[$column_id]' id='$column_name_id' class='$field[column_classes]' value='$field[column_description]' >";
                }
                break;

            case '5': # checkbox
                $count  =   strlen(strstr($field[column_description],"\r\n"));
                if((int)$count>0){
                    $list   =   explode("\r\n",$field[column_description]);
                    foreach($list as $value){
                        $data      .=   "$value : <input type='checkbox' $required name='field[$column_id]' id='$column_name_id' class='$field[column_classes]' value='$value' >";
                    }
                }else{
                        $data      =   "<input type='checkbox' $required name='field[$column_id]' id='$column_name_id' class='$field[column_classes]' value='$field[column_description]' >";
                }
                break;

            case '6': # dropdown
                $count  =   strlen(strstr($field[column_description],"\r\n"));
                if((int)$count>0){
                    $list   =   explode("\r\n",$field[column_description]);
                    $data   =   "<select name='field[$column_id]' $required>";
                    $data   .=  "<option value=''>Please select $field[column_lable] </option>";
                        foreach ($list as $values){
                            $data   .=   "<option value='$values'>$values</option>";
                        }
                    $data   .=   "</select>";

                }else{
                    $data   =   "invalid data value";
                }
                break;

            case '8':
                $data =  '<img src="'.WP_CAPTCHA_DIR_URL.'captcha_code_file.php?s='.$field[form_ref_id].'&rand='.rand().'" />';
                $data .=  '<input type="text" name="captcha" value="">';
                break;
        }
        return $data;
    }


    /*
     * function to generate dynamic label
     * 1=>'Text',2=>'Textarea',3=>'Submit',4=>'Radio',5=>'Checkbox',6=>'DropDown',
     */
    public static function Labels($field){
            switch($field['column_type']){
                case '1':
                case '2':
                case '4':
                case '5':
                case '6':
                    $label  = "<lable for='$field[column_lable]' name='$field[column_lable]'>".$field['column_lable']."</label>";
                break;
                default:
                    $label  =   "";
                    break;
            }
        return $label;
    }


    /*
* function to add form
*/
    public static function addForm(){

        if(isset($_REQUEST['addform']) && $_REQUEST['addform']=="new"){

			global $wpdb;
            $table_name = $wpdb->prefix . "mj_contact_forms";

            if(isset($_POST['formname']) && empty($_POST['formname'])){
                return "EmptyFormName";
            }elseif(isset($_POST['formid']) && empty($_POST['formid'])){
                return "EmptyFormId";
            }
            $formName	=	$_POST['formname'];
            $formId		=	$_POST['formid'];
            $Subject	=	$_POST['subject'];
            $Email		=	$_POST['email'];
            $EmailCc	=	$_POST['email_cc'];
            $EmailBcc	=	$_POST['email_bcc'];
            $Status		=	$_POST['status'];
            $Saved		=	$_POST['saved'];
            $AddedBy	=	get_current_user_id();
            $Insert		=	$wpdb->query( $wpdb->prepare(
                "INSERT INTO $table_name (form_name, form_div_id, subject, email, email_cc, email_bcc, status, saved, added_by) VALUES ( %s, %s, %s, %s, %s, %s, %d, %d, %d )",
                array(
                    $formName,
                    $formId,
                    $Subject,
                    $Email,
                    $EmailCc,
                    $EmailBcc,
                    $Status,
                    $Saved,
                    $AddedBy
                )
            ));

            return $Insert;
        }
        return false;
    }

    /*
*  function use to edit form data
*/
    public static function EditForm(){
        if(isset($_REQUEST['addform']) && $_REQUEST['addform']=="update"){
            global $wpdb;
            $table_name = $wpdb->prefix . "mj_contact_forms";

            if(isset($_POST['formname']) && empty($_POST['formname'])){
                return "EmptyFormName";
            }elseif(isset($_POST['formid']) && empty($_POST['formid'])){
                return "EmptyFormId";
            }

            $formName	=	$_POST['formname'];
            $formId		=	$_POST['formid'];
			$Subject	=	$_POST['subject'];
            $Email		=	$_POST['email'];
			$EmailCc	=	$_POST['email_cc'];
            $EmailBcc	=	$_POST['email_bcc'];
            $Status		=	$_POST['status'];
            $Saved		=	$_POST['saved'];
            $Id			=	$_POST['id'];
            $Insert		=	$wpdb->query( $wpdb->prepare(
                "update $table_name set `form_name`=%s,`form_div_id`=%s,`subject`=%s,`email`=%s,`email_cc`=%s,`email_bcc`=%s,`status`='%d',`saved`='%d' where `form_id`='%d'"
                ,array(
                    $formName,
                    $formId,
                    $Subject,
                    $Email,
                    $EmailCc,
                    $EmailBcc,
                    $Status,
                    $Saved,
                    $Id,
                )
            ));
            return $Insert;
        }
        return false;
    }

    /*
*  function use to redirect on url with message
*/

    public static function mRedirect($MSG = '', $url = ''){
        $redirect	=	add_query_arg(array('MSG' => $MSG), $url);
        wp_redirect($redirect,'301');
    }

    /*
     *  function use to update status of form
     */

    public static function updateFormStatus(){
        global $wpdb;
        $table_name = $wpdb->prefix . "mj_contact_forms";
        $id			=	$_REQUEST['id'];

        if(empty($id) && !is_numeric($id)){
            return 'InValidCode';
        }

        $Update		=	$wpdb->query("UPDATE $table_name SET `status`= CASE WHEN `status` = 1 THEN 0 WHEN `status` = 0 THEN 1 END WHERE `form_id`=$id");
        return $Update;
    }

/*
 *  function use to update status of form
 */

    public static function deleteForm(){

        if(isset($_REQUEST['atn']) && $_REQUEST['atn']=="delete"){
            global $wpdb;
            $table_name = $wpdb->prefix . "mj_contact_forms";
            $id			=	$_REQUEST['id'];

            if(empty($id) && !is_numeric($id)){
                return 'InValidCode';
            }

            $delete		=	$wpdb->query( $wpdb->prepare(
                "delete from $table_name where `form_id`='%d'"
                ,array(
                    $id,
                )
            ));
            return $delete;
        }
        return false;
    }


    public static function addField(){

        if(isset($_POST['MJfieldact'])) {
            global $wpdb;
            $table_name = $wpdb->prefix . "mj_contact_fields";

            $serial		=	(isset($_POST['serial']) 		&& !empty($_POST['serial'])) ? $_POST['serial']				:'';
            $column_name		=	(isset($_POST['column_name']) 		&& !empty($_POST['column_name'])) ? $_POST['column_name']				:'';
            $column_name_id		=	(isset($_POST['column_name_id']) 	&& !empty($_POST['column_name_id'])) ? $_POST['column_name_id']			:'';
            $column_lable		=	(isset($_POST['column_lable']) 		&& !empty($_POST['column_lable'])) ? $_POST['column_lable']			:'';
            $column_type		=	(isset($_POST['column_type']) 		&& !empty($_POST['column_type'])) ? $_POST['column_type']				:'0';
            $column_description	=	(isset($_POST['column_description']) && !empty($_POST['column_description'])) ? $_POST['column_description']:'';
            $column_classes		=	(isset($_POST['column_classes']) 	&& !empty($_POST['column_classes'])) ? $_POST['column_classes']			:'';
            $column_required	=	(isset($_POST['column_required']) 	&& !empty($_POST['column_required'])) ? $_POST['column_required']		:'0';
            $fieldvalidation	=	(isset($_POST['fieldvalidation']) 	&& !empty($_POST['fieldvalidation'])) ? $_POST['fieldvalidation']		:'0';
            $formrefid			=	(isset($_POST['formrefid']) 		&& !empty($_POST['formrefid'])) ? $_POST['formrefid']					:'0';
            $column_status		=	(isset($_POST['column_status']) 	&& !empty($_POST['column_status'])) ? $_POST['column_status']			:'0';
            $current_user		=	get_current_user_id();

            if(empty($column_name)){

                return 'EmptyColumnName';

            }elseif(empty($column_name_id)){

                return 'EmptyColumnId';

            }elseif($column_type==0){

                return 'EmptyColumnType';

            }elseif($formrefid==0){

                return 'EmptyFormType';

            }

            $Inserted  = $wpdb->insert(
                $table_name,
                array(
                    'column_name' 			=> $column_name,
                    'column_name_id' 		=> $column_name_id,
                    'column_lable' 			=> $column_lable,
                    'column_type' 			=> $column_type,
                    'column_description' 	=> $column_description,
                    'column_classes' 		=> $column_classes,
                    'column_required' 		=> $column_required,
                    'column_Validation_type'=> $fieldvalidation,
                    'form_ref_id' 			=> $formrefid,
                    'column_status' 		=> $column_status,
                    'serial' 		        => $serial,
                    'added_by' 				=> $current_user
                ),
                array(
                    '%s',
                    '%s',
                    '%s',
                    '%d',
                    '%s',
                    '%s',
                    '%d',
                    '%d',
                    '%d',
                    '%d',
                    '%d',
                    '%d'
                )
            );
            return $Inserted;
    }
    }

    public static function removeSpace($data){
        $replaceTo  =   array(' ','_','-','~','!','@','#','$','%','^','&','*','(',')','+','=','-','{','}',']','[','|','.',';',':','`');
        $replaceWith  =   array('_');
        $filterData  =   str_replace($replaceTo,$replaceWith,$data);
        return $filterData;
    }

function mj_captcha_init_sessions(){
        if(!session_id()){
            session_start();
        }
        $_SESSION['captcha_type'] = 'alphanumeric';
        $_SESSION['captcha_letters'] = 'capitalsmall';
        $_SESSION['total_no_of_characters'] = '5';
        if(empty($_SESSION['total_no_of_characters'])){
            $_SESSION['total_no_of_characters'] = 6;
        }
    }

    public static function isFieldRequired($id){
        global $wpdb;
        $table_name = $wpdb->prefix . "mj_contact_fields";
        $data 		= $wpdb->get_row("SELECT column_id FROM $table_name WHERE column_id = '$id' AND column_required=1", ARRAY_A);
        if($data){
            return true;
        }else{
            return false;
        }
    }

    public static function getFieldDetail($id){
        global $wpdb;
        $table_name = $wpdb->prefix . "mj_contact_fields";
        $data 		= $wpdb->get_row("SELECT * FROM $table_name WHERE column_id = '$id' ", ARRAY_A);
        return $data;
    }

    public static function isValidEmail($email){
        return preg_match("/^[_a-z0-9-]+(\.[_a-z0-9+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i", $email);
    }

    public static function isValidNumber($Number){
        return is_numeric($Number);
    }

    function isValidURL($url)
    {
        return preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url);
    }

    function sendDynamicMail(){
        $formData =   self::GetFormDataById($_POST['dnForm']);
        $message = "
                <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
					<html>
					<head>
					<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
					<title>\".$formData[form_name].\"</title>
					</head>
					<body>
                        <p>Hello Admin<br/></p>
                        <p>Please find the details of contact us mail send by a new user</p>
                        <p>=============================================================</p>
                        <table>";

                    foreach($_POST['field'] as $key => $fields){
                        $details    =  self::getFieldDetail($key);
						if($formData['saved']==1){
							self::storeFormData(array('forms_ref_id'=>$_POST['dnForm'],'field_ref_id'=>$key,'form_value'=>$fields));
                        }
						$message .= "
                                        <tr>
                                            <th>{$details[column_lable]}: </th>
                                            <td>{$fields}</td>
                                        </tr>
                                    ";

                    }
        $message .= "
                        </table>
                        <p>=============================================================</p>
                        <p>Thanks & Regards</p>
                    </body>
                </html>";

        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
        $headers .= 'From: '.$formData[form_name].'' . "\r\n" .
            'Reply-To: '.$formData[email].'' . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

        $sent   =   wp_mail($formData[email],$formData[form_name],$message,$headers);
        if($sent){
            return true;
        }else{
            return false;
        }
    }
	
	public static function DmFormValidation(){
	
	
	if(isset($_POST['captcha'])){
				$validate   =   self::stringCaptchaValidate($_POST['dnForm']);
			}
			exit;
	}
	
	public static function storeFormData($data = array()){
		global $wpdb;
		$table_name = 	$wpdb->prefix . "mj_contact_saved_forms";
		$id			=	get_current_user_id();
		$Inserted  	= 	$wpdb->insert(
                $table_name,
                array(
                    'form_ref_id' 			=> $data['forms_ref_id'],
                    'field_ref_id' 			=> $data['field_ref_id'],
                    'form_value' 			=> $data['form_value'],
                    'added_by' 				=> $id,
                ),
                array(
                    '%d',
                    '%d',
                    '%s',
                    '%d'
                )
            );
			return $Inserted;
	}
	
	public static function GetStoreForms(){
		echo "data";
		global $wpdb;
		$tbl1 = $wpdb->prefix . "mj_contact_forms";
		$tbl2 = $wpdb->prefix . "mj_contact_saved_forms";
		$query	=	"SELECT count(*) as total,s.form_ref_id,f.form_name FROM $tbl2 s join $tbl1 f on s.form_ref_id=f.form_id group by s.added_on";
		$data 		= $wpdb->get_results($query, ARRAY_A);
		return $data;
	}

}