<?php
session_start();
include '../db_connect.php';

if (!isset($_SESSION['admin_id'])) {
    http_response_code(401);
    echo json_encode(["error"=>"Unauthorized"]);
    exit();
}

$book_count = $conn->query("SELECT COUNT(*) AS total FROM books")->fetch_assoc()['total'] ?? 0;
$order_count = $conn->query("SELECT COUNT(*) AS total FROM orders")->fetch_assoc()['total'] ?? 0;
$slot_count = $conn->query("SELECT COUNT(*) AS total FROM pickup_slots")->fetch_assoc()['total'] ?? 0;
$delivery_count = $conn->query("SELECT COUNT(*) AS total FROM deliveries")->fetch_assoc()['total'] ?? 0;

// 7-day orders chart
$labels = [];
$orders_week = [];
for ($i = 6; $i >= 0; $i--) {
    $date = date("Y-m-d", strtotime("-$i days"));
    $labels[] = date("D", strtotime($date));
    $result = $conn->query("SELECT COUNT(*) AS total FROM orders WHERE DATE(created_at)='$date'");
    $orders_week[] = $result->fetch_assoc()['total'] ?? 0;
}

header('Content-Type: application/json');
echo json_encode([
    "books"=>$book_count,
    "orders"=>$order_count,
    "slots"=>$slot_count,
    "deliveries"=>$delivery_count,
    "labels"=>$labels,
    "orders_week"=>$orders_week
]);