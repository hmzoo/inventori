if Meteor.isClient

  Accounts.ui.config
    requestPermissions: {}
    requestOfflineToken: {}
    passwordSignupFields: 'USERNAME_AND_EMAIL'

  accountsUIBootstrap3.logoutCallback = (error) ->
    if(error) 
      console.log( error)
    else
      FlowRouter.go 'home'

if Meteor.isServer
  
  Accounts.emailTemplates.siteName = 'Meteor Guide Todos Example'
  Accounts.emailTemplates.from = 'Meteor App Accounts <accounts@example.com>'
  Accounts.emailTemplates.resetPassword =
    subject: (user) ->
      'Reset your password on App'
    text: (user, url) ->
      """
      'Hello!'
      Click the link below to reset your password on App.
      #{url}
      If you didn't request this email, please ignore it.
      Thanks,
      The App team
      """
    html: (user, url) ->
      """
      'Hello!'
      Click the link below to reset your password on App.
      #{url}
      If you didn't request this email, please ignore it.
      Thanks,
      The App team
      """

  Accounts.onCreateUser (options, user) ->
    console.log("new User #{user.username}")
    user.roles=['user']
    user

