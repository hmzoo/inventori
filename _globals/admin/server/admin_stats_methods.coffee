Meteor.methods

  getStats: () ->

    if not Roles.userIsInRole @userId, ['admin']
      throw new Meteor.Error('not-authorized')

    result =
      users :
        count : Meteor.users.find().count()
    result