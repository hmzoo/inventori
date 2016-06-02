Template.registerHelper 'isLogged', ->
  Meteor.userId()
Template.registerHelper 'isAdmin', ->
  Roles.userIsInRole Meteor.user(), [ 'admin' ]
Template.registerHelper 'selector',()->
  Selector.getSelectorClass(@_id)


Template.layout.events
  'click #login-buttons-edit-profile': (event) ->
    FlowRouter.go 'profile'
  'click .goback': (event)->
    history.back()
  'click .selector': (event)->
    Selector.select(@_id)
    $(event.currentTarget).addClass('unselector')
    $(event.currentTarget).removeClass('selector')
    console.log(Selector.selection)
  'click .unselector': (event)->
    Selector.unselect(@_id)
    $(event.currentTarget).addClass('selector')
    $(event.currentTarget).removeClass('unselector')
    console.log(Selector.selection)
