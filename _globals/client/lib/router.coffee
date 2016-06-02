exposed = FlowRouter.group {}


FlowRouter.notFound =
  name:'notfound'
  action: ->
    BlazeLayout.render('notfound');



@LoggedIn = FlowRouter.group
  triggersEnter: [ ->
    unless Meteor.userId() and not Roles.userIsInRole Meteor.user(), [ 'blocked' ]
      FlowRouter.go 'home'
  ]

@IsAdmin = LoggedIn.group
  prefix: '/admin'
  triggersEnter: [ ->
    unless Roles.userIsInRole Meteor.user(), [ 'admin' ]
      FlowRouter.go 'home'
  ]





    


switchActiveNav=(context)->
  console.log("switchActiveNav")
  $(".nav-active").removeClass('nav-active')
  $(".nav a[href='#{FlowRouter.current().path}'").addClass('nav-active')


FlowRouter.triggers.enter [switchActiveNav]
