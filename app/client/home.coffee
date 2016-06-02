FlowRouter.route '/',
  name:'home'
  action: (params) ->
    BlazeLayout.render('layout', { content:'home'})
