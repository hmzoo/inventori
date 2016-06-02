#MEMOS    
IsAdmin.route '/memos',
  name: 'memos'
  subscriptions: (params) ->
    @.register('memos', Meteor.subscribe('adminMemos'))
  action: ->
    BlazeLayout.render('layout',{ content:'memos'})
    
IsAdmin.route '/memos/new',
  name: 'newmemo'
  action: (params) ->
    BlazeLayout.render('layout',{ content:'newmemo'})
    
IsAdmin.route '/memos/:memoId',
  name: 'memo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('adminMemo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'memo'})
    
IsAdmin.route '/memos/:memoId/edit',
  name: 'editmemo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('adminMemo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'editmemo'})
    
IsAdmin.route '/memos/:memoId/delete',
  name: 'deletememo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('adminMemo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deletememo'})