#DASHBOARD
IsAdmin.route '/dashboard',
  name: 'admindashboard'
  action: ->
    BlazeLayout.render('layout',{ content:'admindashboard'})



Template.admindashboard.onCreated ->
  self=this
  self.stats=new ReactiveVar()
  Meteor.call "getStats" , (err,result) ->
    if err
      console.log(err)
    else
      self.stats.set(result)

Template.admindashboard.helpers
  stats:->
    Template.instance().stats.get()
