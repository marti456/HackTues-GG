<?php

$id = $_POST['id'];
$address = $_POST['address'];


if ($id != null) {
  if ($address != null) {
	$sql = "UPDATE Bin SET is_full = 'True' WHERE id = " + $id

	$conn->close();
  }
}

?>