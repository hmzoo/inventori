AutoForm.debug()

Template.profile.helpers
  currentUser:->
    if Meteor.user()
      Meteor.user()
