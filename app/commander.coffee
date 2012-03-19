{EventEmitter} = require('events')

class Commander extends EventEmitter
  @toString: -> 'Commander'
  
  process: (input) ->
    if input[0] == '/'
      @slashCommand(input)
    else
      @message(input)

  message: (message) ->
    @emit('message', message)

  slashCommand: (input) ->
    input = input.substring(1)
    parts = input.split(' ')
    command = parts.splice(0, 1)
    args = parts

    commandName = command + 'Command'
    commandFunc = this[commandName]
    if commandFunc?
      commandFunc.apply(this, args)

  nameCommand: (username) ->
    @emit('username', username)


exports.Commander = Commander
