document.addEventListener('DOMContentLoaded', (event) => {
  const form = document.getElementById('contact-form');
  form.addEventListener('submit', async (e) => {
      e.preventDefault();

      const formData = new FormData(form);
      const data = {};
      formData.forEach((value, key) => {
          data[key] = value;
      });

      const response = await fetch('https://script.google.com/macros/s/AKfycbxd-TTsY6sFS04YaspTI_4k71Ja1ZA7g7hH1bVoh6JRWenf5IbDCsmIdAFVanejxB7Y/exec', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
          },
          body: JSON.stringify(data),
      });

      if (response.ok) {
          alert('Form submitted successfully!');
      } else {
          alert('Error submitting form');
      }
  });
});