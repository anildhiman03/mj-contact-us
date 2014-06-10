<?php
class mjContactPRO
{
    use Mbase;

	public function SendMail()
    {
        if (isset($_FILES['file']['name']) && $_FILES['file']['name']!="") {
            $this->SimpleMailWithAttachment();
        } else if (isset($_POST['mj_submit']) && $_POST['mj_submit'] == "active") {
            $this->SimpleMail();
        }
	}

	private function SimpleMail()
    {
        $mjEnableCaptcha = get_option('mjEnableCaptcha');
        $sentToMe = true;
        if (isset($mjEnableCaptcha) && $mjEnableCaptcha == '1') {
            $validate = $this->numberCaptchaValidate();
        } else {
            $validate = $this->stringCaptchaValidate('single');
        }

		if ($validate) {

            $name = strip_tags($_REQUEST['uname']);
            $email = $_REQUEST['email'];
            $subject = strip_tags($_REQUEST['subject']);
            $url = strip_tags($_REQUEST['url']);
            $comment = strip_tags($_REQUEST['comment']);
            $to = (get_option('MJmailto')) ? get_option('MJmailto') : get_option('admin_email');
            $subject = (empty($subject))? __('Contact Us Mail', 'mj-contact-us') : $subject;
            $message = $this->render(
                'ContactUsMailTemplate.php',
                array(
                    'name' => $name,
                    'email' => $email,
                    'subject' => $subject,
                    'url' => $url,
                    'comment' => $comment,

                )
            );
            $headers = $this->mailHeader($to);
            $sent = wp_mail($to, $subject, $message, $headers);

            if (isset($_REQUEST['copytome']) && $_REQUEST['copytome'] == '1') {
                $sentToMe = $this->copyToMe();
            } else {
                $sentToMe = true;
            }

            if ($sent && $sentToMe) {
                $this->setMessage(__('Mail Sent Successfully', 'mj-contact-us'), 'success');
                unset($_POST);
            } else {
                $this->setMessage(__('Error While Sending Mail. Please Try Again Later', 'mj-contact-us'), 'error');
            }
        } else {
            $this->setMessage(__('Invalid Captcha', 'mj-contact-us'), 'error');
        }
	}

    private function copyToMe()
    {
        $name = strip_tags($_REQUEST['uname']);
        $email = $_REQUEST['email'];
        $subject = strip_tags($_REQUEST['subject']);
        $url = strip_tags($_REQUEST['url']);
        $comment = strip_tags($_REQUEST['comment']);
        $to = $email;
        $subject = (empty($subject)) ? __('Contact Us Mail', 'mj-contact-us') : $subject;
        $message = self::render(
            'ContactUsMailTemplate.php',
            array(
                'name' => $name,
                'email' => $email,
                'subject' => $subject,
                'url' => $url,
                'comment' => $comment,
            )
        );
        $headers = $this->mailHeader($to);
        $sent = wp_mail($to, $subject, $message, $headers);
        if ($sent) {
            return 1;
        } else {
            return 0;
        }
    }

	public function SimpleMailWithAttachment()
    {
        $mjEnableCaptcha = get_option('mjEnableCaptcha');
        if (isset($mjEnableCaptcha) && $mjEnableCaptcha == '1') {
            $validate = $this->numberCaptchaValidate();
        } else {
            $validate = $this->stringCaptchaValidate('single');
        }

        if ($validate) {

            $name		=	strip_tags($_REQUEST['uname']);
            $email		=	$_REQUEST['email'];
            $subject	=	strip_tags($_REQUEST['subject']);
            $url		=	strip_tags($_REQUEST['url']);
            $comment	=	strip_tags($_REQUEST['comment']);
            $to			=	(get_option('MJmailto')) ? get_option('MJmailto') : get_option('admin_email');
            $subject 	=	(empty($subject))? __('Contact Us Mail', 'mj-contact-us') : $subject;

            if (isset($_REQUEST['copytome']) && $_REQUEST['copytome'] == '1') {
                $sentToMe = $this->copyToMe();
            } else {
                $sentToMe = true;
            }

            if (isset($_FILES['file']['name']) && $_FILES['file']['name']!="") {
                $file = $this->moveUploadedFile($_FILES['file']['tmp_name'],$_FILES['file']['name']);
            } else {
                $file = false;
            }

            $message = self::render(
                'ContactUsMailTemplate.php',
                array(
                    'name' => $name,
                    'email' => $email,
                    'subject' => $subject,
                    'url' => $url,
                    'comment' => $comment,
                    'attachment' => $_FILES['file']['name'],
                )
            );

            $headers = $this->mailHeader($to);
            if ($file) {
                $sent = wp_mail($to, $subject, $message, $headers, $file);
            } else {
                $sent = wp_mail($to, $subject, $message, $headers);
            }

            if ($sent && $sentToMe) {
                $this->setMessage(__('Mail Sent Successfully', 'mj-contact-us'), 'success');
                unset($_POST);
            } else {
                $this->setMessage(__('Error While Sending Mail. Please Try Again Later', 'mj-contact-us'), 'error');
            }
        } else {
            $this->setMessage(__('Invalid Captcha', 'mj-contact-us'), 'error');
        }
	}

