import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#messages').append(data['message']);
    $('#message_content').val('');
    scrollToBottom();
    return
    // Called when there's incoming data on the websocket for this channel
  }

});

$('#send').keypress(function(e){
  if(e.which == 13){
    $(this).closed('form').submit();
  }
});


var scrollToBottom = function() {
    if ($('#messages').length > 0) {
      const last_message = $('#messages')[0];
      last_message.scrollTop = last_message.scrollHeight - (last_message.clientHeight);
      return;
    }
  };

  jQuery(document).on('turbolinks:load', function() {
  scrollToBottom();
  });


// $(".scroll").scrollTop($(".scroll")[0].scrollHeight);
