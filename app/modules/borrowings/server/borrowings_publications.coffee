Meteor.publish 'borrowings', ->
		Borrowings.find()
    
Meteor.publish 'borrowing', (borrowingId)->
		Borrowings.find({_id:borrowingId})
    
Meteor.publish 'borrowingByPerson', (personId)->
		Borrowings.find({personId:personId})
    
Meteor.publish 'borrowingByGizmo', (gizmoId)->
		Borrowings.find({gizmoId:gizmoId})