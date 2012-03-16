{User} = require_root('server/user.coffee')

describe User, ->
  it 'validates a username and password', ->
    user = new User
    user.name = 'pickles'
    user.password = '123password'
    success = user.validate()
    expect(success).toBe(true)

