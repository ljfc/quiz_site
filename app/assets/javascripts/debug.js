// This activates the CSS debug mode.
function debugCSS() {
  $('html').toggleClass('debug-css');
}

// For now, we always want to debug.
$(document).ready(function() {
  debugCSS();
});
