Meteor.publish 'persons', ->
		Persons.find()
    
Meteor.publish 'person', (personId)->
		Persons.find({_id:personId})

