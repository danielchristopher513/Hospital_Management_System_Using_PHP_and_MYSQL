<?php

include("adheader.php");
include("dbconnection.php");
if(isset($_POST["submitfullamount"]))
{
  $sql ="INSERT INTO payment(patientid,appointmentid,paiddate,paidtime,paidamount,status,cardnumber,cvvno,cardholder,expdate) values('$_GET[patientid]','$_GET[appointmentid]','$dt','$tim','$_POST[paidamount]','Active','$_POST[cardnumber]','$_POST[pin]','$_POST[cardholder]','$_POST[expdate]')";
  if($qsql = mysqli_query($con,$sql))
  {
   echo "<script>alert('payment record inserted successfully...');</script>";
 }
 else
 {
   echo mysqli_error($con);
 }

 $sql ="UPDATE billing SET discount=0.0, discountreason='none',discharge_time='$_POST[dischargetime]',discharge_date='$_POST[dischargedate]' WHERE appointmentid='$_GET[appointmentid]'";
 $qsql = mysqli_query($con,$sql);
 echo mysqli_error($con);

 echo "<script>window.location='patientreport.php?patientid=$_GET[patientid]&appointmentid=$_GET[appointmentid]'</script>";
}
if(isset($_SESSION['patientid']))
{
	$sql="SELECT * FROM payment WHERE paymentid='$_GET[editid]' ";
	$qsql = mysqli_query($con,$sql);
	$rsedit = mysqli_fetch_array($qsql);
	
}
$billappointmentid = $_GET['appointmentid'];
?>
<div class="container-fluid" href="">
  <div class="block-header">
    <h2>Make Payment</h2>

  </div>

  <div class="card" style="padding: 10px">


      <?php
      include("viewpaymentreport.php");
      ?>   

      <section class="container">
      <form method="post" action="">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th colspan="2">Discharge</th>
            </tr>
          </thead>
          <tbody>
          <tr>
              <td>Enter Card Number</td>
              <td><input class="form-control" type="text"name="cardnumber" type="text" id="cardnumber"></td>
            </tr>
            <tr>
            <td>Enter Card Holder Name</td>
              <td><input class="form-control" type="text"name="cardholder" type="text" id="cardholder"  ></td>
            </tr>
            <tr>
              <td>CVV</td>
              <td><input class="form-control" type="text" name="pin" type="text" id="pin"></td>
            </tr>
            <tr>
            <td>Enter Expiry Date</td>
              <td><input class="form-control" type="text"name="expdate" min="<?php echo date("Y-m-d"); ?>"type="text" id="expdate" onfocus="(this.type='date')" ></td>
            </tr>
            <tr>
              <td>Discharge date</td>
              <td><input class="form-control" name="dischargedate" type="text" id="dischargedate" value="<?php echo date("Y-m-d"); ?>" readonly></td>
            </tr>
            <tr>
              <td>Discharge time</td>
              <td><input class="form-control" name="dischargetime" type="text" id="dischargetime" value="<?php
              date_default_timezone_set("asia/kolkata");
              echo date("h:i:sa"); ?>" readonly></td>
            </tr>
            <tr>
              <td>Balance amount</td>
              <td><input class="form-control" name="balamt" type="text" id="balamt" value="<?php echo $balanceamt; ?>" readonly onkeyup="calculatepayable()"></td>
            </tr>
              <td>Payable amount</td>
              <td><input class="form-control" name="paidamount" type="text" id="paidamount" value="<?php echo $balanceamt; ?>" readonly></td>
            </tr>
            <tr>
              <td colspan="2" align="center"><input class="form-control" type="submit" name="submitfullamount" id="submitfullamount" value="Submit" /></td>
            </tr>
          </tbody>
        </table> 
      </form>  

      <table width="342" border="3">
        <thead>
          <tr>
            <td colspan="2" align="center"><a href='patientreport.php?patientid=<?php echo $_GET['patientid']; ?>&appointmentid=<?php echo $_GET['appointmentid']; ?>'><strong>View Patient Report>></strong></a></td>
          </tr>
        </thead>
      </table>   
</section>   
</div>
</div>
<?php
include("adfooter.php");
?>
<script type="application/javascript">
  function calculatepayable()
  {
   document.getElementById("paidamount").value = document.getElementById("balamt").value - document.getElementById("discountamount").value
 }
</script>