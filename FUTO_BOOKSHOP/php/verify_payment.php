<?php
session_start();
include '../php/db_connect.php';
$secret_key = 'sk_test_3649b9b23e3b0e23e9719d8b571958b60989b783';
if (!isset($_GET['reference'])) {
    die("<p style='text-align:center;color:#c00;'>No payment reference supplied.</p>");
}
$reference = $_GET['reference'];
$ch = curl_init("https://api.paystack.co/transaction/verify/" . $reference);
curl_setopt($ch, CURLOPT_HTTPHEADER, ["Authorization: Bearer $secret_key"]);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

$result = json_decode($response, true);

if (isset($result['data']['status']) && $result['data']['status'] === "success") {
    $matric = $_SESSION['matric'] ?? null;
    if (!$matric) die("<p style='text-align:center;color:#c00;'>User not logged in.</p>");
    $getUser = $conn->prepare("SELECT id FROM users WHERE matric = ?");
    $getUser->bind_param("s", $matric);
    $getUser->execute();
    $user = $getUser->get_result()->fetch_assoc();
    $student_id = $user['id'] ?? null;
    if (!$student_id) die("<p style='text-align:center;color:#c00;'>Student record not found.</p>");

    $status = 'Paid';
    $created_at = date('Y-m-d H:i:s');
    $pickup_day = $_SESSION['pickup_day'] ?? 'Not selected';
    $pickup_time = $_SESSION['pickup_time'] ?? 'Not selected';
    if (isset($_SESSION['single_purchase'])) {
        $book_id = $_SESSION['single_purchase']['book_id'];

        $stmt = $conn->prepare("INSERT INTO orders (student_id, book_id, quantity, pickup_day, pickup_time, status, created_at)
                                VALUES (?, ?, 1, ?, ?, ?, ?)");
        $stmt->bind_param("iissss", $student_id, $book_id, $pickup_day, $pickup_time, $status, $created_at);
        $stmt->execute();
        $stmt->close();

        unset($_SESSION['single_purchase']);
        $message = "Payment Successful<br>Your book order and pickup details have been recorded.";
    }
    elseif (!empty($_SESSION['cart'])) {
        foreach ($_SESSION['cart'] as $book_id => $item) {
            $stmt = $conn->prepare("INSERT INTO orders (student_id, book_id, quantity, pickup_day, pickup_time, status, created_at)
                                    VALUES (?, ?, ?, ?, ?, ?, ?)");
            $quantity = $item['quantity'] ?? 1;
            $stmt->bind_param("iiissss", $student_id, $book_id, $quantity, $pickup_day, $pickup_time, $status, $created_at);
            $stmt->execute();
        }
        $stmt->close();
        unset($_SESSION['cart'], $_SESSION['pickup_day'], $_SESSION['pickup_time']);
        $message = "Payment Successful<br>Your cart orders and pickup details have been recorded.";
    }
    else {
        $message = "Payment verified, but no order session found.";
    }

} else {
    $message = "Payment failed or invalid reference.";
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Verification</title>
<style>
body {
    font-family: "Segoe UI", sans-serif;
    background: #f4f8fb;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.verify-container {
    background: white;
    padding: 30px 40px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
h2 {
    color: #28a745;
}
.btn {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 18px;
    background-color: #097809ff;
    color: white;
    border-radius: 6px;
    text-decoration: none;
}
.btn:hover {
    background-color: #004d00;
}
</style>
</head>
<body>
  <div class="verify-container">
    <h2><?= $message ?></h2>
    <a href="../html/dashboard.php" class="btn">Return to Dashboard</a>
  </div>
</body>
</html>
