<?php
class mjContactHTML extends mjContactPRO
{
	public function mjForm()
    {
        $msg = $this->getMessage();
        return $this->render('ContactUsView.php', array('model' => $this,'message' => $msg));
    }

	function AdminOption()
    {
        ?>
		<div id="wrap">
			<div id="container">
				<h3 id="reply-title"><?php _e('Contact US Page Settings') ;?></h3>
				<form action="" method="post" id="mailform">
					<div class="h-43">
						<label for="name"><?php _e('Email Address to recieve Email address') ;?></label>
						<input name="MJmailto" class="f-13" id="mailto" type="text" aria-required="true" value="<?php echo get_option('MJmailto');?>" >
						<small><i><?php _e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					<div class="h-43">
						<label for="name"><?php _e('Copy to me') ;?></label>
						<input type="checkbox" class="w-16" name="MJcopytome" <?php echo (get_option('MJcopytome')==1)? "checked='checked'" : "";?> value="1"> <?php _e('Enable this option ?'); ?>
					</div>
					<div class="h-100">
						<label for="name"><?php _e('Other options') ;?></label>
						<input type="checkbox" class="w-16" name="MJname" <?php echo (get_option('MJname')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Required Name ?') ;?><br/>
						<input type="checkbox" class="w-16" name="MJemail" <?php echo (get_option('MJemail')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Required Email ?') ;?><br/>
						<input type="checkbox" class="w-16" name="MJsubject" <?php echo (get_option('MJsubject')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Required Subject ?') ;?><br/>
						<input type="checkbox" class="w-16" name="MJwebsite" <?php echo (get_option('MJwebsite')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Required Website ?') ;?><br/>
						<input type="checkbox" class="w-16" name="MJcomment" <?php echo (get_option('MJcomment')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Required Comment ?') ;?><br/>
						<!--<input type="checkbox" class="w-16" name="MJattachment" <?php echo (get_option('MJattachment')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Enable  Attachment ?') ;?><br/>-->
                        <input type="radio" class="w-16" name="mjEnableCaptcha" <?php echo (get_option('mjEnableCaptcha')==1)? "checked='checked'" : "";?> value="1"><?php _e(' - Enable  number captcha') ;?><br/>
                        <input type="radio" class="w-16" name="mjEnableCaptcha" <?php echo (get_option('mjEnableCaptcha')==0)? "checked='checked'" : "";?> value="0"><?php _e(' - Enable  string captcha') ;?><br/>
					</div>
					<div>
						<input name="MJact" type="hidden" id="MJact" value="insert">
						<input name="Save" type="submit" id="Save" value="<?php _e('Save') ;?>">
					</div>
				</form>
			</div>
		</div>	
	<?php
	}
	public static function getFormList(){
	
	?>	
		<h2><?php _e('Manage Contact forms') ?>	</h2>
    <a class='button-secondary fl' href='<?php echo ADDFORM; ?>' title='All Attendees'><?php _e('Add Form') ?></a>
    <div class="clear"></div>
    <div class='wrap'>
			<table class="widefat">
			<thead>
				<tr>
					<th>S. No.</th>
					<th>Form Name</th>
					<th>Subject</th>		
					<th>Email (To)</th>
					<th>Email (Cc)</th>
					<th>Email (Bcc)</th>
					<th>Status</th>
					<th>ShortCode</th>
					<th>Action</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>S. No.</th>
					<th>Form Name</th>
					<th>Subject</th>		
					<th>Email (To)</th>
					<th>Email (Cc)</th>
					<th>Email (Bcc)</th>
					<th>Status</th>
					<th>ShortCode</th>
					<th>Action</th>
				</tr>
			</tfoot>
			<tbody>
<?php
		$data 	=	MjFunctions::GetFormData();
		$i=1;
		 foreach ( $data as $value){ 
		 $edit		=	add_query_arg(array('id' => $value->form_id,'atn' => 'edit'), FORMURL);
		 $delete	=	add_query_arg(array('id' => $value->form_id,'atn' => 'delete'), FORMURL);
		 $status	=	add_query_arg(array('id' => $value->form_id,'atn' => 'status'), FORMURL);
?>
			   <tr>
				 <td><?php echo $i; ?></td>
				 <td><?php echo $value->form_name; ?></td>
				 <td><?php echo $value->subject; ?></td>
				 <td><?php echo $value->email; ?></td>
				 <td><?php echo $value->email_cc; ?></td>
				 <td><?php echo $value->email_bcc; ?></td>
				 <td><?php echo ($value->status) ? 'Enable' : 'Disable'; ?></td>
				  <td>[mjform id='<?php echo $value->form_id; ?>']</td>
				 <td>
					 <a href="<?php echo $status; ?>"><?php echo ($value->status) ? 'Disable' : 'Enable'; ?></a> | 
					 <a href="<?php echo $edit; ?>" >Edit</a> | 
					 <a onclick="return (confirm('Are you sure you want to delete this data ?'));" href="<?php echo $delete; ?>" >Delete</a>
				 </td>
			   </tr>
		<?php $i++; }  ?>
			</tbody>
			</table>
		</div>
	<?php
	}
	
	public static function getFieldList(){
	MjFunctions::message();
	?>
	
		<h2><?php _e('Manage Contact forms Fields') ?></h2>
		<a class='button-secondary fl' href='<?php echo ADDFIELD; ?>' title='All Attendees'><?php _e('Add Field') ?></a>
		<div class="clear"></div>
		<div class='wrap'>
		
			<table class="widefat">
			<thead>
				<tr>
					<th>S. No.</th>
					<th>Field Name</th>
					<th>Field ID</th>		
					<th>Field Type</th>
					<th>Field Required</th>
					<th>Form Name</th>
					<th>Status</th>
					<th align='center'>Action</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>S. No.</th>
					<th>Field Name</th>
					<th>Field ID</th>		
					<th>Field Type</th>
					<th>Field Required</th>
					<th>Form Name</th>
					<th>Status</th>
					<th align='center'>Action</th>
				</tr>
			</tfoot>
			<tbody>
			   <?php 
			   
		$data 	=	MjFunctions::GetFormFielsData();
		$i=1;
		 foreach ( $data as $value){ 
		 $edit		=	add_query_arg(array('id' => $value->column_id,'atn' => 'edit'), FIELDSURL);
		 $delete	=	add_query_arg(array('id' => $value->column_id,'atn' => 'delete'), FIELDSURL);
		 $status	=	add_query_arg(array('id' => $value->column_id,'atn' => 'status'), FIELDSURL);
		 $formData	=	MjFunctions::GetFormDataById($value->form_ref_id);
		 ?>
			   <tr>
				 <td><?php echo $i; ?></td>
				 <td><?php echo $value->column_name; ?></td>
				 <td><?php echo $value->column_name_id; ?></td>
				 <td><?php echo MjFunctions::$fieldType[$value->column_type]; ?></td>
				 <td><?php echo ($value->column_required) ? 'Yes' : 'No'; ?></td>
				 <td><?php echo $formData['form_name']; ?></td>
				 <?php MjFunctions::GetFormDataById($value->form_ref_id); ?>
				 <td><?php echo ($value->column_status) ? 'Enable' : 'Disable'; ?></td>
				 <td>
					 <a href="<?php echo $status; ?>"><?php echo ($value->column_status) ? 'Disable' : 'Enable'; ?></a> | 
					 <a href="<?php echo $edit; ?>" >Edit</a> | 
					 <a onclick="return (confirm('Are you sure you want to delete this data ?'));" href="<?php echo $delete; ?>" >Delete</a>
				 </td>
			   </tr>
		<?php $i++; }  ?>
			</tbody>
			</table>
		</div>
	<?php
	}

	
	
	public static function AddFormHtml(){
	$id		=	(isset($_REQUEST['id'])) ? $_REQUEST['id'] : '0';
	?>
		<div class="wrap" id="mjContact">
		<h2><?php _e('Add Contact Form'); ?></h2>
			<form method="POST" action="<?php echo ADDFORM; ?>">
				<table>
					<tr>
						<td style="width:143px"><label for="status">Save Form Data: </label></td>
						<td>
							Yes <input type="radio" id="saved" name="saved"  checked="checked"  value="1" />
							No  <input type="radio" id="saved" name="saved" value="0" />
						</td>
					</tr>
					<tr>
						<td><label for="status">Send Mail: </label></td>
						<td>
							Yes <input type="radio" id="sendMail" class="sendMail" name="sendMail" checked="checked" value="1" />
							No  <input type="radio" id="sendMail" class="sendMail" name="sendMail" value="0" />
						</td>
					</tr>
				
					
					<tr>
						<td><label for="formname">Form Name: </label></td>
						<td><input id="formname" maxlength="45" required aria-required="true" title="Please enter Form Name" size="30" name="formname" value="<?php echo MjFunctions::setval('formname'); ?>" /></td>
					</tr>	
						
					<tr>
						<td><label for="formid">Form ID: </label></td>
						<td><input id="formid" maxlength="45" size="30" required aria-required="true" title="Please enter Form ID" name="formid" value="<?php echo MjFunctions::setval('formid'); ?>" /></td>
					</tr>
                    
					<tr class="emailtd">
						<td><label for="subject">Subject: </label></td>
						<td><input id="subject" maxlength="45" size="30" name="subject" value="<?php echo MjFunctions::setval('subject'); ?>" /></td>
					</tr>
                    
					<tr class="emailtd">
						<td><label for="emailto">Email Address (To): </label></td>
						<td><input id="email" maxlength="45" size="30" name="email" value="<?php echo MjFunctions::setval('email'); ?>" /></td>
					</tr>
					<tr class="emailtd">
						<td><label for="emailcc">Email Address (Cc): </label></td>
						<td><input id="email_cc" maxlength="45" size="30" name="email_cc" value="<?php echo MjFunctions::setval('email_cc'); ?>" /></td>
					</tr>
					<tr class="emailtd">
						<td><label for="emailbcc">Email Address (Bcc): </label></td>
						<td><input id="email_bcc" maxlength="45" size="30" name="email_bcc" value="<?php echo MjFunctions::setval('email_bcc'); ?>" /></td>
					</tr>
					<tr>	
						<td><label for="status">Status: </label></td>
						<td>
							Yes <input type="radio"  id="status" name="status" checked="checked" value="1" />
							No <input type="radio"  id="status" name="status" value="0" />
						</td>
					</tr>
					
					<tr>
						<td><input type='submit' name="submit" value='<?php _e('Submit'); ?>' class='button-secondary' /></td>
					</tr>
				</table>
				<input type="hidden" name="addform" id="addform" value="new"/>
			</form>
		</div>
	
<?php
	}

    public static function EditFormHtml(){
	$id		=	(isset($_REQUEST['id'])) ? $_REQUEST['id'] : '0';
	$data	=	MjFunctions::GetFormDataById($id);
	if($data['sendmail']==0){
		echo "<style>.emailtd{display:none;}</style>";
	} 
	 
	 ?>

		<div class="wrap" id="mjContact">
		<h2><?php _e('Edit Contact Form - '.$data['form_name']); ?> </h2>
			<form method="POST" action="<?php echo add_query_arg(array('id'=>$_REQUEST['id']), EDITFORM); ?>">
				<table>
				
					<tr>
						<td style="width:143px"><label for="status">Save Form Data: </label></td>
						<td>
							Yes <input type="radio" id="saved" name="saved" <?php echo (isset($data['saved']) && $data['saved']=='1')? "checked='checked'" : "";?> value="1" />
							No  <input type="radio" id="saved" name="saved" <?php echo (isset($data['saved']) && ($data['saved']=='0' || $data['saved']=='')) ? "checked='checked'" : "";?> value="0" />
						</td>
					</tr>
					
					<tr>
						<td><label for="status">Send Mail: </label></td>
						<td>
							Yes <input type="radio" id="sendMail" class="sendMail" name="sendMail" <?php echo (isset($data['sendmail']) && $data['sendmail']=='1')? "checked='checked'" : "";?> value="1" />
							No  <input type="radio" id="sendMail" class="sendMail" name="sendMail" <?php echo (isset($data['sendmail']) && ($data['sendmail']=='0' || $data['sendmail']=='')) ? "checked='checked'" : "";?> value="0" />
						</td>
					</tr>
					
					<tr>
						<td><label for="formname">Form Name: </label></td>
						<td><input id="formname" maxlength="45" size="30" name="formname" required aria-required="true" value="<?php echo (isset($data['form_name'])) ? $data['form_name'] : ''; ?>" /></td>
					</tr>

					<tr>
						<td><label for="formid">Form ID: </label></td>
						<td><input id="formid" maxlength="45" size="30" name="formid" required aria-required="true" value="<?php echo (isset($data['form_div_id'])) ? $data['form_div_id'] : ''; ?>" /></td>
					</tr>
                    <tr class="emailtd">
						<td><label for="subject">Subject: </label></td>
						<td><input id="subject" maxlength="45" size="30" name="subject" value="<?php echo (isset($data['subject'])) ? $data['subject'] : ''; ?>" /></td>
					</tr>
                    
					<tr class="emailtd">
						<td><label for="emailto">Email Address (To): </label></td>
						<td><input id="email" maxlength="45" size="30" name="email" value="<?php echo (isset($data['email'])) ? $data['email'] : ''; ?>" /></td>
					</tr>
					
					<tr class="emailtd">
						<td><label for="emailcc">Email Address (Cc): </label></td>
						<td><input id="email_cc" maxlength="45" size="30" name="email_cc" value="<?php echo (isset($data['email_cc'])) ? $data['email_cc'] : ''; ?>" /></td>
					</tr>
					
					<tr class="emailtd">
						<td><label for="emailbcc">Email Address (Bcc): </label></td>
						<td><input id="email_bcc" maxlength="45" size="30" name="email_bcc" value="<?php echo (isset($data['email_bcc'])) ? $data['email_bcc'] : ''; ?>" /></td>
					</tr>

					<tr>
						<td><label for="status">Status: </label></td>
						<td>
							Yes <input type="radio" <?php echo (isset($data['status']) && $data['status']=='1')? "checked='checked'" : "";?> id="status" name="status" checked="checked" value="1" />
							No <input type="radio" <?php echo (isset($data['status']) && $data['status']=='0')? "checked='checked'" : ""; ?> id="status" name="status" value="0" />
						</td>
					</tr>
					
					
					<tr>
						<td><input type='submit' name="submit" value='<?php _e('Submit'); ?>' class='button-secondary' /></td>
					</tr>
				</table>
				<input type="hidden" name="addform" id="addform" value="<?php echo (isset($data['form_id'])) ? 'update': 'new'; ?>">
				<input type="hidden" name="id" id="id" value="<?php echo (isset($data['form_id'])) ? $data['form_id']: ''; ?>">
			</form>
		</div>

	<?php
	}
	
	public static function addFieldHtml(){
	MjFunctions::message();
	?>
		<div id="wrap">
			<div id="container">
				<h3 id="reply-title"><?php _e('Contact US Page Settings') ;?></h3>
				<form action="<?php echo ADDFIELD; ?>" method="post" id="mailform">
					
					<div class="h-43">
						<label for="name"><?php _e('Field type ') ;?></label>
						<?php MjFunctions::getFieldType();	 ?>
					</div>

                    <div class="h-43">
                        <label for="serial"><?php _e('Serial No.') ;?></label>
                        <input name="serial" class="f-13" id="serial" type="text" aria-required="true" value="" >
                    </div>

					<div class="h-43">
						<label for="name"><?php _e('Field Name') ;?></label>
						<input name="column_name" class="f-13" id="column_name" required type="text" aria-required="true" value="" >
						<small><i><?php _e('Do not use space in words. Use underscore in place of space like `first_name`');?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field ID') ;?></label>
						<input name="column_name_id" class="f-13" id="column_name_id" type="text" aria-required="true" value="" >
						<small><i><?php _e('Do not use space in words. Use underscore in place of space like `first_name`');?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field Label') ;?></label>
						<input name="column_lable" class="f-13" id="column_lable" type="text" aria-required="true" value="" >
					</div>
					
					
					<div class="h-43">
						<label for="name"><?php _e('Field Description') ;?></label>
						<textarea name="column_description" class="f-13" id="column_description"></textarea>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field Classes') ;?></label>
						<input name="column_classes" class="f-13" id="column_classes" type="text" aria-required="true" value="" >
						<small><i><?php _e('Insert multiple classes with command saprated like class1,class2,class3');?></i></small>
					</div>
					
					
					<div class="h-43">
						<label for="name"><?php _e('Form field required ') ;?></label>
						<input name="column_required" class="f-13" id="column_required" type="checkbox" aria-required="true" value="1" >
					</div>
					<div class="h-43">
						<label for="name"><?php _e('Form field validation Type') ;?></label>
						<?php MjFunctions::getFieldValidationType(); ?>
					</div>
					
					
					
					<div class="h-43">
						<label for="name"><?php _e('Form Name') ;?></label>
						<?php MjFunctions::GetFormDataDropdown($selected,'f-13'); ?>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Status') ;?></label>
						<input type="radio" checked="checked" name="column_status" id="column_status" value="1"/> : Yes |
						<input type="radio" name="column_status" id="column_status" value="0"/> : No
					</div>
					<div>
						<input name="MJfieldact" type="hidden" id="MJact" value="insertfield">
						<input name="Save" type="submit" id="Save" value="<?php _e('Save') ;?>">
					</div>
				</form>
			</div>
		</div>
	<?php
	}
	
	public static function editFieldHtml(){
	
		$id			=	$_REQUEST['id'];
		$fieldData	=	MjFunctions::GetFormFieldDataById($id);
        MjFunctions::message();
	?>
		<div id="wrap">
			<div id="container">
				<h3 id="reply-title"><?php _e('Edit Field') ;?></h3>
				<form action="<?php echo EDITFIELD; ?>" method="post" id="mailform">
					
					<div class="h-43">
						<label for="name"><?php _e('Field type ') ;?></label>
						<?php MjFunctions::getFieldType($fieldData['column_type'],'');	 ?>
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					
					<div class="h-43">
						<label for="serial"><?php _e('Serial No.') ;?></label>
						<input name="serial" class="f-13" id="serial" required type="text" aria-required="true" value="<?php echo $fieldData['serial']; ?>" >
					</div>
                    <div class="h-43">
						<label for="name"><?php _e('Field Name') ;?></label>
						<input name="column_name" class="f-13" id="column_name" required type="text" aria-required="true" value="<?php echo $fieldData['column_name']; ?>" >
						<small><i><?php _e('Do not use space in words. Use underscore in place of space like `first_name`');?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field ID') ;?></label>
						<input name="column_name_id" class="f-13" id="column_name_id" type="text" aria-required="true" value="<?php echo $fieldData['column_name_id']; ?>">
						<small><i><?php _e('Do not use space in words. Use underscore in place of space like `first_name`');?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field Label') ;?></label>
						<input name="column_lable" class="f-13" id="column_lable" type="text" aria-required="true" value="<?php echo $fieldData['column_lable']; ?>">
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					
					
					<div class="h-43">
						<label for="name"><?php _e('Field Description') ;?></label>
						<textarea name="column_description" class="f-13" id="column_description"><?php echo $fieldData['column_description']; ?></textarea>
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Field Classes') ;?></label>
						<input name="column_classes" class="f-13" id="column_classes" type="text" aria-required="true" value="<?php echo $fieldData['column_classes']; ?>">
						<small><i><?php _e('Insert multiple classes with command saprated like class1,class2,class3');?></i></small>
					</div>
					<div class="h-43">
						<label for="name"><?php _e('Form field required ') ;?></label>
						<input name="column_required" class="f-13" id="column_required" type="checkbox" aria-required="true" value="1" <?php echo ($fieldData['column_required']) ? "checked='checked'": ''; ?>>
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					<div class="h-43">
						<label for="name"><?php _e('Form field validation Type') ;?></label>
						<?php MjFunctions::getFieldValidationType($fieldData['column_validation_type'],''); ?>					
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					
					
					
					<div class="h-43">
						<label for="name"><?php _e('Form Name') ;?></label>
						<?php MjFunctions::GetFormDataDropdown($fieldData['form_ref_id'],'f-13'); ?>
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					
					<div class="h-43">
						<label for="name"><?php _e('Status') ;?></label>
						<input type="radio" <?php echo ($fieldData['column_status']==1 || !isset($fieldData['column_status'])) ? "checked='checked'": ''; ?> name="column_status" id="column_status" value="1"/> : Yes |
						<input type="radio" name="column_status" id="column_status" <?php echo ($fieldData['column_status']==0) ? "checked='checked'": ''; ?> value="0"/> : No
						<small><i><?php //_e('if blank then default mail will goes on '.get_option('admin_email'));?></i></small>
					</div>
					<div>
						<input name="MJfieldact" type="hidden" id="MJact" value="insertfield">
						<input name="id" type="hidden" id="id" value="<?php echo $id; ?>">
						<input name="Save" type="submit" id="Save" value="<?php _e('Save') ;?>">
					</div>
				</form>
			</div>
		</div>
	<?php
	}
		
	public static function getStoreFormList(){ 
	$formData	=	MjFunctions::GetStoreForms();
	
	?>
	<h2><?php _e('Stored Form Data') ?>	</h2>
    <div class="clear"></div>
    <div class='wrap'>
			<table class="widefat">
			<thead>
				<tr>
					<th>Form ID</th>
					<th>Form Name</th>
					<th>Total Fields</th>		
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Form ID</th>
					<th>Form Name</th>
					<th>Total Fields</th>
				</tr>
			</tfoot>
			<tbody>
<?php
		 foreach ( $formData as $value){
		 ?>
			   <tr>
				 <td><?php echo $value['form_ref_id']; ?></td>
				 <td><a href="<?php echo STOREDDATAVIEW.'='.$value['added_on']; ?>"><?php echo $value['form_name']; ?></a></td>
				 <td><?php echo $value['total']; ?></td>
			   </tr>
		<?php $i++; }  ?>
			</tbody>
			</table>
		</div>
	<?php }
	
	public static function StoreDataDetail(){
	$formData	=	MjFunctions::StoreDataDetailByDate($_REQUEST['id']);
	?>
	<h2><?php _e('Stored Data') ?>	</h2>
    <div class="clear"></div>
    <div class='wrap'>
			<table class="widefat">
			<thead>
				<tr>
					<th>Serial No.</th>
					<th>Field Name</th>
					<th></th>
					<th>Field Value</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Serial No.</th>
					<th>Field Name</th>
					<th></th>
					<th>Field Value</th>
				</tr>
			</tfoot>
			<tbody>
<?php $i=1;
		 foreach ( $formData as $value){
		 $fieldvalue	=	MjFunctions::getFieldDetail($value['field_ref_id']);
		 ?>
			   <tr>
				 <td><?php echo $i; ?></td>
				 <td><?php echo $fieldvalue['column_name']; ?></td>
				 <td> : </td>
				 <td><?php echo $value['form_value']; ?></td>
			   </tr>
		<?php $i++; }  ?>
			</tbody>
			</table>
		</div>
	<?php }
}

?>