<?php
// =======================
// CONFIG
// =======================
$host = 'futo-bookshop-service-futo-bookshop.a.aivencloud.com';
$user = 'avnadmin';
$pass = 'AVNS_jWb0uwkmHjOj0MHTmhJ';
$dbname = 'futo_bookshop';
$port = 27140;

$formspree_url = "https://formspree.io/f/mkoqgbwe";


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // Method not allowed
    exit('Method not allowed');
}

$name = trim($_POST['name'] ?? '');
$email = trim($_POST['email'] ?? '');
$message = trim($_POST['message'] ?? '');


if (empty($name) || empty($email) || empty($message) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400); // Bad request
    exit('Invalid input');
}


$name = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
$email = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');
$message = htmlspecialchars($message, ENT_QUOTES, 'UTF-8');


$conn = new mysqli($host, $user, $pass, $dbname, $port);

if ($conn->connect_error) {
    http_response_code(500);
    exit("Database connection failed: " . $conn->connect_error);
}

$stmt = $conn->prepare("INSERT INTO contact_messages (name, email, message, submitted_at) VALUES (?, ?, ?, NOW())");
$stmt->bind_param("sss", $name, $email, $message);
$stmt->execute();
$stmt->close();
$conn->close();


$postData = [
    'name' => $name,
    'email' => $email,
    'message' => $message
];

$options = [
    'http' => [
        'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
        'method'  => 'POST',
        'content' => http_build_query($postData),
        'timeout' => 5
    ]
];

$context  = stream_context_create($options);
$result = @file_get_contents($formspree_url, false, $context);


if ($result === FALSE) {
    echo "Message saved, but failed to send email.";
} else {
    echo "success";
}
?>