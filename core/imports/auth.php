<?php 
//
// Make sure the user is logged in!
//
ini_set('session.gc_maxlifetime', 86400); 
ini_set('session.cookie_lifetime', 0); 
session_start();
if (!isset($_SESSION['loggedin'])) {
  if ($_SERVER["REQUEST_URI"] != "/") {
    $_SESSION["redirafterlogin"] = $_SERVER["REQUEST_URI"];
  }
  header("Location: /auth/login");
  
}
?>