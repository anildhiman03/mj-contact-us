<div id="wrap">
    <?php echo $message; ?>
    <div id="sizer">
        <div class="has-js">
            <form accept-charset="utf-8" action="" method="post" id="mailform">
                <fieldset class="checkboxes">
                    <label for="checkbox-01" class="">
                        <input name="to" class="f-13" id="to" size="33" type="text" aria-required="true" value="<?php echo get_option('MJmailto');?>" >
                        <br/><i><small><?php _e('Email Address to receive mails', 'mj-contact-us') ;?></small></i>
                    </label>
                </fieldset>
                <fieldset class="radios">
                    <label for="checkbox-01" class="">
                        <input type="checkbox" <?php echo (get_option('MJcopytome')==1)? "checked='checked'" : "";?> value="1" id="checkbox-01" name="copy" >
                        <?php _e('Enable `Copy to me` option?', 'mj-contact-us') ;?>
                    </label>
                    <label for="checkbox-02" class="">
                        <input type="checkbox" class="w-16" name="name" <?php echo (get_option('MJname')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Required Name ?', 'mj-contact-us') ;?>
                    </label>
                    <label for="checkbox-03" class="">
                        <input type="checkbox" class="w-16" name="email" <?php echo (get_option('MJemail')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Required Email ?', 'mj-contact-us') ;?>
                    </label>
                    <label for="checkbox-04" class="">
                        <input type="checkbox" class="w-16" name="website" <?php echo (get_option('MJwebsite')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Required Website ?', 'mj-contact-us') ;?>
                    </label>
                    <label for="checkbox-05" class="">
                        <input type="checkbox" class="w-16" name="comment" <?php echo (get_option('MJcomment')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Required Comment ?', 'mj-contact-us') ;?>
                    </label>
                    <label for="checkbox-06" class="">
                        <input type="checkbox" class="w-16" name="attachment" <?php echo (get_option('MJattachment')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Enable  Attachment ?', 'mj-contact-us') ;?>
                    </label>
                </fieldset>
                <fieldset class="radios">
                    <label for="radio-01" class="">
                        <input type="radio" class="w-16" name="captcha" <?php echo (get_option('mjEnableCaptcha')==1)? "checked='checked'" : "";?> value="1">
                        <?php _e(' - Enable  number captcha', 'mj-contact-us') ;?><br/>
                    </label>
                    <label for="radio-02" class="">
                        <input type="radio" class="w-16" name="captcha" <?php echo (get_option('mjEnableCaptcha')==0)? "checked='checked'" : "";?> value="0">
                        <?php _e(' - Enable  string captcha', 'mj-contact-us') ;?><br/>
                    </label>
                </fieldset>
                <input name="action" type="hidden" id="action" value="insert">
                <?php submit_button(); ?>
            </form>
        </div>
    </div>
</div>