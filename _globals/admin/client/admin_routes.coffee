IsAdmin.route '/',
  name: 'admin'
  action: ->
    BlazeLayout.render('layout',{ content:'admin'})

#USERS
IsAdmin.route '/users',
  name: 'users'
  subscriptions: (params) ->
    @.register('users', Meteor.subscribe('adminUsers'))
  action: ->
    BlazeLayout.render('layout',{ content:'users'})

IsAdmin.route '/users/:userId/edit',
  name: 'edituser'
  subscriptions: (params) ->
    @.register('currentUser', Meteor.subscribe('adminUser', params.userId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'edituser'})

IsAdmin.route '/users/:userId/delete',
  name: 'deleteuser'
  subscriptions: (params) ->
    @.register('currentUser', Meteor.subscribe('adminUser', params.userId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deleteuser'})

#FILES
IsAdmin.route '/files',
  name: 'files'
  subscriptions: (params) ->
    @.register('files', Meteor.subscribe('adminFiles'))
  action: ->
    BlazeLayout.render('layout',{ content:'files'})
