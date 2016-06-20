#borrowingS
LoggedIn.route '/borrowings',
  name: 'borrowings'
  subscriptions: (params) ->
    @.register('borrowings', Meteor.subscribe('borrowings'))
  action: ->
    BlazeLayout.render('layout',{ content:'borrowings'})

LoggedIn.route '/borrowings/new',
  name: 'newborrowing'
  subscriptions: (params) ->
    @.register('gizmos', Meteor.subscribe('gizmos'))
    @.register('persons', Meteor.subscribe('persons'))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'newborrowing'})

LoggedIn.route '/borrowings/:borrowingId',
  name: 'borrowing'
  subscriptions: (params) ->
    @.register('currentBorrowing', Meteor.subscribe('borrowing', params.borrowingId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'borrowing'})

LoggedIn.route '/borrowings/:borrowingId/edit',
  name: 'editborrowing'
  subscriptions: (params) ->
    @.register('currentborrowing', Meteor.subscribe('borrowing', params.borrowingId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'editborrowing'})

LoggedIn.route '/borrowings/:borrowingId/delete',
  name: 'deleteborrowing'
  subscriptions: (params) ->
    @.register('currentborrowing', Meteor.subscribe('borrowing', params.borrowingId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deleteborrowing'})