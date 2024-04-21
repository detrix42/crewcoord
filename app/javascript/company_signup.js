console.log('company_signup.js loaded')

// window.crewcoord set in application.js

// if(!localStorage.getItem('signup_validation_ready')){
//   console.log('check1')
//   localStorage.setItem('signup_validation_ready', 'false')
// }

init_inputfields()

function init_inputfields() {
  const req_signup_field = $('.required_signup_field')
  req_signup_field.on('blur', function(e) {
    e.preventDefault()
    validate_input(this);
  })
  req_signup_field.on('keyup', function(e) {
    validateForm()
  })
  // localStorage.setItem('signup_validation_ready', 'true')
  window.crewcoord.signup_validation_ready = true

}



//Function to handle form on submit
// $('#companySignupForm').on('submit', function(e) {
//   // Prevent the form from submitting
//   // e.preventDefault()
//
//   // Validate the form
//   if(validateForm()) {
//
//     console.log("setting validation ready to false");
//     // localStorage.setItem('signup_validation_ready', 'false')
//     window.crewcoord.signup_validation_ready = false
//
//     // If the form is valid, you can submit it
//     this.submit();
//   }
//
// })

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

  const $pass2 = $('#business_crew_member_attributes_password_confirmation')

  const pass1v = $('#business_crew_member_attributes_password').val()
  const pass2v = $pass2.val()

  if (pass1v !== pass2v)
    isValid = false

  // if pass1 and pass2 are equal length but not equal
  // display message above pass2 input box
  if((pass1v.length === pass2v.length) && (pass1v !== pass2v)) {
    $('#pass-do-not-match-txt').removeClass('displayOff')
    $pass2.addClass('pass-do-not-match-shadow')
  } else {
    $('#pass-do-not-match-txt').addClass('displayOff')
    $pass2.removeClass('pass-do-not-match-shadow')
  }

  if(isValid)
    newBusinessSubmitBtn.removeAttr('disabled')
  else
    newBusinessSubmitBtn.prop('disabled', true)

  return isValid;
}

