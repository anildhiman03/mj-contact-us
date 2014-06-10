<?php

        $randomnr = rand(1000, 9999);
        $_SESSION['randomnr2'] = md5($randomnr);

        //generate image
        $im = imagecreatetruecolor(100, 38);

        //colors:
        $white = imagecolorallocate($im, 255, 255, 255);
        $grey = imagecolorallocate($im, 128, 128, 128);
        $black = imagecolorallocate($im, 0, 0, 0);

        imagefilledrectangle($im, 100, 100, 100, 35, $black);

        //path to font:

        $font = 'times_new_yorker.ttf';

        //draw text:
        imagettftext($im, 35, 0, 22, 24, $grey, $font, $randomnr);

        imagettftext($im, 35, 0, 15, 26, $white, $font, $randomnr);

        // prevent client side  caching
        header("Expires: Wed, 1 Jan 1997 00:00:00 GMT");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");

        //send image to browser
        header ("Content-type: image/gif");
        imagegif($im);
        imagedestroy($im);
    

?>