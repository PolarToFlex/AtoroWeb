<?php 

include('core/theme/page.php');
?>
  <!-- Header -->
    <!-- Header -->
    <div class="header pb-6 d-flex align-items-center" style="min-height: 500px; background-image: url(<?= $_ENV["APP_BACKGROUND"] ?>); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container">
        <div class="row">
          <div class="col">
            <h1 class="display-2 text-white">Hello <?= $userdb["username"] ?></h1>
            <p class="text-white mt-0 mb-5">Welcome to <?= $_ENV['APP_NAME'] ?>! Get your server below!</p>
            <a href="create" class="btn btn-neutral">Create a new server</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6">
          <div class="row">
            <div class="col-lg-3">
              <div class="card bg-gradient-blue border-0">
                <!-- Card body -->
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0 text-white">Processor limit</h5>
                      <span class="h2 font-weight-bold mb-0 text-white"><?= $usedCpu . "/" . $userdb["cpu"] ?>%</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-white text-dark rounded-circle shadow">
                          <i class="fa fa-microchip"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <?php
        if (isset($_SESSION["error"])) {
            ?>
            <div class="alert alert-danger" role="alert">
                <strong>Error!</strong> <?= $_SESSION["error"] ?>
            </div>
            <?php
            unset($_SESSION["error"]);
        }
        ?>
        <?php
        if (isset($_SESSION["success"])) {
            ?>
            <div class="alert alert-success" role="alert">
                <strong>Success!</strong> <?= $_SESSION["success"] ?>
            </div>
            <?php
            unset($_SESSION["success"]);
        }
        ?>
        <div class="row">
            <div class="col">
                <div class="card bg-default shadow">
                    <div class="card-header bg-transparent border-0">
                        <h3 class="text-white mb-0">Your servers</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-dark table-flush">
                            <tbody class="list">
                            <?php
                            if (count($uservers) == 0 && $servers_in_queue->num_rows == 0) {
                                // No servers
                                ?>
                                <div style="text-align: center;">
                                    <img src="/assets/img/empty.svg" height="150"/><br/>
                                    <h2 style="color: white;">No servers yet. Why not creating one?</h2>
                                    <a href="create" class="btn btn-neutral">Create a new server</a><br/><br/>
                                </div>
                                <?php
                            } else {
                                ?>
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Server name</th>
                                    <th scope="col">Node</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Server type</th>
                                    <th scope="col">CPU</th>
                                    <th scope="col">RAM</th>
                                    <th scope="col">Disk</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <?php
                            }
                            foreach($servers_in_queue as $server) {
                                $currentqueue = mysqli_query($cpconn, "SELECT * FROM servers_queue")->num_rows;
                                $egg = $cpconn->query("SELECT * FROM eggs WHERE id = " . $server['egg'])->fetch_array();
                                $location = $cpconn->query("SELECT * FROM locations WHERE id = " . $server['location'])->fetch_array();
                                $currentnodequeue = mysqli_query($cpconn, "SELECT id FROM servers_queue ORDER BY type DESC");
                                $serverpos = 0;
                                foreach($currentnodequeue as $queue) {
                                    $serverpos++;
                                    if ($queue['id'] == $server['id']) {
                                        break;
                                    }
                                }
                            ?>
                                <tr>
                                    <th scope="row">
                                        <div class="media align-items-center">
                                            <div class="media-body">
                                                <span class="name mb-0 text-sm"><?= $server["name"] ?></span>
                                            </div>
                                        </div>
                                    </th>
                                    <td>
                                        <img src="<?= $location["icon"] ?>" width="20"/>
                                        <?= $location["name"] ?>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4"><i class="bg-danger"></i><span class="status">In queue (Position <?= $serverpos . "/" . $currentnodequeue->num_rows ?>)
                                        <br/>
                                        <?php
                                        if ($server["type"] == 0) {
                                            echo '<img src="https://i.imgur.com/ZJSpUpX.png" width="20"> Normal queue </span></span>';
                                        } elseif ($server["type"] == 1) {
                                            echo '<img src="https://i.imgur.com/Wbxaytz.png" width="20"> VIP queue </span></span>';
                                        } elseif ($server["type"] == 2) {
                                            echo '<img src="https://i.imgur.com/lLQy3gP.png" width="20"> Staff queue </span></span>';
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <img src="<?= $egg["icon"] ?>" height="20" />
                                        <?= $egg["name"] ?>
                                    </td>
                                    <td>
                                        <?= $server["cpu"] ?>%
                                    </td>
                                    <td>
                                        <?= $server["ram"] ?>MB
                                    </td>
                                    <td>
                                        <?= $server["disk"] ?>MB
                                    </td>
                                    <td>
                                        <?php
                                        if ($server["type"] == 0) {
                                            echo '<a href="server/buyVip?server=' . $server["id"] . '" class="btn btn-warning btn-sm"><i class="fas fa-long-arrow-alt-up"></i> Upgrade to VIP queue</a>';
                                        } else {
                                            echo '<button type="button" class="btn btn-warning btn-sm" disabled="1" style="cursor: not-allowed;"><i class="fas fa-long-arrow-alt-up"></i> <span style="text-decoration: line-through;">Upgrade to VIP queue</span> </button>';
                                        }
                                        ?>
                                        <a href="server/queueDelete?server=<?= $server["id"] ?>" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Delete</a>
                                    </td>
                                </tr>
                            <?php
                            }

                            foreach ($uservers as $server) {
                                $egg = mysqli_query($cpconn, "SELECT * FROM eggs WHERE `eggs`.`egg`='" . $server["egg"] . "'")->fetch_array();
                                $serverinfo = mysqli_query($cpconn, "SELECT * FROM servers WHERE `servers`.`pid`='" . $server["id"] . "'")->fetch_array();
                                $location = mysqli_query($cpconn, "SELECT * FROM locations WHERE `locations`.`id`='" . $serverinfo["location"] . "'")->fetch_array();
                                $uuid = substr($server['uuid'], 0, strpos($server['uuid'], "-"));
                                ?>
                                <tr>
                                    <th scope="row">
                                        <div class="media align-items-center">
                                            <div class="media-body">
                                                <span class="name mb-0 text-sm"><?= $server["name"] ?></span>
                                            </div>
                                        </div>
                                    </th>
                                    <td>
                                        <img src="<?= $location["icon"] ?>" width="20"/>
                                        <?= $location["name"] ?>
                                    </td>
                                    <td>
                                        <?php
                                        if ($server["container"]["installed"] != 1) {
                                            echo '<span class="badge badge-dot mr-4"><i class="bg-warning"></i><span class="status">Installing</span></span>';
                                        } elseif ($server["suspended"] == true) {
                                            echo '<span class="badge badge-dot mr-4"><i class="bg-warning"></i><span class="status">Suspended</span></span>';
                                        } else {
                                            echo '<span class="badge badge-dot mr-4"><i class="bg-success"></i><span class="status">Installed</span></span>';
                                            $hibernating = file_get_contents($_CONFIG["proto"] . $_SERVER["SERVER_NAME"] . "/api/user/hibwhitelist?serverid=" . $server['uuid']);
                                            if ($egg["hibernation"] == 1) {
                                                if ($hibernating != 1) {
                                                    echo '<img src="https://i.imgur.com/K6S8u5h.png" width="27" /> Hibernation enabled <button type="button" class="btn btn-primary btn-sm" data-container="body" data-toggle="popover" data-placement="top" data-content="The hibernation system is really simple, when no players are online, your server will unload chunks and plugins to reduce CPU usage. You can remove this limitation by purchasing a bypass, to use plugins like Dynmap or other plugins that require to run when no players are online.">?</button>';
                                                } else {
                                                    echo '<img src="https://i.imgur.com/uMeSsAo.png" width="27" /> Hibernation disabled';
                                                }
                                            } else {
                                                echo '<img src="https://i.imgur.com/uMeSsAo.png" width="27" /> No hibernation for this egg';
                                            }
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <img src="<?= $egg["icon"] ?>" height="20" />
                                        <?= $egg["name"] ?>
                                    </td>
                                    <td>
                                        <?= $server["limits"]["cpu"] ?>%
                                    </td>
                                    <td>
                                        <?= $server["limits"]["memory"] ?>MB
                                    </td>
                                    <td>
                                        <?= $server["limits"]["disk"] ?>MB
                                    </td>
                                    <td>
                                        <a href="<?= $_CONFIG["ptero_url"] . "/server/" . $server["identifier"] ?>" class="btn btn-primary btn-sm" data-trigger="hover" data-container="body" data-toggle="popover" data-color="default" data-placement="left" data-content="Open in the game panel"><i class="fas fa-external-link-square-alt"></i></a>
                                        <a href="/server/manage?id=<?= $server["id"] ?>" class="btn btn-primary btn-sm">Edit</a>
                                        <a href="/server/delete?server=<?= $server["id"] ?>"><button type="button" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Delete</button></a>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
      <!-- Footer -->
      <footer class="footer pt-0">
        <div class="row align-items-center justify-content-lg-between">
          <div class="col-lg-6">
            <div class="copyright text-center  text-lg-left  text-muted">
                &copy; 2022 <a href="https://github.com/ShadowsDash" class="font-weight-bold ml-1" target="_blank">Shadow's Dash - X_Shadow_#5962</a> - Theme by <a href="https://creativetim.com" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-lg-6">
            <ul class="nav nav-footer justify-content-center justify-content-lg-end">
              <li class="nav-item">
                <a href="<?= $_CONFIG["website"] ?>" class="nav-link" target="_blank"> Website</a>
              </li>
              <li class="nav-item">
                <a href="<?= $_CONFIG["statuspage"] ?>" class="nav-link" target="_blank">Uptime / Status</a>
              </li>
              <li class="nav-item">
                <a href="<?= $_CONFIG["privacypolicy"] ?>" class="nav-link" target="_blank">Privacy policy</a>
              </li>
              <li class="nav-item">
                <a href="<?= $_CONFIG["termsofservice"] ?>" class="nav-link" target="_blank">Terms of service</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
</div>
  <script>
      $("#gamepanelopen").popover({ trigger: "hover" });
  </script>
<?php include('core/theme/footer.php')?>