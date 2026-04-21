<?php
session_start();
include('../php/db_connect.php');

if (!isset($_SESSION['matric'])) {
    header("Location: ../html/login.html");
    exit();
}

$name = $_SESSION['name'];
$level = $_SESSION['level'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard - FUTO Bookshop</title>
  <link rel="stylesheet" href="../css/dashboard.css">
  <script defer src="../js/dashboard.js"></script>
</head>
<body>
  <header>
  <nav class="navbar">
    <div class="left-section">
      <img src="../assets/logo.png" alt="FUTO Logo" class="futo-logo">
      <h1>Welcome, <?php echo htmlspecialchars($name); ?> 👋</h1>
    </div>
    <div class="right-section">
    <a href="../php/cart.php" class="cart-icon">
  🛒
  <?php if (!empty($_SESSION['cart'])): ?>
    <span class="cart-count"><?php echo count($_SESSION['cart']); ?></span>
  <?php endif; ?>
</a>

      <form action="../php/logout.php" method="POST">
        <button class="logout-btn" type="submit">Logout</button>
      </form>
    </div>
  </nav>
</header>


  <div class="container">
    <h2>Your Recommended Books</h2>
    <p>Level: <?php echo htmlspecialchars($level); ?></p>
    <div style="margin-top: 25px; text-align: center;">
  <a href="../php/myorders.php"
     style="background-color: #0b6623; color: white; padding: 8px 16px; border-radius: 6px;
            text-decoration: none; font-weight: 500; letter-spacing: 0.3px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.15);
            transition: all 0.3s ease;"
     onmouseover="this.style.backgroundColor='#004d00'; this.style.boxShadow='0 3px 6px rgba(0,0,0,0.25)';"
     onmouseout="this.style.backgroundColor='#0b6623'; this.style.boxShadow='0 2px 4px rgba(0,0,0,0.15)';">
     View My Orders
  </a>
</div>
    <div class="semester-filter">
      <button class="semester-btn active" data-semester="HARMATTAN">HARMATTAN</button>
      <button class="semester-btn" data-semester="RAIN">RAIN</button>
    </div>

    <div class="book-list" id="bookList">
      <p>Loading books...</p>
    </div>
  </div>

  <footer>
    <p>© <?php echo date("Y"); ?> Federal University of Technology, Owerri. All rights reserved.</p>
  </footer>


  </script>
<div id="chatbot-icon">💬</div>
<div id="chatbot">
  <div id="chatbot-header">Chat with us</div>
  <div id="chatbot-body">
    <div id="chatbot-messages"></div>
    <input type="text" id="chatbot-input" placeholder="Ask a question...">
  </div>
