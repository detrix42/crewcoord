
// app/javascript/packs/company_signup.js

// Wait for the DOM to be fully loaded before running the script
document.addEventListener('DOMContentLoaded', function() {
  console.log('DOM Loaded.')
  window.crewcoord = {
    signup_form_valid: false
  }
  // Get the form by its id
  //let form = document.getElementById('companySignupForm');
  const req_signup_field = $('.required_signup_field')
  req_signup_field.on('blur', function(e) {
    e.preventDefault()
    validate_input(this);
  })
  req_signup_field.on('keyup', function(e) {
    validateForm()
  })


  // Function to handle form on submit
  // form.onsubmit = function(e) {
  //   // Prevent the form from submitting
  //   e.preventDefault();
  //
  //   // Validate the form
  //   if(validateForm()) {
  //     // If the form is valid, you can submit it
  //     form.submit();
  //   }
  // };

  function validate_input(target) {
    if(target.value.trim() === '') {
      $(target).addClass('need_required')
    } else {
      $(target).removeClass('need_required')
    }

  }
  // Function to validate the form
  function validateForm() {
    console.log('validating form')
    const newBusinessSubmitBtn = $('#new-business-submit-button')

    // Assume the form is valid
    let isValid = true;

    // Get the input fields
    const req_signup_field = $('.required_signup_field')

    for (const field of req_signup_field) {
      if ($(field).val() === '')
        isValid = false
    }

    const pass1 = $('#business_crew_member_attributes_password').val()
    const pass2 = $('#business_crew_member_attributes_password_confirmation').val()

    if (pass1 !== pass2)
      isValid = false

    if(isValid)
      newBusinessSubmitBtn.removeAttr('disabled')
    else
      newBusinessSubmitBtn.prop('disabled', true)
  }
});
