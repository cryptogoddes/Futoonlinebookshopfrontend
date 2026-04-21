<?php
include("db_connect.php");

$matric = "20201213202";
$name = "Nwamadu Confidence";
$password = password_hash($matric, PASSWORD_DEFAULT); 
$level = "500 Level";
$department = "Information Technology";


$sql = "INSERT INTO users (matric, name, password, level, department) 
        VALUES ('$matric', '$name', '$password', '$level', '$department')";

if ($conn->query($sql) === TRUE) {
    echo " User inserted successfully!";
} else {
    echo " Error: " . $conn->error;
}

$conn->close();
?>
