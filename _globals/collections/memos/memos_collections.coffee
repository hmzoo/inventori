@Memos = new Meteor.Collection "memos"

Schemas.Memo = new SimpleSchema
  title:
    type: String
    unique: true

  content:
    type: String
    autoform:
      rows: 12

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
    
    

Memos.attachSchema(Schemas.Memo)

Memos.helpers
  createdFrom: ->
    moment(@createdAt).fromNow()
  modifiedDate: ->
    moment(@createdAt).format("MMM Do YY")
