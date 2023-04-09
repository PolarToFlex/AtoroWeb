<?php 
require __DIR__ . '/../../vendor/autoload.php';
include('getconfig.php');
include('sql.php');
include('functions.php');
if ($_ENV['APP_DEBUG'] == "true") {
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}
else if ($_ENV['APP_DEBUG'] == "false")
{
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
}
else
{
    echo '<script>alert("DEBUG VALUE MUST BE true/false in .env");</script>';
}
?>