</div>
<script>
const chatbotIcon = document.getElementById('chatbot-icon');
const chatbotWindow = document.getElementById('chatbot');
const chatbotInput = document.getElementById('chatbot-input');
const chatbotMessages = document.getElementById('chatbot-messages');
chatbotIcon.addEventListener('click', () => {
    chatbotWindow.style.display = chatbotWindow.style.display === 'flex' ? 'none' : 'flex';
});
document.addEventListener('click', function(e){
    if(!chatbotWindow.contains(e.target) && !chatbotIcon.contains(e.target)){
        chatbotWindow.style.display = 'none';
    }
});
const faqBot = {
  "hello": "Hello! How can I assist you today?",
  "hi": "Hi there! How can I help you?",
  "hey": "Hey! What can I do for you?",
  "good morning": "Good morning! How can I help you?",
  "good afternoon": "Good afternoon! How can I help you?",
  "good evening": "Good evening! How can I help you?",
  "i need assistance": "Sure! Could you tell me what kind of help you need?",
  "help": "I’m here to help! Please tell me your issue.",
  "can you help me": "Defintely! What do you need assistance with?",
  "support": "You can contact us via the Contact Us form or ask me here.",
  "how can i order": "You can order textbooks by visiting the 'Available Books' section.",
  "track my order": "Go to 'My Orders' and select the order to track delivery.",
  "my order is late": "Please check your order status in 'My Orders'. If there's an issue, submit a complaint via <a href='contact.html'>Contact Us</a>.",
  "cancel order": "Orders can be canceled before processing. Visit 'My Orders' to cancel.",
  "change order": "You can modify your order via 'My Orders' if it hasn’t been processed yet.",
  "schedule pickup": "You can schedule a pickup via 'My Schedule' in your dashboard.",
  "change pickup slot": "Go to 'My Schedule' to modify your pickup slot.",
  "missed pickup": "Please contact us via <a href='contact.html'>Contact Us</a> to reschedule.",
  "payment issues": "For payment issues, contact us using the Contact Us form.",
  "checkout": "Go to your cart and click 'Checkout'. Follow the payment instructions.",
  "add to cart": "Select a book and click 'Add to Cart'. Then proceed to checkout.",
  "cannot pay": "Please ensure your payment details are correct or contact support.",
   "i forgot my password": "Click 'Forgot Password' on the login page to reset your password.",
  "how to login": "Use your student credentials on the login page.",
  "cannot login": "Ensure your username and password are correct. If issues persist, contact support.",
  "change password": "Go to Settings in your dashboard to change your password.",
  "books available": "Check 'Available Books' for the latest textbooks and manuals.",
  "lost book": "Please report lost textbooks using the <a href='contact.html'>Contact Us</a> form.",
  "not delivered": "If your order hasn’t arrived, submit a complaint via <a href='contact.html'>Contact Us</a>.",
  "which books do you have": "We have textbooks, manuals, and reference materials for all FUTO courses.",
  "when do you open": "We are open Monday-Friday, 9 AM - 2 PM.",
   "when can i come": "We are open Monday-Friday, 9 AM - 2 PM, check your chosen pickup time to come, we are expecting you.",
  "are you open on weekends": "No, we are only open Monday to Friday.",
  "location": "We are located on campus near the FUTO library.",
  "contact": "Please <a href='contact.html'>Contact Us</a> if you need further help.",
   "okay": "goodbye thank you",
  "thank you": "You’re welcome!",
  "thanks": "Anytime! Let me know if you need more help.",
  "who are you": "I am your FUTO Bookshop assistant bot. I can answer FAQs and guide you.",
  "other": "I’m not sure about that. Please <a href='contact.html'>Contact Us</a> for assistance.",\\
  "do you deliver": "Yes! We deliver textbooks on campus. Check your order status for delivery updates.",
  "how long delivery": "Delivery usually takes 1-2 business days on campus.",
  "can i preorder": "Yes, you can preorder upcoming textbooks in 'Available Books'.",
  "bulk order": "For bulk orders, please contact us via <a href='contact.html'>Contact Us</a>.",
  "lost my order id": "Check your email for order confirmation or contact us via the Contact form.",
  "student support": "You can reach student support via <a href='contact.html'>Contact Us</a>.",
  "technical issue": "Please describe the issue and contact us if it persists.",
  "website issue": "If something isn’t loading, try refreshing or contact support.",
  "book not available": "Check back later or submit a request via <a href='contact.html'>Contact Us</a>.",
  "schedule conflict": "You can modify your pickup in 'My Schedule' or contact support.",
  "lost credentials": "Use 'Forgot Password' to reset your login information.",
  "change email": "Go to Settings to update your email address.",
  "payment confirmation": "You should receive an email confirmation after payment.",
  "I have a problem": "Contact support for issues.",
   "So how do i contact support": "Submit a request via <a href='contact.html'>Contact Us</a>.",
  "update profile": "Go to Settings in your dashboard to update your profile.",
  "feedback": "We’d love to hear your feedback! Submit via <a href='contact.html'>Contact Us</a>.",
  "report problem": "Please use the Contact Us form to report any problems.",
  "other issues": "For anything else, contact us via <a href='contact.html'>Contact Us</a>.",
};

chatbotInput.addEventListener('keypress', function(e){
    if(e.key === 'Enter'){
        const msg = chatbotInput.value.trim();
        if(msg === '') return;

        const userDiv = document.createElement('div');
        userDiv.className = 'user-msg';
        userDiv.innerHTML = msg;
        chatbotMessages.appendChild(userDiv);

        const lowerMsg = msg.toLowerCase();
        const botReply = faqBot[lowerMsg] || faqBot['other'];

        const botDiv = document.createElement('div');
        botDiv.className = 'bot-msg';
        botDiv.innerHTML = botReply;
        chatbotMessages.appendChild(botDiv);

        chatbotMessages.scrollTop = chatbotMessages.scrollHeight;
        chatbotInput.value = '';
    }
});
</script>

</body>
</html>
