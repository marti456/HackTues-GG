<?php

$servername = "localhost";
$username = "root";
$password = "";
// Create connection
$conn = new mysqli($servername, $username, $password);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Create database
$sql = "CREATE DATABASE IF NOT EXISTS GarbageCollect;";
if ($conn->query($sql) == FALSE) {
   echo "Error creating database: " . $conn->error;
}
$retval = $conn->query($sql);
if(! $retval ) {
  die('Could not create db: ' . $conn->error);
}
///////////////////////////////////////////////////
/* change db to world db */
$conn->select_db('GarbageCollect');

/* return name of current default database */
/*if ($result = $conn->query("SELECT DATABASE()")) {
    $row = $result->fetch_row();
    printf("Default database is %s.\n", $row[0]);
    $result->close();
}*/

///////////////////////////////////////////////////

// Attempt create table query execution

$sql = "CREATE TABLE IF NOT EXISTS Bin(
    id INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(100) NOT NULL,
    is_full BOOLEAN
);";
$retval = $conn->query( $sql );
if(! $retval ) {
  die('Could not create table: ' . $conn->error);
}
$sql = "CREATE TABLE IF NOT EXISTS Districts(
    id INT NOT NULL AUTO_INCREMENT,
    district VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    bin_id INT,
    FOREIGN KEY (bin_id) REFERENCES Bin(id)
);";
$retval = $conn->query( $sql, );
if(! $retval ) {
  die('Could not create table: ' . $conn->error);
}
?>