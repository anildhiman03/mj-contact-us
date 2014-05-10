<?php
/**
 * Created by PhpStorm.
 * User: Anil Kumar
 * Date: 4/28/14
 * Time: 2:24 PM
 */

trait Mbase
{

    public function __construct()
    {
        if( !session_id() ) @session_start();
        if( !array_key_exists('flash_messages', $_SESSION) ) $_SESSION['flash_messages'] = '';
    }

    public static function render($file, $variables = array())
    {
        extract($variables);
        $filePath = plugin_dir_path( dirname( __FILE__ ) )."views/".$file;
        if (!file_exists($filePath)) {
            die( __("view not exist", 'mj-contact-us'));
        }

        ob_start();
        include $filePath;
        $renderedView = ob_get_clean();
        return $renderedView;
    }

    private function setMsg($message = null)
    {
        if ($message == null) {
            return false;
        }

        $_SESSION['flash_messages'] = $message;
        if ($this->getMsg()) {
            return true;
        } else {
            return false;
        }
    }

    private function getMsg()
    {
        if (isset($_SESSION['flash_messages'])) {
            $msg = $_SESSION['flash_messages'];
        } else {
            $msg = false;
        }
        return $msg;
    }

    public function setMessage($message = null , $type = "success")
    {
        if ($message == null) {
            return false;
        }
        $key = 'msg';
        if ($type == "success") {
            $message = "<div class='updatedcss' id='message'><label>$message</label></div>";
        } else {
            $message = "<div class='error p-12' id='message'><label>$message</label></div>";
        }
        return $this->setMsg($message);
    }

    public function getMessage()
    {
        $msg = $this->getMsg();
        if ($msg) {
            return $msg;
        } else  {
            return false;
        }
    }

    public function getValue($key = null, $default = null)
    {
        if ($key == null) {
            return false;
        }
        return (isset($_POST[$key]) && !empty($_POST[$key])) ? $_POST[$key] : $default;
    }

    public function mailHeader($to = null)
    {
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
        $headers .= 'From: '.get_bloginfo().'<'.$to.'>' . "\r\n" .
            'Reply-To: '.$to.'' . "\r\n" .
            'X-Mailer: PHP/' . phpversion();
        return $headers;
    }

    public function dump($exit = 0)
    {
        echo "<pre>";
        print_r($_REQUEST);
        print_r($_SESSION);
        echo "</pre>";
        if ($exit) {
            exit;
        }
    }

} 