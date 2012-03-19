{Commander} = require_root('app/commander')

describe Commander, ->
  beforeEach ->
    @commander = new Commander

  it 'processes message command', ->
    notified = false
    @commander.on 'message', (message) ->
      notified = message
    @commander.process('hey there tom')
    waitsFor -> notified == 'hey there tom'

  it 'processes a username command', ->
    notified = false
    @commander.on 'username', (username) ->
      notified = username
    @commander.process('/name Sean')
    waitsFor -> notified == 'Sean'


