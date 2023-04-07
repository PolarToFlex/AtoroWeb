<?php 
include('../core/imports/main.php');
session_start();
$authorizeURL = 'https://discord.com/api/oauth2/authorize';
$tokenURL = 'https://discord.com/api/oauth2/token';
$apiURLBase = 'https://discord.com/api/users/@me';
if (!$conn->ping()) {
    $_SESSION['error'] = "There was an error communicating with MYSQL";
    header("location: /auth/login");
    die();
}
if (isset($_SESSION['loggedin'])) {
    if (isset($_SESSION["redirafterlogin"])) {
        header("location: " . $_SESSION["redirafterlogin"]);
    } else {
        header("location: /");
    }
    die();
}
if (isset($_GET['login'])) {
    try {
        $requestarray = array(
            "client_id" => $_ENV['DISCORD_CLIENT_ID'],
            "redirect_uri" => $_ENV['APP_URL'] . "/auth/discord",
            "response_type" => "code",
            "scope" => "identify guilds email guilds.join"
        );

        header("location: https://discord.com/api/oauth2/authorize?" . http_build_query($requestarray));
        die();
    }
    catch (exception $e) {
        $_SESSION['error'] = "There was an unknown error while redirecting to discord.";
        header("location: /auth/login");
        die();
    }
}
if (isset($_GET['code'])) {
    try {
        // Exchange the auth code for a token
        $token = apiRequest($tokenURL, array(
            "grant_type" => "authorization_code",
            'client_id' => $_ENV['DISCORD_CLIENT_ID'],
            'client_secret' => $_ENV['DISCORD_CLIENT_SECRET'],
            'redirect_uri' => $_ENV['APP_URL']. "/auth/discord",
            'code' => $_GET['code']
        ));
        $_SESSION['access_token'] = $token->access_token;
        header("location: /auth/discord");
        die();
    }
    catch (exception $e) {
        $_SESSION['error'] = "There was an unexpected error while fetching discord information.";
        header("location: /auth/login");
        die();

    }
}
if (isset($_SESSION['access_token'])) {
    $ipaddr = getclientip();
    $user = apiRequest($apiURLBase);
    
    //$user = json_encode(apiRequest($apiURLBase));
    //echo $user;
    
    if ($user->id != 852910297245286411 && $user->id != 741337166172389407 && $user->id != 895909117833654272) {
        $_SESSION['error'] = "Not released yet!";
        header("location: /auth/login");
        die();
    }
    $username = $user->username;
    $discriminator = $user->discriminator;
    $avatar = "https://cdn.discordapp.com/avatars/" . "$user->id" . '/' . "$user->avatar" . ".png";
    $email = $user->email;

    if (empty($user->avatar)) {
        $avatar = "https://support.discord.com/hc/user_images/l12c7vKVRCd-XLIdDkLUDg.png";
    }
    $guilds = apiRequest($apiURLBase . "/guilds");
    if (empty($user->email)) {
        $_SESSION['error'] = "Hey! We detected that you are editing the discord scopes!";
        header("location: /auth/login");
        die();
    }
    if (empty($guilds)) {
        $_SESSION['error'] = "Hey! We detected that you are editing the discord scopes!";
        header("location: /auth/login");
        die();
    }
    // Check if user is in the guild
    $inDiscord = false;
    foreach ($guilds as $guild) {
        if (!empty($guild->id)) {
            if ($guild->id == $_ENV['DISCORD_GUILD_ID']) {
                $inDiscord = true;
            }
        }
    }
    if ($inDiscord == false) {
        $_SESSION['error'] = "You are not in our discord server please join!";
        header("location: /auth/login");
        die();
    }
    $conn->query("INSERT INTO login_logs (ipaddr, userid) VALUES ('$ipaddr', '$user->id')");

    $userids = array();
    $loginlogs = mysqli_query($conn, "SELECT * FROM login_logs WHERE userid = '$user->id'");
    foreach ($loginlogs as $login) {
        $ip = $login['ipaddr'];
        if ($ip == "12.34.56.78") {
            continue;
        }
        $saio = mysqli_query($conn, "SELECT * FROM login_logs WHERE ipaddr = '$ip'");
        foreach ($saio as $hello) {
            if (in_array($hello['userid'], $userids)) {
                continue;
            }
            if ($hello['userid'] == $user->id) {
                continue;
            }
            array_push($userids, $hello['userid']);
        }
    }
    if (count($userids) !== 0) {
        $_SESSION['error'] = "Please don't try to abuse to get more resources";
        header("location: /auth/login");
        die();
    }

    if ($ipaddr == "127.0.0.1") {
        $ipaddr = "12.34.56.78";
    }
    $vpn = false;
    $response = file_get_contents("http://ip-api.com/json/" . $ipaddr . "?fields=status,message,country,regionName,city,timezone,isp,org,as,mobile,proxy,hosting,query");
    $response = json_decode($response, true);
    if (isset($response['proxy'])) {
        if ($response['proxy'] == true || $response['hosting'] == true) {
            $vpn = true;
        }
    }
    if ($response['type'] = !"Residential") {
        $vpn = true;
    }
    if ($ipaddr == "51.161.152.218" || $ipaddr == "66.220.20.165"){
        $vpn = false;
    }
    if ($vpn == true) {
        $_SESSION['error'] = "You are using a VPN. This is not allowed.";
        header("location: /auth/login");
        die();
    }
        // Insert user into de big fat db
        echo "Hi ".$username;
        echo "Your discord # is: ".$discriminator;
        echo "Your avatar is: ".$avatar;
        echo "Your email is: ".$email;

    } else {
        header("location: ?login");
        die();
    }
    function apiRequest($url, $post = FALSE, $headers = array())
    {
        try {
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

            $response = curl_exec($ch);


            if ($post)
                curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post));

            $headers[] = 'Accept: application/json';
            if ($_SESSION['access_token'])
                $headers[] = 'Authorization: Bearer ' . $_SESSION['access_token'];


            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

            $response = curl_exec($ch);
            return json_decode($response);
        } catch (exception $e) {

        }
    }
?>