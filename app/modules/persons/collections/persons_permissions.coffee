Meteor.startup ->

  Persons.permit(['insert', 'update','remove']).ifLoggedIn().ifHasRole('admin').allowInClientCode()