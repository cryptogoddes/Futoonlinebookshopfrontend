<?php
set_time_limit(0);
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db_connect.php';
$csvFile = __DIR__ . '/books.csv';

if (!file_exists($csvFile)) {
    die("❌ CSV file not found. Please place 'books.csv' inside: " . __DIR__);
}

$handle = fopen($csvFile, "r");
if (!$handle) {
    die("❌ Unable to open CSV file.");
}
$stmt = $conn->prepare("
    INSERT INTO books (title, author, price, level, semester, created_at)
    VALUES (?, ?, ?, ?, ?, NOW())
");

if (!$stmt) {
    die(" Prepare failed: " . $conn->error);
}

$rowCount = 0;
$inserted = 0;

while (($row = fgetcsv($handle, 1000, ",")) !== false) {
    if ($rowCount === 0 && strtolower($row[0]) === 'title') {
        $rowCount++;
        continue;
    }

    $title = trim($row[0]);
    $author = trim($row[1]);
    $price = preg_replace('/[^\d]/', '', trim($row[2])); 
    $level = strtoupper(trim($row[3]));
    $semester = strtoupper(trim($row[4])); 
    if (empty($title) || empty($author)) continue;

    $stmt->bind_param("ssdss", $title, $author, $price, $level, $semester);

    if ($stmt->execute()) {
        $inserted++;
    }
    $rowCount++;
}

fclose($handle);
$stmt->close();
$conn->close();

echo " Successfully imported $inserted books into the database!";
?>
