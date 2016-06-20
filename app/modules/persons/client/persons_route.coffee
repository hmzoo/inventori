#personS
IsAdmin.route '/persons',
  name: 'persons'
  subscriptions: (params) ->
    @.register('persons', Meteor.subscribe('persons'))
  action: ->
    BlazeLayout.render('layout',{ content:'persons'})

IsAdmin.route '/persons/new',
  name: 'newperson'
  action: (params) ->
    BlazeLayout.render('layout',{ content:'newperson'})

IsAdmin.route '/persons/:personId',
  name: 'person'
  subscriptions: (params) ->
    @.register('currentPerson', Meteor.subscribe('person', params.personId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'person'})

IsAdmin.route '/persons/:personId/edit',
  name: 'editperson'
  subscriptions: (params) ->
    @.register('currentperson', Meteor.subscribe('person', params.personId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'editperson'})

IsAdmin.route '/persons/:personId/delete',
  name: 'deleteperson'
  subscriptions: (params) ->
    @.register('currentperson', Meteor.subscribe('person', params.personId))
  action: (params) ->
    BlazeLayout.render('layout',{ content:'deleteperson'})