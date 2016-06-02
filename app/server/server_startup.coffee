Meteor.startup ->
  if Meteor.isServer
#process.env.MAIL_URL = "smtp://localhost:25";
#process.env.ROOT_URL = "http://159.203.87.244/3000";
#Accounts.emailTemplates.from = "Vivavisio Accounts";

    if Meteor.users.find().count() is 0
      user=Accounts.createUser
        username: 'admin',
        email: 'admin@email.com',
        password: 'admin',
      Roles.addUsersToRoles user,['admin']

    Files.remove({ $or: [{ "length": 0 }, { "metadata._Resumable": { $exists: true } }] });
