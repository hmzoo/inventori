Meteor.startup ->

  Gizmos.permit(['insert', 'update','remove']).ifLoggedIn().allowInClientCode()