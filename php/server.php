<?php

$id = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

var_dump($_POST);
  // collect value of input field
  //$id = $_POST['id'];
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

$sql = "USE GarbageCollect";

if ($id != null) {
	$sql = "UPDATE Bin SET is_full = 'True' WHERE id = ".$id;
	$conn->close();
}


?>