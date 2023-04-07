<?php 
include_once('getconfig.php');
$conn = new mysqli($_ENV['MySQL_PRIVATE_HOST'] . ':' .$_ENV['MySQL_PRIVATE_PORT'], $_ENV['MySQL_PRIVATE_USER'], $_ENV['MySQL_PRIVATE_PASSWORD'], $_ENV['MySQL_PRIVATE_DB_NAME']);
?>