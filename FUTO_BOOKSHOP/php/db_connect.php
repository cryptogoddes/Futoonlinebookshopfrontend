<?php
$host = 'futo-bookshop-service-futo-bookshop.a.aivencloud.com';
$user = 'avnadmin';
$pass = 'AVNS_jWb0uwkmHjOj0MHTmhJ';
$dbname = 'futo_bookshop';
$port = 27140;
$conn = new mysqli($host, $user, $pass, $dbname, $port);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
?>

<?php
/*
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'futo_bookshop';
$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}*/
?>
