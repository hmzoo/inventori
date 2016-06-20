@Persons = new Meteor.Collection "persons"

Schemas.Persons = new SimpleSchema
  firstname:
    type: String
  lastname:
    type: String
  surname:
    type: String
    unique: true
  email:
    type: String
    unique: true
  code:
    type: String
    unique: true



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



Persons.attachSchema(Schemas.Persons)

Persons.helpers
  createdFrom: ->
    moment(@createdAt).fromNow()
  modifiedDate: ->
    moment(@createdAt).format("MMM Do YY")
