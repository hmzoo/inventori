Meteor.methods

  adminUpdateUser: ( modifier,userId ) ->
      check(userId, String)
      check(modifier,Object)

      console.log(modifier)

      Security.can(this.userId).update(userId, modifier).for(Meteor.users).throw();


    # if not (@.userId and Roles.userIsInRole Meteor.user(), [ 'admin' ])
    #   throw new Meteor.Error('not-authorized');

      Meteor.users.update({'_id':userId},modifier)




  adminDeleteUser: ( userId ) ->
    check(userId, String)
    
    if not @.userId is userId
      throw new Meteor.Error('not-authorized to delete yourself');
    
    Security.can(this.userId).remove(userId).for(Meteor.users).throw();
    

      
    Meteor.users.remove(userId)
