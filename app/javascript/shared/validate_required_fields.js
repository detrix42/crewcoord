// console.log('validate_required_fields.js loaded')

// add event listeners (on blur and on keyup) to input fields of
// generic form; this function should be called from bottom html
// script section.
function init_inputfields() {
  console.log('init input fields')
  const req_signup_field$ = $('.required-signup-field')
  if(req_signup_field$.length > 0) {
    req_signup_field$.on('blur', function(e) {
      e.preventDefault()
      validate_input(this);
    })
    req_signup_field$.on('keyup', function(e) {
      validateForm()
    })
  }
}

// An input field with a class of 'need-required' if empty
// will get a red shadow around it.
function validate_input(target) {
  if(target.value.trim() === '') {
    $(target).addClass('need-required')
  } else {
    $(target).removeClass('need-required')
  }

}
// Function to validate the form
function validateForm() {
  console.log('validating form')
  const $ubmitBtn = $('#form-submit-button')

  // Assume the form is valid
  let isValid = true;

  // Get list input fields that require a value
  const req_signup_field$ = $('.required-signup-field')
  // check each one; must have a value
  for (const field of req_signup_field$) {
    if ($(field).val() === '')
      isValid = false
  }

  // get password inputs if there are any
  // Crew member signup form has password fields,
  // business creation form does not
  const $pass1 = $('#signup-password1')
  const $pass2 = $('#signup-password2')

  // business signup does not have password fields
  // do not need to validate them then.
  if ($pass1.length && $pass2.length) {
    const pass1v = $pass1.val()
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
  }

  if(isValid)
    $ubmitBtn.removeAttr('disabled')
  else
    $ubmitBtn.prop('disabled', true)
}

