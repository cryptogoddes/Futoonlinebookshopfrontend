<?php
include 'db_connect.php';
$conn->query("TRUNCATE TABLE pickup_slots");

$days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
$today = new DateTime();

foreach ($days as $i => $day) {
    $date = clone $today;
    $date->modify("next $day");
    $slots = [
        ['09:00:00', '11:00:00'],
        ['11:00:00', '13:00:00']
    ];
    foreach ($slots as $slot) {
        $stmt = $conn->prepare("INSERT INTO pickup_slots (day_name, date, start_time, end_time) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $day, $dateFormatted, $slot[0], $slot[1]);

        $dateFormatted = $date->format('Y-m-d');
        $stmt->execute();
    }
}

echo "Pickup slots generated successfully!";
?>
