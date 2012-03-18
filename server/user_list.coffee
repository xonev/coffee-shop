{EventEmitter} = require('events')

class UserList extends EventEmitter
  constructor: ->
    @users = []

  @toString: ->
    'UserList'

  addUser: (user) ->
    @users.push(user)
    @emit('add')

  removeUser: (targetUser) ->
    for user, index in @users
      if user == targetUser
        @users.splice(index, 1)
        break
    @emit('remove')

exports.UserList = UserList
