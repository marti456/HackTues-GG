<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET') {

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

	$sql = "SELECT address FROM bin WHERE is_full = 1;";
	$result = $conn->query($sql);

	$addresses = array();

	if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	    	array_push($addresses, $row["address"]);
	    }
	} else {
	    echo "0 results";
	}

	print_r($addresses);

	$myJSON = json_encode($addresses);

	echo $myJSON;

	$sql = "UPDATE Bin SET is_full = 0 WHERE is_full = 1;";
	$retval = $conn->query( $sql );
	if(! $retval ) {
  		die('Could not update table: ' . mysql_error());
	}
	$conn->close();

}
?>