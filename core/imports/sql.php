<?php 
include_once('getconfig.php');
$conn = new mysqli($_ENV['MySQL_CYBERPANEL_HOST'] . ':' .$_ENV['MySQL_CYBERPANEL_PORT'], $_ENV['MySQL_CYBERPANEL_USER'], $_ENV['MySQL_CYBERPANEL_PASSWORD'], 'cyberpanel');
?>