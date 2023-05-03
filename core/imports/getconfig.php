<?php 
//
// Get settings from .env file
//
if (file_exists(__DIR__ . '/../../.env')) {
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../..');
    $dotenv->load();
} else {
    if(file_exists(__DIR__.'../../install/welcome')) {
        echo '<script>window.location.replace("/install/install.php");</script>';
    }
    else
    {
        echo "<script>alert('Woops looks like your installation is corrupted\n Please reinstall CyberPanel and AtoroDash\n Error: 404 .env file is not found\n Error: 404 .env file is not found');</script>";
    }
}
?>
