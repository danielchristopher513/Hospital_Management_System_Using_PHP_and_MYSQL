
<?php

include("adheader.php");
include('dbconnection.php');

if(!isset($_SESSION['doctorid']))
{
	echo "<script>window.location='doctorlogin.php';</script>";
}

?>
<div class="container-fluid">
  <div class="block-header">
    <h2>Welcome <?php  $sql="SELECT * FROM `doctor` WHERE doctorid='$_SESSION[doctorid]' ";
    $doctortable = mysqli_query($con,$sql);
    $doc = mysqli_fetch_array($doctortable);

    echo 'Dr. '. $doc['doctorname']; ?>

  </h2>
</div>
</div>





<div class="card">
  <section class="container">
    <div class="row clearfix" style="margin-top: 10px">
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-file-plus col-blue"></i> </div>
          <div class="content">
            <div class="text">New Appoiment</div>
            <div class="number"><?php
            $sql = "SELECT * FROM appointment WHERE `doctorid`= '$_SESSION[doctorid]' AND appointmentdate=' ".date("Y-m-d")."'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-account col-cyan"></i> </div>
          <div class="content">
            <div class="text">Number of Patient</div>
            <div class="number"><?php
            $sql = "SELECT * FROM patient WHERE status='Active'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-account-circle col-blush"></i> </div>
          <div class="content">
            <div class="text">Today's Appointment</div>
            <div class="number">
              <?php
              $sql = "SELECT * FROM appointment WHERE status='Approved' AND `doctorid`= '$_SESSION[doctorid]' AND appointmentdate=' ".date("Y-m-d")."'" ;
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-money col-green"></i> </div>
          <div class="content">
            <div class="text">Total Earnings Of Hospital</div>
            <div class="number">₹ 
              <?php 
              $sql = "SELECT sum(bill_amount) as total  FROM `billing_records`" ;
              $qsql = mysqli_query($con,$sql);
              while ($row = mysqli_fetch_assoc($qsql))
              { 
               echo $row['total'];
             }
              ?>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>



<?php
include("adfooter.php");
?>