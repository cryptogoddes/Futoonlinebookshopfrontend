<?php
set_time_limit(0);
include("db_connect.php");
$csvFile = __DIR__ . "/futo_bookshop.csv";
$fileHandle = fopen($csvFile, "r");

if ($fileHandle === FALSE) {
    die(" Cannot open CSV file.");
}
fgetcsv($fileHandle);
$stmt = $conn->prepare("INSERT IGNORE INTO users (matric, name, password, level, department) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $matric, $name, $password, $level, $department);

while (($row = fgetcsv($fileHandle)) !== FALSE) {
    $matric = $row[0];
    $name = $row[1];
    $password = password_hash($matric, PASSWORD_DEFAULT);
    $level = $row[2];
    $department = $row[3];

    $stmt->execute();
}

$stmt->close();
fclose($fileHandle);
$conn->close();

echo " All users added with hashed passwords!";
?>
