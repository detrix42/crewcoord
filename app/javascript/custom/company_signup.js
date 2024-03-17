
// app/javascript/packs/company_signup.js

// Wait for the DOM to be fully loaded before running the script
document.addEventListener('DOMContentLoaded', function() {
  // Get the form by its id
  let form = document.getElementById('companySignupForm');

  // Function to handle form on submit
  form.onsubmit = function(e) {
    // Prevent the form from submitting
    e.preventDefault();

    // Validate the form
    if(validateForm()) {
      // If the form is valid, you can submit it
      form.submit();
    }
  };

  // Function to validate the form
  function validateForm() {
    // Assume the form is valid
    let isValid = true;

    // Get the input fields
    let nameInput = document.getElementById('name');
    let emailInput = document.getElementById('email');

    // Check if name is empty
    if(nameInput.value == '') {
      alert('Name is required.');
      isValid = false;
    }

    // Check if email is empty
    if(emailInput.value == '') {
      alert('Email is required.');
      isValid = false;
      // Check if email pattern is correct
    } else if(!/^\S+@\S+\.\S+$/.test(emailInput.value)) {
      alert('Email format is wrong.');
      isValid = false;
    }

    // Return whether the form is valid or not
    return isValid;
  }
});
