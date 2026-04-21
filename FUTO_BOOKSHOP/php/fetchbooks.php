<?php
session_start();
include("db_connect.php");

if (!isset($_SESSION['matric']) || !isset($_SESSION['name'])) {
    echo "<p>Session expired. Please <a href='../html/login.html'>log in again</a>.</p>";
    exit;
}

$name = trim($_SESSION['name']);
$matric = trim($_SESSION['matric']);
$level = isset($_GET['level']) ? strtoupper(trim($_GET['level'])) : '';
$semester = isset($_GET['semester']) ? strtoupper(trim($_GET['semester'])) : '';

if (empty($level) || empty($semester)) {
    echo "<p>Invalid request. Please select a level and semester again.</p>";
    exit;
}

$sql = "SELECT * FROM books WHERE level = ? AND semester = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $level, $semester);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($book = $result->fetch_assoc()) {
        echo '
        <div class="book-card">
            <h3>' . htmlspecialchars($book['title']) . '</h3>
            <p><strong>Author:</strong> ' . htmlspecialchars($book['author']) . '</p>
            <p><strong>Price:</strong> ₦' . number_format($book['price'], 2) . '</p>
            <button class="add-cart-btn" data-book-id="' . intval($book['id']) . '">Add to Cart</button>
        </div>';
    }
} else {
    echo "<p>No books found for $semester semester at $level level.</p>";
}

$stmt->close();
$conn->close();
?>

<script>
function showPopup(message, success) {
  const popup = document.createElement('div');
  popup.className = 'custom-popup';
  popup.style.position = 'fixed';
  popup.style.top = '40%';
  popup.style.left = '50%';
  popup.style.transform = 'translate(-50%, -50%)';
  popup.style.background = success ? '#00754a' : '#b30000';
  popup.style.color = '#fff';
  popup.style.padding = '20px 30px';
  popup.style.borderRadius = '12px';
  popup.style.fontSize = '16px';
  popup.style.boxShadow = '0 3px 10px rgba(0,0,0,0.3)';
  popup.style.zIndex = '9999';
  popup.innerHTML = `
    <p>${message}</p>
    ${!success ? `
      <div style="margin-top:10px;">
        <button id="rescheduleBtn" style="margin-right:10px;padding:6px 12px;background:#fff;color:#b30000;border:none;border-radius:8px;cursor:pointer;">Missed Pickup? Reschedule</button>
        <button id="contactBtn" style="padding:6px 12px;background:#fff;color:#b30000;border:none;border-radius:8px;cursor:pointer;">Contact Us</button>
      </div>` : ''}
  `;
  document.body.appendChild(popup);

  if (!success) {
    document.getElementById('rescheduleBtn').onclick = () => {
      window.location.href = '../php/penalty_payment.php';
    };
    document.getElementById('contactBtn').onclick = () => {
      window.location.href = '../html/contact.html';
    };
  }

  setTimeout(() => popup.remove(), 4000);
}

document.querySelectorAll('.add-cart-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const bookId = btn.getAttribute('data-book-id');
    fetch('../add_to_cart.php', {
      method: 'POST',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: 'book_id=' + bookId
    })
    .then(res => res.json())
   .then(data => {
  const countElement = document.querySelector('.cart-count');
  if (data.success) {
    if (countElement) countElement.textContent = data.cart_count;
    else {
      const cartIcon = document.querySelector('.cart-icon');
      if (cartIcon) {
        const span = document.createElement('span');
        span.classList.add('cart-count');
        span.textContent = data.cart_count;
        cartIcon.appendChild(span);
      }
    }
    showPopup(data.message, true);
  } else if (data.penalty) {
    showPopup('You missed your last pickup. Reschedule to continue.', false);
  } else if (data.duplicate) {
    showPopup('This book has been purchased previously.', false);
  } else {
    showPopup(data.message || 'Error adding to cart.', false);
  }
  })
})
});
</script>
