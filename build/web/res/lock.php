<?php
// Incomedia WebSite X5. All rights reserved.
include("config.php");

session_start();
$bLogged = false;
$session_indexes = im_get_session("im_session_indexes");
if ($session_indexes != "" && $session_indexes != null) {
  $iIndex = explode("|",$area_indexes);
  $iSessions = explode("|",$session_indexes);
  foreach($iIndex as $i)
    foreach($iSessions as $s)
      if(($i == $s) && ($i != ""))
        $bLogged = true;
}

$time = time();
If (($bLogged != true)|| ($time > im_get_session("im_session_time"))) {
  im_set_session("im_area_indexes",$area_indexes);
  im_set_session("im_JumpPage",$JumpPage);
  session_write_close();
    
  @header("Location: imlogin.php");
}
else{
  $session_time = $time + $tses;
  im_set_session("im_session_time",$session_time);
}
?>
