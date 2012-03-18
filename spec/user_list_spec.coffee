{UserList} = require_root 'server/user_list'

describe UserList, ->
  beforeEach ->
    @list = new UserList

  it 'adds a user and lists all users', ->
    @list.addUser('smassa')
    @list.addUser('guest 123')
    expect(@list.users).toContain('smassa', 'guest 123')

  it 'removes a user', ->
    @list.addUser('smassa')
    @list.addUser('guest 123')
    @list.removeUser('smassa')
    expect(@list.users.length).toBe(1)
    expect(@list.users).toContain('guest 123')

  it 'notifies listeners on add', ->
    notified = false
    @list.on 'add', ->
      notified = true
    @list.addUser('smassa')
    waitsFor -> notified

  it 'notifies listeners on remove', ->
    notified = false
    @list.on 'remove', ->
      notified = true
    @list.removeUser('smassa')
    waitsFor -> notified

