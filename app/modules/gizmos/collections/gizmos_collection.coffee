@Gizmos = new Meteor.Collection "gizmos"

Schemas.Gizmos = new SimpleSchema
  name:
    type: String
    
  serial:
    type: String
    optional: true
  
  category:
    type: String
    
  code:
    type: String
    unique: true

  description:
    type: String
    autoform:
      rows: 12

  owner:
    type: String
    autoform:
      type: "hidden"
    autoValue: ->
      if this.isUpdate or this.isInsert
        this.userId

  createdAt:
    type: Date
    autoform:
      type: "hidden"
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type: Date
    autoform:
      type: "hidden"
    autoValue: ->
      if this.isUpdate or this.isInsert
        new Date()



Gizmos.attachSchema(Schemas.Gizmos)

Gizmos.helpers
  ownerUserName: ->
    Meteor.users.findOne(@owner)?.username "unknown"
  createdFrom: ->
    moment(@createdAt).fromNow()
  modifiedDate: ->
    moment(@createdAt).format("MMM Do YY")
