<?php
session_start();
session_unset();
session_destroy(); 
session_start(); 

include 'db_connect.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $matric = $_POST['matric'];
    $password = $_POST['password'];
    $sql = "SELECT * FROM users WHERE matric = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $matric);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['password'])) {
            $_SESSION['matric'] = $user['matric'];
            $_SESSION['name'] = $user['name'];
            $_SESSION['department'] = $user['department'];
            $_SESSION['level'] = $user['level'];

            header("Location: ../html/dashboard.php");
            exit();
        } else {
            echo " Incorrect password!";
        }
    } else {
        echo " No account found with that matric number!";
    }

    $stmt->close();
}
$conn->close();
?>
