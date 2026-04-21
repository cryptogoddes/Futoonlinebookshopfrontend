document.addEventListener("DOMContentLoaded", () => {
  const semesterButtons = document.querySelectorAll(".semester-btn");
  const bookList = document.getElementById("bookList");
  const level = document.querySelector("p").textContent.replace("Level: ", "");
  const cartCount = document.querySelector(".cart-count");

  function loadBooks(semester) {
    bookList.innerHTML = "<p>Loading books...</p>";
    fetch(`../php/fetchbooks.php?level=${encodeURIComponent(level)}&semester=${encodeURIComponent(semester)}`)
      .then(res => res.text())
      .then(data => {
        bookList.innerHTML = data;
        attachCartButtons();
        attachBuyNowButtons();
        animateBookCards();
      })
      .catch(() => bookList.innerHTML = "<p>Error loading books.</p>");
  }

  function attachCartButtons() {
    document.querySelectorAll(".add-cart-btn").forEach(button => {
      button.addEventListener("click", () => {
        const bookId = button.dataset.bookId;
        fetch("../php/add_to_cart.php", {
          method: "POST",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: `book_id=${bookId}`
        })
        .then(res => res.json())
        .then(data => {
          if (data.status === "success" || data.success) {
            let cartSpan = document.querySelector(".cart-count");
            const cartIcon = document.querySelector(".cart-icon");
            if (!cartSpan) {
              cartSpan = document.createElement("span");
              cartSpan.classList.add("cart-count");
              cartIcon.appendChild(cartSpan);
            }
            cartSpan.textContent = data.cart_count;
            cartIcon.classList.add("update");
            setTimeout(() => cartIcon.classList.remove("update"), 300);
          } 
          else if (data.status === "already_bought") {
            showPurchasePopup();
          } 
          else {
            console.log("Add to cart failed:", data.message);
          }
        })
        .catch(() => console.log("Add to cart failed"));
      });
    });
  }

  function attachBuyNowButtons() {
    document.querySelectorAll(".buy-btn").forEach(button => {
      button.addEventListener("click", () => {
        const bookId = button.dataset.bookId;
        const price = button.dataset.price;

        fetch("../php/set_single_purchase.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ book_id: bookId, price: price })
        })
        .then(res => res.json())
        .then(data => {
          if (data.success) {
            window.location.href = data.redirect;
          } else {
            alert("Error: " + data.message);
          }
        })
        .catch(() => alert("Failed to start Buy Now payment."));
      });
    });
  }

  function attachCartDelete() {
    document.querySelectorAll(".delete-cart-item").forEach(btn => {
      btn.addEventListener("click", () => {
        const bookId = btn.dataset.bookId;
        fetch(`../php/remove_from_cart.php`, {
          method: "POST",
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: `book_id=${bookId}`
        })
        .then(res => res.json())
        .then(data => {
          if(data.success){
            btn.parentElement.remove(); 
            const cartSpan = document.querySelector(".cart-count");
            cartSpan.textContent = data.cart_count;
          }
        });
      });
    });
  }

  document.getElementById("checkout-btn")?.addEventListener("click", () => {
    window.location.href = "../php/paystack_payment.php?cart=1";
  });

  function animateBookCards() {
    const bookCards = document.querySelectorAll(".book-card");
    bookCards.forEach((card, i) => {
      card.style.opacity = 0;
      card.style.transform = "translateY(20px)";
      setTimeout(() => {
        card.style.transition = "opacity 0.6s ease, transform 0.3s ease";
        card.style.opacity = 1;
        card.style.transform = "translateY(0)";
      }, i * 100);
    });
  }

  semesterButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      semesterButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      loadBooks(btn.dataset.semester);
    });
  });

  loadBooks("HARMATTAN");

  // ========= CUSTOM POPUP HANDLER =========

  function showPurchasePopup() {
    let modal = document.getElementById("purchaseModal");
    if (!modal) {
      modal = document.createElement("div");
      modal.id = "purchaseModal";
      modal.innerHTML = `
        <div style="
          position:fixed;top:0;left:0;width:100%;height:100%;
          background:rgba(0,0,0,0.6);display:flex;
          justify-content:center;align-items:center;
          z-index:9999;
        ">
          <div style="
            background:#fff;border-radius:15px;padding:30px;
            max-width:400px;text-align:center;
            box-shadow:0 4px 10px rgba(0,0,0,0.2);color:#222;
          ">
            <h3 style="color:#0b6623;">This Book Has Been Purchased Before</h3>
            <p style="margin-top:10px;">Missed Pickup? You can reschedule or contact us for any issues.</p>
            <div style="margin-top:20px;">
              <button onclick="location.href='../php/reschedule_pickup.php'" style="
                background:#0b6623;color:white;border:none;
                padding:10px 20px;border-radius:8px;cursor:pointer;
                margin-right:8px;
              ">Reschedule Here</button>
              <button onclick="location.href='../html/contact.html'" style="
                background:#555;color:white;border:none;
                padding:10px 20px;border-radius:8px;cursor:pointer;
              ">Contact Us</button>
            </div>
            <p style="margin-top:20px;cursor:pointer;color:#999;" id="closeModal">Close</p>
          </div>
        </div>
      `;
      document.body.appendChild(modal);
      document.getElementById("closeModal").addEventListener("click", () => {
        document.getElementById("purchaseModal").remove();
      });
    }
  }
});
if (data.status === "penalty_due") {
    Swal.fire({
        icon: "warning",
        title: "Penalty Due",
        html: `
            <p>${data.message}</p>
            <button id="payPenaltyBtn" class="swal2-confirm swal2-styled">Pay Penalty Here</button>
        `,
        showConfirmButton: false
    });

    document.addEventListener("click", function(e) {
        if (e.target && e.target.id === "payPenaltyBtn") {
            window.location.href = "pay_penalty.php?order_id=" + data.order_id;
        }
    });
}
