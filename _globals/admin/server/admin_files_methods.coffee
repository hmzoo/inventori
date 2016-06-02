Meteor.methods



  deleteFile: ( fileIds ) ->
    check(fileIds, [String] )
    if not (@.userId and Roles.userIsInRole Meteor.user(), [ 'admin' ])
      throw new Meteor.Error('not-authorized')
    for fileId in fileIds
      oid=new Meteor.Collection.ObjectID(fileId)
      Files.remove(oid)
