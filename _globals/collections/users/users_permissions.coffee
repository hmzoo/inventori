Meteor.startup ->
    
  Meteor.users.deny
    insert: -> true
    update: -> true
    remove: -> true
    
  Meteor.users.permit('update').ifLoggedIn().onlyProps(['username','emails','profile']) 
  Meteor.users.permit('update').ifLoggedIn().ifHasRole('admin').exceptProps(['services'])
  Meteor.users.permit('remove').ifLoggedIn().ifHasRole('admin')
