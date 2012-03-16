{EventEmitter} = require('events')

Messager = new EventEmitter

messages = []

Messager.add = (message) ->
  messages.push(message)
  @emit('add', message)

Messager.messages = ->
  messages

exports.Messager = Messager
