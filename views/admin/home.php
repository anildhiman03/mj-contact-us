<div id="wrap">
    <?php echo $message; ?>
    <div id="sizer">
        <div class="has-js">
            <form accept-charset="utf-8" action="" method="post" id="mj_mail_form">
                <fieldset class="checkboxes">
                    <label for="checkbox-01" class="">
                        <input name="mj-mail-to" class="f-13" id="mj-mail-to" size="33" type="text" aria-required="true" value="<?php echo get_option('mj_mail_to');?>" >
                        <br/><i><small><?php _e('Email Address to receive mails', 'mj-contact-us') ;?></small></i>
                    </label>
                    <label for="checkbox-01" class="">
                        <input type="checkbox" <?php echo (get_option('mj_copy_me')==1)? "checked='checked'" : "";?> value="1" id="mj-copy-me" name="mj-copy-me" >
                        <?php _e('Enable `Copy to me` option', 'mj-contact-us') ;?>
                    </label>
                </fieldset>
                <fieldset class="radios">
                    <table>
                        <tr>
                            <td><?php _e('Name :', 'mj-contact-us') ;?></td>
                            <td>
                                <input type="checkbox" class="w-16" name="enable-name" <?php echo (get_option('mj_name_enable')==1)? "checked='checked'" : "";?> value="1">
                                <?php _e('Enable', 'mj-contact-us'); ?>
                            </td>
                            <td>
                                <input type="checkbox" class="w-16" name="require-name" <?php echo (get_option('mj_name_require')==1)? "checked='checked'" : "";?> value="1">
                                <?php _e('Require', 'mj-contact-us') ;?>
                            </td>
                        </tr>
                    <tr>
                        <td><?php _e('Email :', 'mj-contact-us') ;?></td>
                        <td>
                            <input type="checkbox" class="w-16" name="enable-email" <?php echo (get_option('mj_email_enable')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Enable ', 'mj-contact-us') ;?>
                        </td>
                        <td>
                            <input type="checkbox" class="w-16" name="require-email" <?php echo (get_option('mj_email_require')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Require', 'mj-contact-us') ;?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php _e('Website :', 'mj-contact-us') ;?></td>
                        <td>
                            <input type="checkbox" class="w-16" name="enable-website" <?php echo (get_option('mj_website_enable')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Enable', 'mj-contact-us') ;?>
                        </td>
                        <td>
                            <input type="checkbox" class="w-16" name="require-website" <?php echo (get_option('mj_require_enable')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Require', 'mj-contact-us') ;?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php _e('Comment :', 'mj-contact-us') ;?></td>
                        <td>
                            <input type="checkbox" class="w-16" name="enable-comment" <?php echo (get_option('mj_enable_comment')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Enable', 'mj-contact-us') ;?>
                        </td>
                        <td>
                            <input type="checkbox" class="w-16" name="require-comment" <?php echo (get_option('mj_require_comment')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Require', 'mj-contact-us') ;?>
                        </td>
                    </tr>
                    <tr>
                        <td><?php _e('Attachment', 'mj-contact-us') ;?></td>
                        <td>
                            <input type="checkbox" class="w-16" name="enable-attachment" <?php echo (get_option('mj_attachment_enable')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Enable', 'mj-contact-us') ;?>
                        </td>
                        <td>
                            <input type="checkbox" class="w-16" name="require-attachment" <?php echo (get_option('mj_attachment_enable')==1)? "checked='checked'" : "";?> value="1">
                            <?php _e('Require', 'mj-contact-us') ;?>
                        </td>
                    </tr>
                </table>
                </fieldset>
                <fieldset class="radios">
                    <label for="radio-01" class="">
                        <input type="radio" class="w-16" name="captcha-number" <?php echo (get_option('mj_enable_number_captcha')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Enable  number captcha', 'mj-contact-us') ;?><br/>
                    </label>
                    <label for="radio-02" class="">
                        <input type="radio" class="w-16" name="captcha-string" <?php echo (get_option('mj_string_number_captcha')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Enable  string captcha', 'mj-contact-us') ;?><br/>
                    </label>
                </fieldset>
                <input name="action" type="hidden" id="action" value="insert">
                <?php submit_button(); ?>
            </form>
        </div>
    </div>
</div>