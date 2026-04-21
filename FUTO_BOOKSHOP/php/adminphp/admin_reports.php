<?php
session_start();
include '../db_connect.php';

if (!isset($_SESSION['admin_id'])) {
    header("Location: ../../html/adminlogin.html");
    exit();
}

$start_date = $_GET['start_date'] ?? '';
$end_date = $_GET['end_date'] ?? '';

$query = "
SELECT 
  o.*, 
  u.name AS student_name, 
  u.matric AS matric_number, 
  b.title AS book_title
FROM orders o
JOIN users u ON o.student_id = u.id
JOIN books b ON o.book_id = b.id
";
if ($start_date && $end_date) {
    $query .= " WHERE o.created_at BETWEEN ? AND ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $start_date, $end_date);
    $stmt->execute();
    $orders = $stmt->get_result();
} else {
    $orders = $conn->query($query);
}


$stats_query = "SELECT 
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_books,
    SUM(CASE WHEN status='Pending' THEN 1 ELSE 0 END) AS pending,
    SUM(CASE WHEN status='Processed' THEN 1 ELSE 0 END) AS processed,
    SUM(CASE WHEN status='Ready for Pickup' THEN 1 ELSE 0 END) AS ready,
    SUM(CASE WHEN status='Delivered' THEN 1 ELSE 0 END) AS delivered
    FROM orders";
$stats_result = $conn->query($stats_query);
$stats = $stats_result->fetch_assoc();

$pickup_query = "SELECT CONCAT(pickup_day,' ',pickup_time) AS slot, COUNT(*) AS count FROM orders GROUP BY slot";
$pickup_result = $conn->query($pickup_query);


$status_chart_labels = ['Pending', 'Processed', 'Ready for Pickup', 'Delivered'];
$status_chart_data = [
    intval($stats['pending']),
    intval($stats['processed']),
    intval($stats['ready']),
    intval($stats['delivered'])
];

