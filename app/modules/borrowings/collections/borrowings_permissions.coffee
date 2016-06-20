Meteor.startup ->

  Borrowings.permit(['insert', 'update','remove']).ifLoggedIn().allowInClientCode()