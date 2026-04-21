<?php
session_start();
if (!isset($_SESSION['matric'])) {
    header("Location: login.html");
    exit();
}

$cart = $_SESSION['cart'] ?? [];
$total = 0;
?>
<!DOCTYPE html>
<html>
<head>
  <title>Your Cart - FUTO Bookshop</title>
  <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
  <header>
    <nav class="navbar">
      <h1>Your Cart 🛒</h1>
      <form action="../php/logout.php" method="POST">
        <button class="logout-btn" type="submit">Logout</button>
      </form>
    </nav>
  </header>

  <div class="container">
    <?php if (empty($cart)) : ?>
      <p>Your cart is empty.</p>
      <a href="../php/dashboard.php">← Back to Books</a>
    <?php else : ?>
      <table border="1" width="100%" cellpadding="10">
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Price (₦)</th>
          <th>Quantity</th>
          <th>Subtotal (₦)</th>
        </tr>
        <?php foreach ($cart as $item): 
          $subtotal = $item['price'] * $item['quantity'];
          $total += $subtotal;
        ?>
        <tr>
          <td><?= htmlspecialchars($item['title']); ?></td>
          <td><?= htmlspecialchars($item['author']); ?></td>
          <td><?= number_format($item['price']); ?></td>
          <td><?= $item['quantity']; ?></td>
          <td><?= number_format($subtotal); ?></td>
        </tr>
        <?php endforeach; ?>
      </table>
      <h3>Total: ₦<?= number_format($total); ?></h3>

      <form action="../php/paystack_cart_payment.php" method="POST">
        <input type="hidden" name="amount" value="<?= $total; ?>">
        <button type="submit" class="buy-btn">Pay with Paystack</button>
      </form>
    <?php endif; ?>
  </div>
</body>
</html>
