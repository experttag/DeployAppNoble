<?php
include "imemail.inc.php";

//Load content
$PayMsg = array("");
$imOpt = 0;
$imOrderNo = $_POST["imOrderNo"];
$imLocale = explode("||",$_POST["imLocale"]);
$imUserData = str_replace("\'", "'", $_POST["imUserData"]);
$imUserData = explode("||",$imUserData);
$imUserDataTxt = "";
$imUserDataHTML = "";
$imUserDataCSVH = "";
$imUserDataCSV = "";
$i = 0;
if(is_array($imUserData))
   foreach($imUserData as $ud) {
      $ud = explode("::",$ud);
      $imUserDataTxt .= $ud[0] . ": " . $ud[1] . "\n";
      $imUserDataHTML .= "<tr" . ($i%2 ? " bgcolor=\"#EEEEEE\"" : "") . "><td width=\"25%\"><b>" . $ud[0] . ":</b></td><td>" . $ud[1] . "</td></tr>\n";
      $imUserDataCSVH[] = $ud[0];
      $imUserDataCSV[] = $ud[1];
      $i++;
   }
$imUserDataCSV = implode(";",$imUserDataCSVH) . "\n" . implode(";",$imUserDataCSV);

$imOrderData = str_replace("\'", "'", $_POST["imOrderData"]);
$imOrderData = explode("||",$imOrderData);
$imOrderDataTxt = "";
$imOrderDataHTML = "";
$imOrderDataCSV = "";
$i = 0;
if(is_array($imOrderData)) {
   foreach($imOrderData as $od) {
      $od = explode("::",$od);
      if(count($od) == 6)
         $imOpt = 1;
   }
   $imOrderDataHTML = "<tr bgcolor=\"#EEEEEE\"><td><b>" . $imLocale[1] . "</b></td><td><b>" . $imLocale[2] . "</b></td>" . ($imOpt ? "<td><b>" . $imLocale[3] . "</b></td>" : "") . "<td><b>" . $imLocale[4] . "</b></td><td><b>" . $imLocale[5] . "</b></td></tr>\n";
   $imOrderDataCSV = $imLocale[0] . ";" . $imLocale[1] . ";" . ($imOpt ? $imLocale[2] . ";" : "") . $imLocale[3] . ";" . $imLocale[4] . ";" . $imLocale[5];
   foreach($imOrderData as $od) {
      $od = explode("::",$od);
      switch(count($od)) {
         case 6:
            $imOrderDataCSV .= "\n" . implode(";",$od);
            $imOrderDataTxt .= $od[0] . " - " . $od[1] . " - " . $od[2] . " " . $od[3] . " x " . $od[4] . " " . $od[5] . "\n";
            $imOrderDataHTML .= "<tr" . ($i%2 ? " bgcolor=\"#EEEEEE\"" : "") . "><td>" . $od[0] . " - " . $od[1] . "</td><td>" . $od[2] . "</td><td>" . $od[3] . "</td><td>" . $od[4] . "</td><td>" . $od[5] . "</td></tr>\n";
            break;
         case 5:
            $imOrderDataCSV .= "\n" . $od[0] . ";" . $od[1] . ";" . ($imOpt ? ";" : "") . $od[2] . ";" . $od[3] . ";" . $od[4];
            $imOrderDataTxt .= $od[0] . " - " . $od[1] . " " . $od[2] . " x " . $od[3] . " " . $od[4] . "\n";
            $imOrderDataHTML .= "<tr" . ($i%2 ? " bgcolor=\"#EEEEEE\"" : "") . "><td>" . $od[0] . " - " . $od[1] . "</td>" . ($imOpt ? "<td></td>" : "") . "<td>" . $od[2] . "</td><td>" . $od[3] . "</td><td>" . $od[4] . "</td></tr>\n";
            break;
         case 2:
            $imOrderDataCSV .= "\n" . $od[0] . ";;;" . ($imOpt ? ";" : "") . ";" . $od[1];
            $imOrderDataTxt .= $od[0] . ": " . $od[1] . "\n";
            $imOrderDataHTML .= "<tr" . ($i%2 ? " bgcolor=\"#EEEEEE\"" : "") . "><td colspan=\"" . ($imOpt ? "4" : "3") . "\">" . $od[0] . "</td><td>" . $od[1] . "</td></tr>\n";
            break;
      }
      $i++;
   }
   $imOrderDataHTML .= "</table>";
}

// Template
$htmHead = "<table width=\"90%\" border=\"0\" bgcolor=\"#FFFFFF\" cellpadding=\"4\" style=\"font: 11px Tahoma; color: #000000; border: 1px solid #BBBBBB;\">";
$htmFoot .= "</table>";

//Send email to owner
$htmMsg = $htmHead . "<tr><td><b>" . $imOrderNo . "</b></td></tr>" . $htmFoot . "<br>" . $htmHead . $imOrderDataHTML . $htmFoot . "<br>" . $htmHead . $imUserDataHTML . $htmFoot . "<br>" . $htmHead . "<tr><td style=\"font-size: 85%\"><div style=\"overflow: auto;\">" . str_replace("\n","<br>",$imOrderDataCSV) . "</div></td></tr>" . $htmFoot . "<br>" . $htmHead . "<tr><td style=\"font-size: 85%\"><div style=\"overflow: auto;\">" . str_replace("\n","<br>",$imUserDataCSV) . "</div></td></tr>" . $htmFoot;
$oEmail = new imEMail($_POST["imUserMail"],"nandutomar@gmail.com",$imOrderNo,"iso-8859-1");
$oEmail->setText($imOrderNo . "\n\n" . $imOrderDataTxt . "\n\n\n" . $imUserDataTxt . "\n\n\n" . $imOrderDataCSV . "\n\n" . $imUserDataCSV);
$oEmail->setHTML("<html><body bgcolor=\"#063A69\" style=\"background-color: #063A69\"><center>" . $htmMsg . "</center></body></html>");
$oEmail->send();

//Send email to user
$htmMsg = $htmHead . "<tr><td><b>" . $imOrderNo . "</b></td></tr><tr><td>" . str_replace("\r\n","<br>",$PayMsg[$_POST["imShipment"]]) . "</td></tr>" . $htmFoot . "<br>" . $htmHead . $imOrderDataHTML . $htmFoot . "<br>" . $htmHead . $imUserDataHTML . $htmFoot;
$oEmail = new imEMail("nandutomar@gmail.com",$_POST["imUserMail"],$imOrderNo,"iso-8859-1");
$oEmail->setText($imOrderNo . "\n" . $PayMsg[$_POST["imShipment"]] . "\n\n" . $imOrderDataTxt . "\n\n\n" . $imUserDataTxt);
$oEmail->setHTML("<html><body bgcolor=\"#063A69\" style=\"background-color: #063A69\"><center>" . $htmMsg . "</center></body></html>");
$oEmail->send();
@header("Location: ../impayment.html");
?>
