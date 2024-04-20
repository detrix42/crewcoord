console.log('crewmember.js loaded')

// window.crewcoord set in application.js

// if(!localStorage.getItem('signup_validation_ready')){
//   console.log('check1')
//   localStorage.setItem('signup_validation_ready', 'false')
// }



// setTimeout(() => init_inputfields(), 500)
// init_inputfields()

function init_inputfields() {
  console.log('attaching validation check on input fields')
  if(window.crewcoord.signup_validation_ready === false) {
    const req_signup_field = $('.required_signup_field')
    req_signup_field.on('blur', function(e) {
      e.preventDefault()
      validate_input(this);
    })
    req_signup_field.on('keyup', function(e) {
      validateForm()
    })
    window.crewcoord.signup_validation_ready = true
  }


}



//Function to handle form on submit
$('#crew-member-signup-form').on('submit', function(e) {
  // Prevent the form from submitting
  // e.preventDefault()

  // Validate the form
  if(validateForm()) {

    console.log("setting validation ready to false");
    // localStorage.setItem('signup_validation_ready', 'false')
    window.crewcoord.signup_validation_ready = false

    // If the form is valid, you can submit it
    this.submit();
  }

})

function validate_input(target) {
  console.log('validating input')
  if(target.value.trim() === '') {
    $(target).addClass('need-required')
  } else {
    $(target).removeClass('need-required')
  }

}
// Function to validate the form
function validateForm() {
  console.log('validating form')
  const newManagerSubmitBtn = $('#form-submit-button')

  // Assume the form is valid
  let isValid = true;

  // Get the input fields
  const req_signup_field = $('.required_signup_field')

  for (const field of req_signup_field) {
    if ($(field).val() === '')
      isValid = false
  }

  const $pass2 = $('#crew_member_password_confirmation')

  const pass1v = $('#crew_member_password').val()
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
    newManagerSubmitBtn.removeAttr('disabled')
  else
    newManagerSubmitBtn.prop('disabled', true)

  return isValid;
}

