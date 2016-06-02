
Meteor.publish 'adminUsers', ->
	if Roles.userIsInRole @userId, ['admin']
		Meteor.users.find({},{fields: {'services': 0}})
	else
		@ready()
    
Meteor.publish 'adminUser',(userId) ->
	if Roles.userIsInRole @userId, ['admin']
		Meteor.users.find({_id:userId},{fields: {'services': 0}})
	else
		@ready()