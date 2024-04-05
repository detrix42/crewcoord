// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// after debuging is done, use the following instead.
// will compile faster
//  require jquery3
//  require popper
//  require bootstrap

import "@hotwired/turbo-rails"
import "controllers"
import 'jquery'

window.crewcoord = {
  signup_validation_ready: false,
  signup_form_valid: false
}
