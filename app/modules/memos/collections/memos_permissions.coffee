Meteor.startup ->

  Memos.permit(['insert', 'update','remove']).ifLoggedIn().allowInClientCode()
