{Messager} = require_root ('server/messager.coffee')

describe 'Messager', ->
  it 'adds and retrieves messages', ->
    message = 'hey there!'
    Messager.add(message)
    messages = Messager.messages()
    expect(messages[0]).toBe(message)

  it 'notifies listeners of new messages', ->
    message = 'hello sir!'
    notification = null
    Messager.on 'add', (eventMessage) ->
      notification = eventMessage
    Messager.add(message)
    waitsFor ->
      notification?


