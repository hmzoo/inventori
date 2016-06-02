Template.registerHelper 'usersPath', ->
  FlowRouter.path("users")

Template.registerHelper 'userPath', ->
  "#{FlowRouter.path('users')}/#{FlowRouter.getParam('userId')}"
###
Template.registerHelper 'currentUser', ->
  Memos.findOne(FlowRouter.getParam("userId"))
###

Template.users.helpers
  users:->
    Meteor.users.find().fetch()
  userroles:->
    @.roles?.join(',')

Template.deleteuser.events
  'click .deleteuser' : (event) ->
    user=Meteor.users.findOne FlowRouter.getParam("userId")
    console.log("delete user #{user.username}")
    Meteor.call("adminDeleteUser", user._id)
    history.back()
