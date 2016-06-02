Meteor.publish 'memos', ->
		Memos.find({owner:this.userId})


Meteor.publish 'memo', (memoId)->
	if Roles.userIsInRole @userId, ['admin']
		Memos.find({_id:memoId,owner:this.userId})
	else
		@ready()
