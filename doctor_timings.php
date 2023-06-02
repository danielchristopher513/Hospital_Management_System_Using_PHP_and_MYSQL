<?php
include("header.php");
include("dbconnection.php");
?>

<div class="container-fluid">
  <div class="block-header">
    <h2 class="text-center">Doctor Timings</h2>

  </div>

<div class="card">

  <section class="container">
    <table class="table table-bordered table-striped table-hover js-basic-example dataTable" style="background-color:#808080;">

      <thead>
        <tr>
          <th width="15%" height="36"><div align="center">Doctor Name</div></th>
          <th width="20%"><div align="center">Start Time</div></th>
          <th width="20%"><div align="center">End Time</div></th>
        </tr>
      </thead>
      <tbody>
       <?php
       $sql ="SELECT * FROM doctor INNER JOIN doctor_timings on doctor.doctorid=doctor_timings.doctorid";
       $qsql = mysqli_query($con,$sql);
       
       while($rs = mysqli_fetch_array($qsql))
       {
        echo "<tr>
        <td>$rs[doctorname]<br>
        <td>
         &nbsp;$rs[start_time]<br>
        </td>
        <td>
         &nbsp;$rs[end_time]</td>";
       }
      ?>
    </tbody>
  </table>
</section>

</div>
</div>
<?php
include("footer.php");
?>