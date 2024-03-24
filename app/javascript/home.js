document.addEventListener('turbo:load', function() {
  console.log('home js dom loaded')
  $('.open-navpanel').on('click', open_nav_panel)
  $('.close-navpanel').on('click', close_nav_panel)

  function open_nav_panel() {
    console.log('Opening navigation panel')
    $('.nav-panel').addClass('nav-panel-open')

    $('.open-navpanel').addClass('displayOff')
  }


  function close_nav_panel() {
    console.log('closing navigation panel')
    $('.nav-panel').removeClass('nav-panel-open')
    $('.open-navpanel').removeClass('displayOff')
  }
})
