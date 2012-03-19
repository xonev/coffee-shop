initialize = ->
  $('#command').on 'keyup', (event) ->
    return if event.keyCode != 13
    $this = $(this)
    socket.emit('command', $this.val())
    $this.val('')

socket = io.connect('http://localhost:1337')

socket.on 'add_user', (user) ->
  $user = $('<div />')
  $user.attr('id', user)
  $user.html(user)
  $('#users').append($user)

socket.on 'remove_user', (user) ->
  console.log 'removing user: ' + user
  $('#users #'+user).remove()

socket.on 'add_message', (message) ->
  $msg = $('<div />')
  $msg.html(message)
  $('#messages').append($msg)

$ -> initialize()
