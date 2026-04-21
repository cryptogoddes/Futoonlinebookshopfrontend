<?php
session_start();
include '../db_connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: ../../html/adminlogin.html");
    exit();
}

$book_count = $conn->query("SELECT COUNT(*) AS total FROM books")->fetch_assoc()['total'] ?? 0;
$order_count = $conn->query("SELECT COUNT(*) AS total FROM orders")->fetch_assoc()['total'] ?? 0;
$slot_count = $conn->query("SELECT COUNT(*) AS total FROM pickup_slots")->fetch_assoc()['total'] ?? 0;
$delivery_count = $conn->query("SELECT COUNT(*) AS total FROM deliveries")->fetch_assoc()['total'] ?? 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - FUTO Bookshop</title>
<link rel="stylesheet" href="../../css/admin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<header>
    <button id="menu-toggle" aria-label="Toggle sidebar"><i class="fas fa-bars"></i></button>
    <h1>Admin Dashboard</h1>
    <div class="header-actions">
        <div class="profile" tabindex="0" aria-haspopup="true" aria-expanded="false">
            <img src="../../assets/adminpic.jpg" alt="Admin" />
            <span class="arrow"><i class="fas fa-chevron-down"></i></span>
            <ul class="dropdown" role="menu" aria-label="Profile menu">
                <li><a href="#"><i class="fas fa-user"></i> <?php echo htmlspecialchars($_SESSION['admin_username']); ?></a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</header>

<div class="container">
    <aside class="sidebar" aria-label="Sidebar navigation">
        <ul>
            <li><a href="dashboard.php" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="manage_books.php"><i class="fas fa-book"></i> Manage Books</a></li>
            <li><a href="manage_orders.php"><i class="fas fa-shopping-cart"></i> Orders</a></li>
            <li><a href="pickup_slots.php"><i class="fas fa-clock"></i> Pickup Slots</a></li>
            <li><a href="admin_reports.php"><i class="fas fa-truck"></i> Manage Reports</a></li>
            <li><a href="view_messages.php"><i class="fas fa-comments"></i> Messages</a></li>
        </ul>
    </aside>

    <main class="main">
        <section class="stats" aria-label="Quick stats">
            <div class="card">
                <h3>Books</h3>
                <p class="counter" data-key="books"><?php echo $book_count; ?></p>
            </div>
            <div class="card">
                <h3>Orders</h3>
                <p class="counter" data-key="orders"><?php echo $order_count; ?></p>
            </div>
            <div class="card">
                <h3>Slots</h3>
                <p class="counter" data-key="slots"><?php echo $slot_count; ?></p>
            </div>
            <div class="card">
                <h3>Deliveries</h3>
                <p class="counter" data-key="deliveries"><?php echo $delivery_count; ?></p>
            </div>
        </section>

        <section class="chart-section" aria-label="Orders chart">
            <canvas id="ordersChart"></canvas>
        </section>
    </main>
</div>

<script src="../../js/admin.js"></script>

</body>
</html>