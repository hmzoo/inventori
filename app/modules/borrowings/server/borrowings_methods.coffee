Meteor.methods

endBorrowing: ( gizmoId ) ->
    check(gizmoId, String)
    
    
    Security.can(this.userId).update().for(Borrowings).throw();
    Meteor.Borrowings.update({gizmoId:gizmoId},$set:{endAt:new Date()})
      
      
newBorrowing:(personId,gizmoId) ->
  check(gizmoId, String)
  check(personId, String)
  
  Security.can(this.userId).insert().for(Borrowings).throw();
  Meteor.Borrowings.insert({personId:personId,gizmoId:gizmoId})
