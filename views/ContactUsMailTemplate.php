<html>
<head>
    <title><?php _e('Contact Us Mail', 'mj-contact-us'); ?></title>
</head>
<body>
    <p><?php _e('Hello Admin', 'mj-contact-us').$name; ?><br/></p>
    <p><?php _e('Please find the details of contact us mail send by a new user', 'mj-contact-us'); ?></p>
    <p>=============================================================</p>
    <table>
        <tr>
            <th><?php _e('Name :', 'mj-contact-us'); ?></th>
            <td><?php echo $name; ?></td>
        </tr>
        <tr>
            <th><?php _e('Email :', 'mj-contact-us'); ?></th>
            <td><?php echo $email; ?></td>
        </tr>
        <tr>
            <th><?php _e('Subject :', 'mj-contact-us'); ?></th>
            <td><?php echo $subject; ?></td>
        </tr>
        <tr>
            <th><?php _e('Website :', 'mj-contact-us'); ?></th>
            <td><?php echo $url; ?></td>
        </tr>
        <tr>
            <th><?php _e('Comment :', 'mj-contact-us'); ?></th>
            <td><?php echo $comment; ?></td>
        </tr>
    </table>
    <p>=============================================================</p>
    <p><?php _e('Thanks & Regards', 'mj-contact-us'); ?></p>
    <p><?php echo get_bloginfo(); ?></p>
</body>
</html>