<?php
  $wgSMTP = [     
    'host' => 'email-smtp.us-east-1.amazonaws.com', // hostname of the email server     
    'IDHost' => 'gt-student-wiki.org',  // domain of email
    'port' => 587,      // must use this, regular TLS (465) doesn't seem to work
    'username' => '<redacted>', // IAM user of the email account  
    'password' => '<redacted>', // IAM user password  
    'auth' => true      
  ];
?>