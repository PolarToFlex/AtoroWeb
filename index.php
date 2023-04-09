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
                      <span class="h2 font-weight-bold mb-0 text-white">100%</span>
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
                        <h3 class="text-white mb-0">Your websites</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-dark table-flush">
                            <tbody class="list">
                                <div style="text-align: center;">
                                    <img src="<?= $_ENV['APP_URL']?>/core/assets/img/empty.svg" height="150"/><br/>
                                    <h2 style="color: white;">No websites yet. Why not creating one?</h2>
                                    <a href="create" class="btn btn-neutral">Create a new server</a><br/><br/>
                                </div>
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
                <a href="" class="nav-link" target="_blank"> Website</a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link" target="_blank">Uptime / Status</a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link" target="_blank">Privacy policy</a>
              </li>
              <li class="nav-item">
                <a href="" class="nav-link" target="_blank">Terms of service</a>
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