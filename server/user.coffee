class User
  constructor: (@name, @password) ->
  validate: ->
    true
  @toString: ->
    'User'

exports.User = User
