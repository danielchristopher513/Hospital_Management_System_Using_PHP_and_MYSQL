<html>
 <head>
  <link href="../css/phpMM.css" rel="stylesheet" type="text/css" />
 </head>

 <body>
  <div id="header"><h1>PHP & MySQL: The Missing Manual</h1></div>
  <div id="example">Example 4-2</div>

  <div id="content">
    <h1>SQL Query Runner</h1>
    <p>Enter your SQL query in the box below:</p>
    <form action="mysql.php" method="POST">
      <fieldset>
        <textarea id="query_text" name="query"
                  cols="65" rows="8"></textarea>
      </fieldset>
      <br />
      <fieldset class="center">
        <input type="submit" value="Run Query" />
        <input type="reset" value="Clear and Restart" />
      </fieldset>
    </form>
  </div>

  <div id="footer"></div>
 </body>
</html>

<?php

  $con=mysqli_connect('localhost', 'root','','ohmsphp')
    or die("<p>Error connecting to database: " .
           mysqli_error() . "</p>");

  echo "<p>Connected to MySQL!</p>";

  mysqli_select_db($con,'ohmsphp')
    or die("<p>Error selecting the database " . 'ohmsphp' .
           mysqli_error() . "</p>");

  echo "<p>Connected to MySQL, using database " . 'ohmsphp' . "</p>";
?>