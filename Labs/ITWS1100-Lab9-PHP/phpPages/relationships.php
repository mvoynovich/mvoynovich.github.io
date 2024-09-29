<?php 
  include('includes/init.inc.php'); // include the DOCTYPE and opening tags
  include('includes/functions.inc.php'); // functions
?>
<title>PHP &amp; MySQL - ITWS</title>   

<?php include('includes/head.inc.php'); ?>

<h1>PHP &amp; MySQL</h1>
      
<?php include('includes/menubody.inc.php'); ?>

<?php
  $dbOk = false;
  @ $db = new mysqli('localhost', 'root', '', 'iit');

  if ($db->connect_error) {
    echo '<div class="messages">Could not connect to the database. Error: ';
    echo $db->connect_errno . ' - ' . $db->connect_error . '</div>';
  } else {
    $dbOk = true;
  }

  $havePost = isset($_POST["save"]);

  $errors = '';
  
?>

<h3>Relationships</h3>
<table id="relationshipTable">
<?php
  if ($dbOk) {

    $query = 'select relationships.relationshipid, movies.title, actors.last_name, actors.first_names, characters.role from relationships INNER JOIN actors ON actors.actorid = relationships.actorid INNER JOIN movies ON movies.movieid = relationships.movieid INNER JOIN characters ON characters.characterid = relationships.characterid ORDER BY `movies`.`title` ASC';
    $result = $db->query($query);
    $numRecords = $result->num_rows;

    echo '<tr><th>Movie:</th><th>Actor:</th><th>Role:</th><th></th></tr>';
    for ($i=0; $i < $numRecords; $i++) {
      $record = $result->fetch_assoc();
      if ($i % 2 == 0) {
        echo "\n".'<tr id="relationship-' . $record['relationshipid'] . '"><td>';
      } else {
        echo "\n".'<tr class="odd" id="relationship-' . $record['relationshipid'] . '"><td>';
      }
      echo htmlspecialchars($record['title']);
      echo '</td><td>';
      echo htmlspecialchars($record['last_name'] . ', ');
      echo htmlspecialchars($record['first_names']);
      echo '</td><td>';
      echo htmlspecialchars($record['role']);
      echo '</td><td>'; 
      // Uncomment the following three lines to see the underlying
      // associative array for each record.
      // echo '<tr><td colspan="3" style="white-space: pre;">';
      // print_r($record);
      // echo '</td></tr>';
    }

    $result->free();

    // Finally, let's close the database
    $db->close();
  }

?>
</table>

<?php include('includes/foot.inc.php'); 
  // footer info and closing tags
?>
