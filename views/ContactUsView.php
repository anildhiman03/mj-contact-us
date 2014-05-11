<?php
    global $post;
    $nameLbl			=	(get_option('MJname')==1)? '*' : '';
    $nameFld			=	(get_option('MJname')==1)? __('required', 'mj-contact-us') : '';
    $emailLbl			=	(get_option('MJemail')==1)? "*" : "";
    $emailFld			=	(get_option('MJemail')==1)? __('required', 'mj-contact-us') : '';
    $subjectLbl			=	(get_option('MJsubject')==1)? "*" : "";
    $subjectFld			=	(get_option('MJsubject')==1)? __('required', 'mj-contact-us') : "";
    $websiteLbl			=	(get_option('MJwebsite')==1)? "*" : "";
    $websiteFld			=	(get_option('MJwebsite')==1)? __('required', 'mj-contact-us') : "";
    $commentLbl			=	(get_option('MJcomment')==1)? "*" : "";
    $commentFld			=	(get_option('MJcomment')==1)? __('required', 'mj-contact-us') : "";
?>

<div id = 'MJContactUs'>
    <?php
        echo $message;
    ?>
    <script type='text/javascript'>
        jQuery(document).ready(function() { jQuery('#mailform').validate(); });
    </script>

    <div id='container' class='mjcontactus'>
        <form action="<?php echo get_permalink($post->ID);?>" method='post' id='mailform' enctype='multipart/form-data'>
            <div class='h-71'>
                <label for='name'><?php _e('Name', 'mj-contact-us').$nameLbl; ?></label>
                <input <?php echo $nameFld; ?> name='uname' id='uname' type='name' aria-required='true' value="<?php echo $model->getValue('uname'); ?>" />
            </div>
            <div class='h-71'>
                <label for='email'><?php _e('E-mail', 'mj-contact-us').$emailLbl; ?></label>
                <input id='email' <?php echo $emailFld; ?> name='email' type='email' aria-required='true' value="<?php echo $model->getValue('email'); ?>" />
            </div>
            <div class='h-71'>
                <label for='subject'><?php _e('Subject', 'mj-contact-us').$subjectLbl; ?></label>
                <input id='subject' <?php echo $subjectFld; ?> name='subject' type='subject' size='30' aria-required='true' value="<?php echo $model->getValue('subject'); ?>" />
            </div>
            <div class='h-71'>
                <label for='url'><?php _e('Website', 'mj-contact-us').$websiteLbl; ?></label>
                <input id='url' <?php echo $websiteFld; ?> name='url' type='url' aria-required='true' value="<?php echo $model->getValue('url'); ?>" />
            </div>
            <div class='h-134'>
                <label for='message'><?php _e('Comment', 'mj-contact-us').$commentLbl; ?></label>
                <textarea id='comment' name='comment' <?php echo $commentFld; ?> cols='' rows=''><?php echo $model->getValue('comment'); ?></textarea>
            </div>
            <?php if (get_option('MJcopytome')==1): ?>
            <div class='h-71'>
                <label for='message'><?php _e('Send copy to me', 'mj-contact-us'); ?></label>
                <input type='checkbox' name='copytome' class='w-16' id='copytome' value='1'>
            </div>
            <?php
            endif;
            if (get_option('l')==1) {
            ?>
            <div class='h-71'>
                <label for='message'>
                    <?php
                        $captcha = __('Captcha :', 'mj-contact-us').' ';
                        _e($captcha.MjFunctions::MathCaptcha());
                    ?>
                </label>
                <input id='captcha' required name='captcha' type='number' value=''  aria-required='true'>
            </div>
            <input type='hidden' name='CODEINCODE' value="<?php echo MjFunctions::BaseIncode(); ?>">
            <?php } elseif(get_option('mjEnableCaptcha')==0) { ?>
            <div class='h-71'>
                <label for='message'><img src="<?php echo WP_CAPTCHA_DIR_URL.'captcha_code_file.php?s=single&rand='.rand(); ?>" /></label>
                <input id='captcha' required name='captcha' type='text'  aria-required='true' value="<?php echo $model->getValue('captcha'); ?>" />
            </div>
            <?php }
            if (get_option('MJattachment')):
            ?>
            <div class='h-71'>
                <label for='message'><?php _e('Upload Files', 'mj-contact-us'); ?></label>
                <input type='file' name='file' id='file' />
            </div>
            <?php endif; ?>
            <div>
                <input name='mj_submit' type='submit' id='submit' value="<?php _e('Send', 'mj-contact-us'); ?>">
                <input type='hidden' name='mj_submit' value='active'>
                <input type='hidden' name='page_id' value="<?php echo $post->ID; ?>">
            </div>
        </form>
    </div>
</div>