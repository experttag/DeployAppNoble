<?php
  include("imkeys.php");

  //Check Captcha
  if ($_GET["action"] == "check") {
    for ($i=0; $i<5; $i++)    
      if ($oCharList[substr($_GET["code"],$i,1)] != substr($_GET["ans"], $i,1)) 
        die("-1");
      
    die("0");
	}
		
  //Show Captcha chars
  else if ($_GET["action"] == "show") {
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache, must-revalidate">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="last-modified" content="">
  </head>
  <body>

<?php
	for ($i=0; $i<5; $i++)
    echo "<img src=\"imcpa_".$oNameList[substr($_GET["code"],$i,1)].".gif\" width=\"24\" height=\"24\" >";
?>

  </body>
</html>

<?php
}
?>
