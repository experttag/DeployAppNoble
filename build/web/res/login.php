<?php
// Incomedia WebSite X5. All rights reserved.
include("config.php");
session_start();
$area_indexes = im_get_session("im_area_indexes");
$session_error = false;

if (isset($_POST["user"]) && isset($_POST["psw"])) {
  $iIndex = explode("|",$area_indexes);
  foreach($iIndex as $i) {
    $found = false;
    $usr = $area_user[$i-1];
    $psw = $area_psw[$i-1];
    $nusr = count($usr);
    for($j = 0; ($j < $nusr) && !$found; $j++)
      if (($usr[$j] == $_POST["user"]) && ($psw[$j] == $_POST["psw"]))
        $found = true;
    
    if ($found) {
      $session_indexes = im_get_session("im_session_indexes") . $i . "|";
      $session_time = time() + $tses;
      im_set_session("im_session_indexes",$session_indexes);
      im_set_session("im_session_time",$session_time);

      $jp = im_get_session("im_JumpPage");
      session_write_close();
      @header("Location: $jp");
    }
    else {
      $session_error = true;
    }
  }
}
?>