	function AdminOptionProcess()
    {

		if (isset($_POST['action']) && $_POST['action'] == "insert") {
			$this->dump(true);
            $mjMailTo	=	(!empty($_POST['mj-mail-to'])) ? $_POST['mj-mail-to'] : get_option('admin_email');
			$mjCopyMe = isset($_POST['mj-copy-me'])? 1 : 0;
            $enableName = isset($_POST['enable-name'])? 1 : 0;
            $requireName = isset($_POST['require-name'])? 1 : 0;
            $enableEmail = isset($_POST['enable-email'])? 1 : 0;
            $requireEmail = isset($_POST['require-email'])? 1 : 0;
            $enableWebsite = isset($_POST['enable-website'])? 1 : 0;
            $requireWebsite = isset($_POST['require-website'])? 1 : 0;
            $enableComment = isset($_POST['enable-comment'])? 1 : 0;
            $requireComment = isset($_POST['require-comment'])? 1 : 0;
            $enableAttachment = isset($_POST['enable-attachment'])? 1 : 0;
            $requireAttachment = isset($_POST['require-attachment'])? 1 : 0;
            $captchaNumber = isset($_POST['captcha-number'])? 1 : 0;
            $captchaString = isset($_POST['captcha-string'])? 1 : 0;

			if(is_email($mjMailTo)){
                update_option('mj_copy_me', $mjCopyMe);
                update_option('mj_enable_name', $enableName);
                update_option('mj_require_name', $requireName);
                update_option('mj_enable_email', $enableEmail);
                update_option('mj_require_email', $requireEmail);
                update_option('mj_enable_website', $enableWebsite);
                update_option('mj_require_website', $requireWebsite);
                update_option('mj_enable_comment', $enableComment);
                update_option('mj_require_comment', $requireComment);
                update_option('mj_enable_attachment', $enableAttachment);
                update_option('mj_require_attachment', $requireAttachment);
                update_option('mj_captcha_number', $captchaNumber);
                update_option('mj_string_number', $captchaString);
                $this->setMessage('<p>'.__('Success : Data save successfully', 'mj-contact-us').'</p>', 'success');
			} else {
                $this->setMessage('<p>'.__('Error : Please enter valid email address', 'mj-contact-us').'</p>', 'error');
			}
		}
	}
	
	function AdminSwitch()
    {
		switch(ACTION){
			case 1:
				_e('action');
			break;
			default : 
				self::AdminOptionProcess();
				return mjContactHTML::AdminOption();
			break;
		}
	}

    public static function AddFormProcess()
    {
        $Response    =   MjFunctions::addForm();
        if($Response){
            switch($Response){
                case "EmptyFormName":
                    $errorCode  =   'E-FRM-NAME';
                    break;
                case "EmptyFormId":
                    $errorCode  =   'E-FRM-ID';
                    break;
                case '1':
                    $errorCode  =   'S-INSERTED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
            }
            MjFunctions::message($errorCode);
        }
    }
    
