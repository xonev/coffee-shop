initialize = ->
  $('#command').on 'keyup', (event) ->
    return if event.keyCode != 13
    $this = $(this)
    socket.emit('command', $this.val())
    $this.val('')

socket = io.connect('http://localhost:1337')

socket.on 'init_users', (users) ->
  for user in users
    addUser(user)

socket.on 'init_messages', (messages) ->
  for message in messages
    addMessage(message)

socket.on 'add_user', (user) ->
  addUser(user)

socket.on 'remove_user', (user) ->
  $('#users #'+user).remove()

socket.on 'add_message', (message) ->
  addMessage(message)

addUser = (user) ->
  $user = $('<div />')
  $user.attr('id', user)
  $user.html(user)
  $('#users').append($user)

addMessage = (message) ->
  $msg = $('<div />')
  $msg.html(message)
  $('#messages').append($msg)

$ -> initialize()
