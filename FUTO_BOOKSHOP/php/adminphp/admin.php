<?php
session_start();
include '../db_connect.php';

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = trim($_POST['username']);
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM admins WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $admin = $result->fetch_assoc();

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['admin_id'] = $admin['id'];
        $_SESSION['role'] = $admin['role']; 
        $_SESSION['admin_username'] = $admin['username'];

        header("Location: dashboard.php");
        exit();
    } else {
      
        echo "<p style='text-align:center;color:red;margin-top:50px;'>
                Invalid credentials. <a href='../../html/adminlogin.html'>Try again</a>
              </p>";
    }
} else {
    header("Location:../../html/adminlogin.html");
    exit();
}
?>
