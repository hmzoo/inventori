if Meteor.isServer

  Files.allow
      insert: (userId, file) ->
        file.metadata = file.metadata || {}
        file.metadata.owner = userId
      remove: (userId, file) ->
        (userId is file.metadata.owner) or Roles.userIsInRole(userId, [ 'admin' ])
      read: (userId, file) ->
        (userId is file.metadata.owner) or Roles.userIsInRole(userId, [ 'admin' ])
      write:(userId, file, fields) ->
        (userId is file.metadata.owner) or Roles.userIsInRole(userId, [ 'admin' ])
