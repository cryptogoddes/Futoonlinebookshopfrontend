<?php
session_start();
include("db_connect.php");
header('Content-Type: application/json');

if (!isset($_SESSION['matric'])) {
    echo json_encode(["success" => false, "message" => "Session expired. Please log in again."]);
    exit;
}

if (!isset($_POST['book_id'])) {
    echo json_encode(["success" => false, "message" => "Missing book ID."]);
    exit;
}

$matric = trim($_SESSION['matric']);
$book_id = intval($_POST['book_id']);


$userQuery = "SELECT id FROM users WHERE matric = ?";
$stmt = $conn->prepare($userQuery);
$stmt->bind_param("s", $matric);
$stmt->execute();
$userResult = $stmt->get_result();
if (!$user = $userResult->fetch_assoc()) {
    echo json_encode(["success" => false, "message" => "User not found."]);
    exit;
}
$student_id = $user['id'];
$orderCheck = "SELECT id, status, penalty_paid FROM orders WHERE student_id = ? AND book_id = ?";
$stmt = $conn->prepare($orderCheck);
$stmt->bind_param("ii", $student_id, $book_id);
$stmt->execute();
$orderResult = $stmt->get_result();

if ($order = $orderResult->fetch_assoc()) {
    if ($order['penalty_paid'] == 0) {
        echo json_encode([
            "status" => "already_bought",
            "success" => false,
            "message" => "This book has been purchased before. Missed pickup? Reschedule or contact support."
        ]);
        exit;
    }
}

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

if (isset($_SESSION['cart'][$book_id])) {
    echo json_encode([
        "success" => false,
        "message" => "This book is already in your cart."
    ]);
    exit;
}

$bookQuery = "SELECT * FROM books WHERE id = ?";
$stmt = $conn->prepare($bookQuery);
$stmt->bind_param("i", $book_id);
$stmt->execute();
$result = $stmt->get_result();
if (!$book = $result->fetch_assoc()) {
    echo json_encode(["success" => false, "message" => "Book not found."]);
    exit;
}

$_SESSION['cart'][$book_id] = $book;
$cart_count = count($_SESSION['cart']);

echo json_encode([
    "success" => true,
    "status" => "success",
    "cart_count" => $cart_count,
    "message" => "Book added successfully."
]);
?>
