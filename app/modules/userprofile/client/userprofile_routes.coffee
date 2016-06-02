LoggedIn.route '/profile',
  name: 'profile'
  action: ->
    BlazeLayout.render('layout',{ content:'profile'})