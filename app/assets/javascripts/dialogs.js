function hideDialog() {
  $('#overlay').fadeOut('fast');
}

function showDialog() {
  $('#overlay').fadeIn('fast');
}

// Close the dialog if they click on the background.
$(document).on('click', '#overlay', function(e) {
  hideDialog();
});
// But do not close it they click in the dialog itself.
$(document).on('click', '#dialog', function(e) {
  e.stopPropagation();
});
