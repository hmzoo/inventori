Meteor.startup ->

  Memos.permit(['insert', 'update','remove']).ifLoggedIn().ifHasRole('admin').allowInClientCode()