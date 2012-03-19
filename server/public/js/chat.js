(function() {
  var addMessage, addUser, initialize, socket;

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

  socket.on('init_users', function(users) {
    var user, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = users.length; _i < _len; _i++) {
      user = users[_i];
      _results.push(addUser(user));
    }
    return _results;
  });

  socket.on('init_messages', function(messages) {
    var message, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = messages.length; _i < _len; _i++) {
      message = messages[_i];
      _results.push(addMessage(message));
    }
    return _results;
  });

  socket.on('add_user', function(user) {
    return addUser(user);
  });

  socket.on('remove_user', function(user) {
    return $('#users #' + user).remove();
  });

  socket.on('add_message', function(message) {
    return addMessage(message);
  });

  addUser = function(user) {
    var $user;
    $user = $('<div />');
    $user.attr('id', user);
    $user.html(user);
    return $('#users').append($user);
  };

  addMessage = function(message) {
    var $msg;
    $msg = $('<div />');
    $msg.html(message);
    return $('#messages').append($msg);
  };

  $(function() {
    return initialize();
  });

}).call(this);
