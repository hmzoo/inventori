#gizmoS
LoggedIn.route '/gizmos',
  name: 'gizmos'
  subscriptions: (params) ->
    @.register('gizmos', Meteor.subscribe('gizmos'))
  action: ->
    BlazeLayout.render('layout',{ content:'gizmos'})

LoggedIn.route '/gizmos/new',
  name: 'newgizmo'
  action: (params) ->
    BlazeLayout.render('layout',{ content:'newgizmo'})

LoggedIn.route '/gizmos/:gizmoId',
  name: 'gizmo'
  subscriptions: (params) ->
    @.register('currentGizmo', Meteor.subscribe('gizmo', params.gizmoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'gizmo'})

LoggedIn.route '/gizmos/:gizmoId/edit',
  name: 'editgizmo'
  subscriptions: (params) ->
    @.register('currentgizmo', Meteor.subscribe('gizmo', params.gizmoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'editgizmo'})

LoggedIn.route '/gizmos/:gizmoId/delete',
  name: 'deletegizmo'
  subscriptions: (params) ->
    @.register('currentgizmo', Meteor.subscribe('gizmo', params.gizmoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deletegizmo'})
    
    
LoggedIn.route '/import/gizmos',
  name: 'gizmos'
  subscriptions: (params) ->
    @.register('gizmos', Meteor.subscribe('gizmos'))
  action: ->
    BlazeLayout.render('layout',{ content:'gizmosimport'})
    
LoggedIn.route '/export/gizmos',
  name: 'gizmos'
  subscriptions: (params) ->
    @.register('gizmos', Meteor.subscribe('gizmos'))
  action: ->
    BlazeLayout.render('layout',{ content:'gizmosexport'})