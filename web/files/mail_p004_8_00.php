<?php
//Check Captcha
include("../captcha/imkeys.php");
for ($i=0; $i<5; $i++)
  if ($oCharList[substr($_POST["Itm_8_00_cpf"],$i,1)] != substr($_POST["Itm_8_00_cpv"], $i,1))
    die("Error: Javascript must be enabled! (2)");

include "../res/imemail.inc.php";

//Form Data
$txtData = "";
$htmData = "";
$txtData .= "Senders email address: " . $_POST["Itm_8_00_1"] . "\r\n";
$htmData .= "<tr><td width=\"25%\"><b>Senders email address:</b></td><td>" . $_POST["Itm_8_00_1"] . "</td></tr>";
$txtData .= "Subject: " . $_POST["Itm_8_00_2"] . "\r\n";
$htmData .= "<tr><td width=\"25%\" bgcolor=\"#EEEEEE\"><b>Subject:</b></td><td bgcolor=\"#EEEEEE\">" . $_POST["Itm_8_00_2"] . "</td></tr>";
$txtData .= "Feedback: " . $_POST["Itm_8_00_3"] . "\r\n";
$htmData .= "<tr><td width=\"25%\"><b>Feedback:</b></td><td>" . $_POST["Itm_8_00_3"] . "</td></tr>";

// Template
$htmHead = "<table width=\"90%\" border=\"0\" bgcolor=\"#FFFFFF\" cellpadding=\"4\" style=\"font: 11px Tahoma; color: #000000; border: 1px solid #BBBBBB;\">";
$htmFoot = "</table>";

//Send email to owner
$txtMsg = "";
$htmMsg = $htmHead . "<tr><td></td></tr>" . $htmFoot;
$oEmail = new imEMail(($imForceSender ? $_POST["Itm_8_00_1"] : "nandutomar@gmail.com"),"nandutomar@gmail.com","Feedback recieved","iso-8859-1");
$oEmail->setText($txtMsg . "\r\n\r\n" . $txtData);
$oEmail->setHTML("<html><body bgcolor=\"#063A69\"><center>" . $htmMsg . "<br>" . $htmHead . $htmData . $htmFoot . "</center></body></html>");
$oEmail->send();

//Send email to user
$txtMsg = "dear customer,\r\n\r\nwe have recieved your feedback. we will try our best to incorporate your valuable suggestion.\r\n\r\nwe thank you for the valuable contribution.\r\n\r\nRegards\r\n\r\nadmin team\r\n\r\nNoble furnitures";
$htmMsg = $htmHead . "<tr><td>dear customer,<br><br>we have recieved your feedback. we will try our best to incorporate your valuable suggestion.<br><br>we thank you for the valuable contribution.<br><br>Regards<br><br>admin team<br><br>Noble furnitures</td></tr>" . $htmFoot;
$oEmail = new imEMail("nandutomar@gmail.com",$_POST["Itm_8_00_1"],"Your feedback recieved","iso-8859-1");
$oEmail->setText($txtMsg);
$oEmail->setHTML("<html><body bgcolor=\"#063A69\"><center>" . $htmMsg . "</center></body></html>");
$oEmail->send();
@header("Location: ../index.html");
?>
