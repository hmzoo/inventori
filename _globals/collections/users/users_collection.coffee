
Schemas.UserProfile = new SimpleSchema
  firstName: 
    type: String
    optional: true

  lastName:
    type: String
    optional: true

  birthday:
    type: Date
    optional: true
    
  website: 
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true

Schemas.User = new SimpleSchema
  username:
    type: String
    optional: true
    unique: true

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    label: 'Email'
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean
    optional: true
    autoform: 
      type: "hidden"

  services:
    type: Object
    optional: true
    blackbox: true
    autoform: 
      type: "hidden"

  roles:
    type: [String]
    optional: true
    allowedValues: ['user', 'admin','blocked']
    autoform :
      type: 'select-checkbox-inline'

  createdAt:
    type: Date
    autoform: 
      type: "hidden"

  profile:
    type: Schemas.UserProfile
    optional: true

  heartbeat:
    type: Date
    optional: true
    autoform: 
      type: "hidden"

    
    

Meteor.users.attachSchema(Schemas.User)


Meteor.users.helpers
  createdFrom: ->
    moment(@createdAt).fromNow()