    public static function EditFormProcess()
    {
        $Response	=	'';
        $Response    =   MjFunctions::EditForm();
        if($Response){
            switch($Response){
                case "EmptyFormName":
                    $errorCode  =   'E-FRM-NAME';
                    break;
                case "EmptyFormId":
                    $errorCode  =   'E-FRM-ID';
                    break;
                case '1':
                    $errorCode  =   'S-INSERTED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            #$url    =   add_query_arg(array('id'=>$_REQUEST['id']), EDITFORM);
            MjFunctions::message($errorCode);	#MjFunctions::mRedirect($errorCode,$url);
        }
    }

    public static function updateFormStatusProcess(){
        $Response    =   MjFunctions::updateFormStatus();
        if($Response){
            switch($Response){
                case "InValidCode":
                    $errorCode  =   'E-FRM-INVALID';
                    break;
                case '1':
                    $errorCode  =   'STATUS';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            MjFunctions::mRedirect($errorCode,FORMURL);
        }
    }
    public static function deleteFormProcess(){

        $Response    =   MjFunctions::deleteForm();
        if($Response){
            switch($Response){
                case "InValidCode":
                    $errorCode  =   'E-FRM-INVALID';
                    break;
                case '1':
                    $errorCode  =   'DELETED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            MjFunctions::mRedirect($errorCode,FORMURL);
        }
    }

    /*
     *  add field process function
     */

    public static function addFieldProcess(){
        $Response    =   MjFunctions::addField();
        if($Response){
            switch($Response){
                case "EmptyColumnName":
                    $errorCode  =   'E-FIELD-NAME';
                    break;
                case "EmptyColumnId":
                    $errorCode  =   'E-FIELD-ID';
                    break;
                case "EmptyColumnType":
                    $errorCode  =   'E-FIELD-TYPE';
                    break;
                case "EmptyFormType":
                    $errorCode  =   'E-FIELD-FORM';
                    break;
                case '1':
                    $errorCode  =   'S-INSERTED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            MjFunctions::mRedirect($errorCode,ADDFIELD);
        }
    }    /*
     *  add field process function
     */

    public static function editFieldProcess(){
        $Response    =   MjFunctions::editField();
        if($Response){
            switch($Response){
                case "EmptyColumnName":
                    $errorCode  =   'E-FIELD-NAME';
                    break;
                case "EmptyColumnId":
                    $errorCode  =   'E-FIELD-ID';
                    break;
                case "EmptyColumnType":
                    $errorCode  =   'E-FIELD-TYPE';
                    break;
                case "EmptyFormType":
                    $errorCode  =   'E-FIELD-FORM';
                    break;
                case '1':
                    $errorCode  =   'S-INSERTED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            $url    =   add_query_arg(array('id'=>$_REQUEST['id']), EDITFIELD);
            MjFunctions::mRedirect($errorCode,$url);
        }
    }
    /*
     *  update field status process function
     */
    public static function updateFieldStatusProcess(){
        $Response    =   MjFunctions::updateFieldStatus();
        if($Response){
            switch($Response){
                case "InValidCode":
                    $errorCode  =   'E-FRM-INVALID';
                    break;
                case '1':
                    $errorCode  =   'STATUS';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            MjFunctions::mRedirect($errorCode,FIELDSURL);
        }
    }

    /*
     * delete field process function
     */

    public static function deleteFieldProcess(){

        $Response    =   MjFunctions::deleteField();
        if($Response){
            switch($Response){
                case "InValidCode":
                    $errorCode  =   'E-FRM-INVALID';
                    break;
                case '1':
                    $errorCode  =   'DELETED';
                    break;
                default:
                    $errorCode  =   'E-FRM-INVALID';
                    break;
            }
            MjFunctions::mRedirect($errorCode,FIELDSURL);
        }
    }

	function ManageFields(){
		switch(ACTION){
			case 'add':
				self::addFieldProcess();
				mjContactHTML::addFieldHtml();
			break;
			case 'status':
				self::updateFieldStatusProcess();
			break;
			case 'delete':
				self::deleteFieldProcess();
			break;
			case 'edit':
				self::editFieldProcess();
				mjContactHTML::editFieldHtml();
			break;
			default :
				mjContactHTML::getFieldList();
			break;
		}
	}
	
	function ManageStoreForms(){
		switch(ACTION){
			case 'view':
				mjContactHTML::StoreDataDetail();
			break;
			default :
				mjContactHTML::getStoreFormList();
			break;
		}
	}
	

    function ManageForms()
    {
		switch(ACTION){
			case 'add':
                mjContactHTML::AddFormProcess();
                mjContactHTML::AddFormHtml();
			break;
            case 'edit':
                self::EditFormProcess();
                mjContactHTML::EditFormHtml();
                break;
            case 'status':
                mjContactHTML::updateFormStatusProcess();
                break;
            case 'delete':
                mjContactHTML::deleteFormProcess();
                break;
			default :
				mjContactHTML::getFormList();
			break;
		}
	}

    public function stringCaptchaValidate($code	=	""){

        if ($_REQUEST['captcha'] ==  $_SESSION['captcha_'.$code]) {
            return true;
        } else {
            return false;
        }
    }

    public function numberCaptchaValidate(){
        if($_REQUEST['captcha'] ==   MjFunctions::BaseDecode($_POST['CODEINCODE'])){
            return true;
        }else{
            return false;
        }
    }

    public static function dynamicFormProcess(){
        if(isset($_POST['dnForm'])){
			//$validate	=	MjFunctions::DmFormValidation();
            $mail   	=   MjFunctions::sendDynamicMail();
            if($mail){
                echo "send";
            }else{
                echo "exit";
            }
        }
    }
	

}
?>
