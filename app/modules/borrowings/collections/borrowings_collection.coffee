@Borrowings = new Meteor.Collection "borrowings"

Schemas.Borrowings = new SimpleSchema
  personId:
    type: String
  
  gizmoId:
    type: String

  infos:
    type: String
    optional: true
    autoform:
      rows: 12
      
  personInfo:
    type: String
    autoform:
      type: "hidden"
    autoValue: (doc)->
      if this.isInsert
        person=Persons.findOne(doc.personId)
        if person
          return "#{person.firstname} #{person.lastname}"
        else
          return "unknown"
        
  gizmoInfo:
    type: String
    optional: true
    autoform:
      type: "hidden"
    autoValue: (doc)->
      if this.isInsert
        gizmo=Gizmos.findOne(doc.gizmoId)
        if gizmo
          return gizmo.name
        else
          return "unknown"

  owner:
    type: String
    optional: true
    autoform:
      type: "hidden"
    autoValue: ->
      if this.isUpdate or this.isInsert
        this.userId

  startAt:
    type: Date
    autoform:
      type: "hidden"
    autoValue: ->
      if this.isInsert
        new Date()

  endAt:
    type: Date
    optional: true



Borrowings.attachSchema(Schemas.Borrowings)

Borrowings.helpers
  person: ->
    Meteor.users.findOne(@personId)
  startedFrom: ->
    moment(@startAt).fromNow()
  niceStartAt: ->
    moment(@startAt).format("MMM Do YY")
  niceEndAt: ->
    if(@endAt)
      return moment(@endAt).format("MMM Do YY")
    else
      return ""
