$(document).ready(function() {
  $('.flash_message').delay(10000).slideUp(1000);
});

function flash_message(message, message_type) {
  $('<div class="flash_message message_'+message_type+'">'+message+'</div>')
    .appendTo('#flash_messages')
    .slideDown()
    .delay(10000)
    .slideUp(1000);
}

function flash_message_notice(message) {
  flash_message(message, 'notice');
}

function flash_message_alert(message) {
  flash_message(message, 'alert');
}
