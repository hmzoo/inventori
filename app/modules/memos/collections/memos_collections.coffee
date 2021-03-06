@Memos = new Meteor.Collection "memos"

Schemas.Memo = new SimpleSchema
  title:
    type: String

  content:
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



Memos.attachSchema(Schemas.Memo)

Memos.helpers
  ownerUserName: ->
    Meteor.users.findOne(@owner)?.username "unknown"
  createdFrom: ->
    moment(@createdAt).fromNow()
  modifiedDate: ->
    moment(@createdAt).format("MMM Do YY")
