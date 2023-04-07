<?php 
include('../core/imports/main.php');
echo "Hi your ip is: ".getclientip();
?>
<html>
    <head>
        <title><?= $_ENV['APP_NAME']?></title>
    </head>
</html>