$pickup_chart_labels = [];
$pickup_chart_data = [];
while($slot = $pickup_result->fetch_assoc()) {
    $pickup_chart_labels[] = $slot['slot'] ?: 'Not Picked';
    $pickup_chart_data[] = intval($slot['count']);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Orders Report | Admin Dashboard</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
body { font-family: "Segoe UI", sans-serif; margin:0; background:#f5f7fa; color:#222; }
header { background:#0f580f; color:white; padding:1rem; display:flex; justify-content:space-between; align-items:center; }
header h1 { margin:0; font-size:1.5rem; }
header a.back { background: rgba(255,255,255,0.15); color:white; text-decoration:none; padding:6px 12px; border-radius:6px; }
header a.back:hover { background: rgba(255,255,255,0.25); }

.container { padding: 1rem 1.5rem; }
.summary { display:flex; gap:1rem; flex-wrap:wrap; margin-bottom:1rem; }
.summary div { background:white; padding:12px 15px; border-radius:10px; flex:1; min-width:140px; text-align:center; box-shadow:0 4px 10px rgba(0,0,0,0.05); }
.summary div h2 { margin:0; color:#0f580f; font-size:1.5rem; }
.summary div p { margin:0; font-size:0.9rem; color:#555; }

.filter-form { margin-bottom: 1rem; display:flex; gap:10px; flex-wrap:wrap; align-items:center; }
.filter-form input { padding:6px; border-radius:6px; border:1px solid #ccc; }
.filter-form button { padding:6px 12px; border-radius:6px; border:none; background:#0f580f; color:white; cursor:pointer; }
.filter-form button:hover { background:#084308; }
.export-btn { padding:6px 12px; border-radius:6px; background:#006400; color:white; text-decoration:none; margin-left:10px; }
.export-btn:hover { background:#004d00; }

table { width:100%; border-collapse:collapse; background:white; border-radius:10px; overflow:hidden; box-shadow:0 4px 10px rgba(0,0,0,0.05); margin-top:1rem; }
th, td { padding:10px; text-align:left; border-bottom:1px solid #ddd; font-size:0.9rem; }
th { background:#0f580f; color:white; }
tr:hover { background:#f1f1f1; }

.charts { display:flex; gap:1rem; flex-wrap:wrap; margin-bottom:1rem; }
.charts canvas { background:white; border-radius:10px; padding:10px; box-shadow:0 4px 10px rgba(0,0,0,0.05); flex:1; min-width:280px; }
</style>
</head>
<body>

<header>
    <h1>Orders Report</h1>
    <a href="dashboard.php" class="back">← Back</a>
</header>

<div class="container">
    <div class="summary">
        <div><h2><?= $stats['total_orders'] ?></h2><p>Total Orders</p></div>
        <div><h2><?= $stats['total_books'] ?></h2><p>Total Books Sold</p></div>
        <div><h2><?= $stats['pending'] ?></h2><p>Pending</p></div>
        <div><h2><?= $stats['processed'] ?></h2><p>Processed</p></div>
        <div><h2><?= $stats['ready'] ?></h2><p>Ready for Pickup</p></div>
        <div><h2><?= $stats['delivered'] ?></h2><p>Delivered</p></div>
    </div>

    <div class="charts">
        <canvas id="statusChart"></canvas>
        <canvas id="pickupChart"></canvas>
    </div>
    <form method="GET" class="filter-form">
        <label>Start Date: <input type="date" name="start_date" value="<?= htmlspecialchars($start_date) ?>"></label>
        <label>End Date: <input type="date" name="end_date" value="<?= htmlspecialchars($end_date) ?>"></label>
        <button type="submit">Filter</button>
        <a href="?export=csv&start_date=<?= htmlspecialchars($start_date) ?>&end_date=<?= htmlspecialchars($end_date) ?>" class="export-btn">Export Filtered CSV</a>
        <a href="?export=all" class="export-btn">Export All Orders</a>
    </form>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Student</th>
                <th>Matric</th>
                <th>Book</th>
                <th>Qty</th>
                <th>Status</th>
                <th>Pickup Day</th>
                <th>Pickup Time</th>
                <th>Ordered On</th>
            </tr>
        </thead>
        <tbody>
            <?php if($orders->num_rows > 0): ?>
                <?php while($row = $orders->fetch_assoc()): ?>
                    <tr>
                        <td><?= $row['id'] ?></td>
                        <td><?= htmlspecialchars($row['student_name']) ?></td>
                        <td><?= htmlspecialchars($row['matric_number']) ?></td>
                        <td><?= htmlspecialchars($row['book_title']) ?></td>
                        <td><?= $row['quantity'] ?></td>
                        <td><?= htmlspecialchars($row['status']) ?></td>
                        <td><?= $row['pickup_day'] ?? 'Not Picked' ?></td>
                        <td><?= $row['pickup_time'] ?? 'Not Picked' ?></td>
                        <td><?= $row['created_at'] ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="9" style="text-align:center;">No orders found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

</div>

<script>

const ctxStatus = document.getElementById('statusChart').getContext('2d');
new Chart(ctxStatus, {
    type: 'bar',
    data: {
        labels: <?= json_encode($status_chart_labels) ?>,
        datasets: [{
            label: 'Orders by Status',
            data: <?= json_encode($status_chart_data) ?>,
            backgroundColor: ['#ffcd56','#36a2eb','#ff6384','#4bc0c0']
        }]
    },
    options: { responsive:true, plugins: { legend: { display:false } } }
});

const ctxPickup = document.getElementById('pickupChart').getContext('2d');
new Chart(ctxPickup, {
    type: 'pie',
    data: {
        labels: <?= json_encode($pickup_chart_labels) ?>,
        datasets: [{
            label: 'Orders per Pickup Slot',
            data: <?= json_encode($pickup_chart_data) ?>,
            backgroundColor: ['#FF6384','#36A2EB','#FFCE56','#4BC0C0','#9966FF','#FF9F40']
        }]
    },
    options: { responsive:true }
});
</script>

</body>
</html>
