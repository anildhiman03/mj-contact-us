CREATE TABLE IF NOT EXISTS `wp_mj_contact_forms` (
  `form_id` int(10) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(225) DEFAULT NULL,
  `form_div_id` varchar(225) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `added_by` int(10) DEFAULT NULL,
  `added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `wp_mj_contact_fields` (
  `column_id` int(10) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(225) DEFAULT NULL,
  `column_name_id` varchar(225) DEFAULT NULL,
  `column_classes` text,
  `column_required` tinyint(1) NOT NULL DEFAULT '0',
  `form_ref_id` int(10) DEFAULT NULL,
  `column_status` tinyint(1) DEFAULT NULL,
  `added_by` int(10) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
