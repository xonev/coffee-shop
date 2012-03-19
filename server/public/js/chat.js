(function() {
  var initialize, socket;

  initialize = function() {
    return $('#command').on('keyup', function(event) {
      var $this;
      if (event.keyCode !== 13) return;
      $this = $(this);
      socket.emit('command', $this.val());
      return $this.val('');
    });
  };

  socket = io.connect('http://localhost:1337');

  socket.on('add_user', function(user) {
    var $user;
    $user = $('<div />');
    $user.attr('id', user);
    $user.html(user);
    return $('#users').append($user);
  });

  socket.on('remove_user', function(user) {
    console.log('removing user: ' + user);
    return $('#users #' + user).remove();
  });

  socket.on('add_message', function(message) {
    var $msg;
    $msg = $('<div />');
    $msg.html(message);
    return $('#messages').append($msg);
  });

  $(function() {
    return initialize();
  });

}).call(this);
