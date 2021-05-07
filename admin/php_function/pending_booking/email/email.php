<?php
require("PHPMailer-master/src/PHPMailer.php");
require("PHPMailer-master/src/SMTP.php");
require("PHPMailer-master/src/Exception.php");


$mail = new PHPMailer\PHPMailer\PHPMailer();
$mail->IsSMTP();

$mail->CharSet = "UTF-8";
$mail->Host = "sg2plzcpnl456440.prod.sin2.secureserver.net";
//$mail->SMTPAutoTLS = false; 
$mail->SMTPDebug = 1;
$mail->Port = 25; //465 or 587

$mail->SMTPSecure = 'tsl';
$mail->SMTPAuth = true;
$mail->IsHTML(true);

//Authentication
$mail->Username = "officialbluegardenresort@bluegardenresort.com";
$mail->Password = "Bluegardenresort";

//Set Params
$mail->SetFrom("officialbluegardenresort@bluegardenresort.com", "Blue Garden Hotel & Resort");
$mail->AddAddress("6933rauf@gmail.com");
$mail->Subject = "Test";
$mail->Body = "<h1>HELLO</h1>";


if (!$mail->Send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    echo "Message has been sent";
}
?>