<?php
$servername = "localhost";
$username = "username";
$password = "password";

// Create connection
$conn = new mysqli($servername, $username, $password);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Create database
$sql = "CREATE DATABASE GarbageCollect";
if ($conn->query($sql) == TRUE) {
  echo "Database created successfully";
} else {
  echo "Error creating database: " . $conn->error;
}

// Attempt create table query execution
$sql = "CREATE TABLE Districts(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    district VARCHAR(50) NOT NULL,
    driver_username VARCHAR(100) NOT NULL,
    driver_password VARCHAR(100) NOT NULL
)";

$sql = "CREATE TABLE Bin(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(100) NOT NULL,
    bin_id INT,
    FOREIGN KEY (bin_id) REFERENCES District(id)
)";

$conn->close();
?>