Meteor.publish 'adminMemos', ->
	if Roles.userIsInRole @userId, ['admin']
		Memos.find({})
	else
		@ready()
    
Meteor.publish 'adminMemo', (memoId)->
	if Roles.userIsInRole @userId, ['admin']
		Memos.find({_id:memoId})
	else
		@ready()