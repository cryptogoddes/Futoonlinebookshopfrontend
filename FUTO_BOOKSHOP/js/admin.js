const menuToggle = document.getElementById("menu-toggle");
const sidebar = document.querySelector(".sidebar");
menuToggle.addEventListener("click", () => sidebar.classList.toggle("active"));

const profile = document.querySelector(".profile");
const dropdown = document.querySelector(".profile .dropdown");
function closeDropdown() {
    profile.classList.remove("active");
    profile.setAttribute("aria-expanded", "false");
}
profile.addEventListener("click", e => {
    e.stopPropagation();
    const isOpen = profile.classList.toggle("active");
    profile.setAttribute("aria-expanded", isOpen ? "true" : "false");
});
document.addEventListener("click", e => { if (!profile.contains(e.target)) closeDropdown(); });
document.addEventListener("keydown", e => { if (e.key==="Escape") closeDropdown(); });

// animate counters function
function animateCounter(counter, target) {
    let value = +counter.textContent.replace(/,/g, "");
    const increment = Math.max(1, Math.floor(target / 120));
    if (value < target) {
        const next = Math.min(target, value + increment);
        counter.textContent = next.toLocaleString();
        requestAnimationFrame(() => animateCounter(counter, target));
    } else {
        counter.textContent = target.toLocaleString();
    }
}

// initialize chart
const ctx = document.getElementById("ordersChart").getContext("2d");
window.ordersChart = new Chart(ctx, {
    type: "line",
    data: { labels: [], datasets: [{ label: "Orders", data: [], backgroundColor: "rgba(15,88,15,0.2)", borderColor: "#0f580f", borderWidth: 2, fill: true, tension: 0.35, pointRadius: 3 }] },
    options: { responsive:true, maintainAspectRatio:false, plugins:{ legend:{ display:true } }, scales:{ x:{ grid:{ display:false } }, y:{ grid:{ color:"rgba(0,0,0,0.06)" } } } }
});

// fetch dashboard data
function fetchDashboardData() {
    fetch("../../php/adminphp/dashboard_data.php")
        .then(res => res.json())
        .then(data => {
            // update counters with animation
            document.querySelectorAll(".counter").forEach(counter => {
                const key = counter.getAttribute("data-key");
                if(data[key] !== undefined){
                    animateCounter(counter, data[key]);
                }
            });
            // update chart
            if(window.ordersChart){
                window.ordersChart.data.labels = data.labels;
                window.ordersChart.data.datasets[0].data = data.orders_week;
                window.ordersChart.update();
            }
        })
        .catch(err => console.error("Error fetching dashboard data:", err));
}

// fetch immediately and every 5 seconds
fetchDashboardData();
setInterval(fetchDashboardData, 5000);