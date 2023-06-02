<?php
  require('sql.php');

  $query_text = $_REQUEST['query'];
  $result = mysqli_query($con,$query_text);

  if (!$result) {
    die("<p>Error in executing the SQL query " . $query_text . ": " .
        mysqli_error() . "</p>");
  }

  echo "<p>Results from your query:</p>";
  echo "<ul>";
  while ($row = mysqli_fetch_row($result)) {
    echo "<li>{$row[0]}</li>";
  }
  echo "</ul>";
?>