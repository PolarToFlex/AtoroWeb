<?php 
include(__DIR__.'/../../core/imports/main.php');
include(__DIR__.'/../../core/imports/auth.php');
$userdb = $conn->query("SELECT * FROM at_users WHERE user_id = '" . mysqli_real_escape_string($conn, $_SESSION["uid"]) . "'")->fetch_array();


?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?= $_ENV["APP_NAME"] ?></title>
  <?php include('header.php'); ?>
</head>
<nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-dark bg-dark" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  d-flex  align-items-center">
        <a class="navbar-brand" href="/">
          <img src="<?= $_ENV['APP_LOGO'] ?>" class="navbar-brand-img" alt="...">
        </a>
        <div class=" ml-auto ">
          <!-- Sidenav toggler -->
          <div class="sidenav-toggler d-none d-xl-block" data-action="sidenav-unpin" data-target="#sidenav-main">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar-inner">
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
            <?php
            require("navbar.php");
            foreach ($_NAVBAR as $item) {
                ?>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $item["link"] ?>">
                            <i class="<?= $item["icon"] ?> text-primary"></i>
                            <span class="nav-link-text"><?= $item["text"] ?></span>
                        </a>
                    </li>
                </ul>
                <?php
            }
            ?>
          <!-- Divider -->
          <hr class="my-3">
          <!-- Heading -->
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content" id="panel">
    <!-- Topnav -->
    <?php
    if ($_SERVER['REQUEST_URI'] == "/") {
        $navcolor = "default";
    } else {
        $navcolor = "primary";
    }
    ?>
    <nav class="navbar navbar-top navbar-expand navbar-dark bg-<?= $navcolor ?> border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Navbar links -->
          <ul class="navbar-nav align-items-center  ml-md-auto ">
            <li class="nav-item d-xl-none">
              <!-- Sidenav toggler -->
              <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
            <li class="nav-item dropdown">
              <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="media align-items-center">
                  <span class="avatar avatar-sm rounded-circle">
                    <img alt="Image placeholder" src="<?= $userdb["avatar"] ?>">
                  </span>
                  <div class="media-body  ml-2  d-none d-lg-block">
                    <span class="mb-0 text-sm  font-weight-bold"><?= $userdb["username"] ?></span>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu  dropdown-menu-right ">
                <div class="dropdown-header noti-title">
                  <h6 class="text-overflow m-0">Welcome!</h6>
                </div>
                <a href="/auth/logout" class="dropdown-item">
                  <i class="ni ni-user-run"></i>
                  <span>Logout</span>
                </a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
<!--- BEGINNING OF THE CONTENT -->