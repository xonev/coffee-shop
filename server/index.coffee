express = require('express')
{configure} = require('./config')
app = module.exports = express.createServer()
io = require('socket.io').listen(app, { log: false })

configure(express, app)

{UserList} = require('../app/user_list')
{Commander} = require('../app/commander')
{Messager} = require('../app/messager')

userList = new UserList
commander = new Commander
messager = new Messager

commander.on 'message', (message) ->
  messager.add(message)

guestCount = 1

io.sockets.on 'connection', (socket) ->
  userName = "guest_#{guestCount++}"
  userList.addUser(userName)

  socket.emit 'init',
    self: userName
    messages: messager.getMessages()
    users: userList.getUsers()

  userList.on 'add', (user) ->
    socket.emit('add_user', user)
  userList.on 'remove', (user) ->
    socket.emit('remove_user', user)
  messager.on 'add', (message) ->
    socket.emit('add_message', message)
  
  socket.on 'command', (command) ->
    commander.process(command, userName)

  socket.on 'disconnect', ->
    userList.removeUser(userName)

app.listen(1337)
console.log("Express server started on #{app.address().port}.")

