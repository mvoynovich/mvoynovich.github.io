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
        const response = await fetch("https://script.google.com/macros/s/AKfycbwskn2iY0-Fn8tCKnD1KujtoUutZ4D3X6D8f-cUcRgj4etofOOYwgpq-2_bIVzrnjUDPA/exec?name=" + encodeURIComponent(name) + "&email=" + encodeURIComponent(email) + "&message=" + encodeURIComponent(message), {
          method: "GET",
          mode: "cors"
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
