Meteor.publish 'adminFiles', ->
	if Roles.userIsInRole @userId, ['admin']
		Files.find({'metadata._Resumable': { $exists: false }} )
	else
		@ready()

Meteor.publish 'userFiles', (id)->
	if id is @userId
		Files.find({'metadata._Resumable': { $exists: false },'metadata.owner': @userId } )
	else
		@ready()
