FlowRouter.route '/',
  name:'home'
  action: (params) ->
    BlazeLayout.render('layout', { content:'home'})
    
Template.home.helpers
  notLogged: ->
    console.log(not Meteor.user())
    not Meteor.user()
  

