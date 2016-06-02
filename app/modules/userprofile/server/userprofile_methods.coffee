Meteor.methods

  updateProfile: ( modifier,userId ) ->
    
    
    if (not this.userId) or (this.userId isnt userId)
      throw new Meteor.Error('not-authorized')
    
    
    check(userId, String)
    check(modifier,Object)
    
    console.log(modifier)
    
    Security.can(this.userId).update(userId, modifier).for(Meteor.users).throw();

      
    Meteor.users.update({'_id':userId},modifier)