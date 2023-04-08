<?php 
include_once('getconfig.php');
$conn = new mysqli($_ENV['MySQL_PRIVATE_HOST'] . ':' .$_ENV['MySQL_PRIVATE_PORT'], $_ENV['MySQL_PRIVATE_USER'], $_ENV['MySQL_PRIVATE_PASSWORD'], $_ENV['MySQL_PRIVATE_DB_NAME']);
$userdb = $conn->query("SELECT * FROM users WHERE user_id = '" . mysqli_real_escape_string($conn, $_SESSION["uid"]) . "'")->fetch_array();

?>