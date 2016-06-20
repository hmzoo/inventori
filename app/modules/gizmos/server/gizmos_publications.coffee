Meteor.publish 'gizmos', ->
		Gizmos.find()
    
Meteor.publish 'gizmo', (gizmoId)->
		Gizmos.find({_id:gizmoId})

Meteor.publish 'gizmosByCat', (cat)->
		Gizmos.find({category:cat})
    
Meteor.publish 'gizmoByCode', (code)->
		Gizmos.find({code:code})