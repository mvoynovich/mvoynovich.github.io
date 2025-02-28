document.addEventListener("DOMContentLoaded", function () {
  document.querySelector(".contact-form").addEventListener("submit", async function (event) {
      event.preventDefault(); // Prevent default form submission

      // Capture form data
      const name = document.getElementById("name").value.trim();
      const email = document.getElementById("email").value.trim();
      const message = document.getElementById("message").value.trim();

      if (!name || !email || !message) {
          alert("Please fill out all fields.");
          return;
      }

      const formData = { name, email, message };

      try {
          const response = await fetch("https://script.google.com/macros/s/AKfycbwV0qWcMmR5HZbHNsydumKg_kX0-gu_tzQ51D3_mngXtdL8H28eFjv9zlt101xa6Ipm0g/exec", {
              method: "POST",
              headers: {
                  "Content-Type": "application/json"
              },
              body: JSON.stringify(formData)
          });

          const result = await response.json();

          if (result.status === "success") {
              alert("Message sent successfully!");
              document.querySelector(".contact-form").reset();
          } else {
              alert("Error sending message. Please try again.");
          }
      } catch (error) {
          console.error("Error:", error);
          alert("Failed to send message.");
      }
  });
});
