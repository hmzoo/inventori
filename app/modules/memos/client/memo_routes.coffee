#MEMOS
LoggedIn.route '/memos',
  name: 'memos'
  subscriptions: (params) ->
    @.register('memos', Meteor.subscribe('memos'))
  action: ->
    BlazeLayout.render('layout',{ content:'memos'})

LoggedIn.route '/memos/new',
  name: 'newmemo'
  action: (params) ->
    BlazeLayout.render('layout',{ content:'newmemo'})

LoggedIn.route '/memos/:memoId',
  name: 'memo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('memo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'memo'})

LoggedIn.route '/memos/:memoId/edit',
  name: 'editmemo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('memo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'editmemo'})

LoggedIn.route '/memos/:memoId/delete',
  name: 'deletememo'
  subscriptions: (params) ->
    @.register('currentMemo', Meteor.subscribe('memo', params.memoId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deletememo'})
