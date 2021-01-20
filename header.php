<!-- Konek Ke Database dan localhost (Login) -->
      <?php 
      require_once "config/config.php";
      if(!isset($_SESSION['user'])) {
        echo "<script>window.location='".base_url('auth/login.php')."';</script>";
      } ?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=d evice-width, initial-scale=1.0">

    <title>Aplikasi Anggaran</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/dataTables/datatables.min.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="../assets/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css">
  </head>

  <body>

   <script src="../assets/js/jquery-1.10.2.js"></script>
    <script src="../assets/js/bootstrap.js"></script>
    <script src="../assets/dataTables/datatables.min.js"></script>
     

 <div id="wrapper">

<!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" style="letter-spacing: 3px; ">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?=base_url('dashboard')?>" style=" width: 220px; text-align: center; "><font color="red">M</font><font color="blue">A</font><font color="yellow">P</font></a>
        </div>

<!-- Menu Dashboard SideBar  -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" style="border-bottom: solid 4px orange; background-color: ; ">
          <ul class="nav navbar-nav side-nav" style="border-right: solid 4px orange; border-top: solid 4px orange;background-color: ;">
            <li><a href="<?=base_url('dashboard')?>"><font color="bluesky"><i class="fa fa-dashboard"></i></font><font color="white"> Dashboard</a></font></li>
            <li><a href="<?=base_url('unit/data.php')?>"><font color="bluesky"><i class="fa fa-briefcase" aria-hidden="true"></i></font><font color="white"> Unit</a></font></li>
            <li><a href="<?=base_url('rencana/data.php')?>"><font color="bluesky"><i class="fa fa-tasks" aria-hidden="true"></i></font><font color="white"> Pengajuan Rencana Anggaran</a></font></li>
            <li><a href="<?=base_url('pengajuan/data.php')?>"><font color="bluesky"><i class="fa fa-files-o"></i></font><font color="white"> Pengajuan Anggaran</a></font></li>
            <li><a href="<?=base_url('penyelesaian/data.php')?>"><font color="bluesky"><i class="fa fa-bar-chart-o" aria-hidden="true"></i></font><font color="white"> Penyelesain Anggaran</a></font></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font color="bluesky"><i class="fa fa-caret-square-o-down"></i></font><font color="white"> Persetujuan <b class="caret"></b></font></a>
              <ul class="dropdown-menu">
                <li><a href="<?=base_url('persetujuan/p_rencana.php')?>">Persetujuan Rencana</a></li>
                <li><a href="<?=base_url('persetujuan/p_pengajuan.php')?>">Persetujuan Pengajuan</a></li>
                <li><a href="<?=base_url('persetujuan/p_penyelesaian.php')?>">Persetujuan Penyelesaian</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font color="bluesky"><i class="fa fa-folder-open"></i></font><font color="white"> Laporan Anggaran <b class="caret"></b></font></a>
              <ul class="dropdown-menu">
                <li><a href="<?=base_url('laporan/p_rencana.php')?>">Laporan Rencana</a></li>
                <li><a href="<?=base_url('laporan/p_pengajuan.php')?>">Laporan Pengajuan</a></li>
                <li><a href="<?=base_url('laporan/p_penyelesaian.php')?>">Laporan Penyelesaian</a></li>
              </ul>
            </li>
            <li><a href="../Setting/settinguser.php"><font color="bluesky"><i class="fa fa-cog"></font></i><font color="white"> Setting User</a></font></li>
            <li><a href="../auth/logout.php"><font color="bluesky"><i class="fa fa-sign-out"></i></font><font color="white"> Logout</a></font></li>
          </ul>
<!-- Menu Navigation User  -->
          <ul class="nav navbar-nav navbar-right navbar-user"> 
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><font color="white"><i class="fa fa-user"></i> <?php echo $_SESSION['user']; ?> </font><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="../Setting/settinguser.php"><i class="fa fa-gear"></i> Setting User</a></li>
                <li class="divider"></li>
                <li><a href="../auth/logout.php"><i class="fa fa-power-off"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div id="page-wrapper">

