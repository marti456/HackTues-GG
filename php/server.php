<?php

$id = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  //var_dump($_POST);
  // collect value of input field
  $id = $_POST['id'];
}

$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$conn->select_db('GarbageCollect');

if ($id != null) {
	$sql = "UPDATE Bin SET is_full = 'True' WHERE id = '".$id."';";
	$retval = $conn->query( $sql );
	if(! $retval ) {
  		die('Could not update table: ' . mysql_error());
	}
	$conn->close();
}


?>