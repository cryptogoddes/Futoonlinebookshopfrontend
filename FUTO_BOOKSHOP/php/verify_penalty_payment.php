<?php
session_start();
include("db_connect.php");
header('Content-Type: application/json');

if (!isset($_SESSION['matric'])) {
    echo json_encode(["success" => false, "message" => "Session expired. Please log in again."]);
    exit;
}

$matric = $_SESSION['matric'];
$order_id = isset($_POST['order_id']) ? intval($_POST['order_id']) : 0;
$reference = isset($_POST['reference']) ? trim($_POST['reference']) : '';

if ($order_id <= 0 || empty($reference)) {
    echo json_encode(["success" => false, "message" => "Invalid request."]);
    exit;
}

$secret_key = "sk_test_3649b9b23e3b0e23e9719d8b571958b60989b783"; 
$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_URL => "https://api.paystack.co/transaction/verify/" . rawurlencode($reference),
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => [
        "Authorization: Bearer $secret_key",
        "Cache-Control: no-cache"
    ],
));
//to check entry and curl error
$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);

if ($err) {
    echo json_encode(["success" => false, "message" => "Curl error: $err"]);
    exit;
}

$result = json_decode($response, true);

if ($result && isset($result['data']['status']) && $result['data']['status'] === 'success') {
    // mark penalty as paid
    $update = $conn->prepare("UPDATE orders SET penalty_paid = 1, status = 'penalty_paid' WHERE id = ?");
    $update->bind_param("i", $order_id);
    $update->execute();
    $update->close();

    echo json_encode([
        "success" => true,
        "message" => "Penalty payment verified. You can now reschedule your pickup."
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Payment verification failed."
    ]);
}

$conn->close();
?>
