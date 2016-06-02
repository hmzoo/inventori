if Meteor.isClient

  Meteor.startup ->

    Files.resumable.assignDrop($(".fileDrop"));
    Files.resumable.assignBrowse($(".fileBrowse"));

    Files.resumable.on 'fileAdded', (file)->
      Session.set file.uniqueIdentifier, 0
      Files.insert
        _id: file.uniqueIdentifier
        filename: file.fileName,
        contentType: file.file.type
        (err, _id) ->
          if (err)
            console.error("File creation failed!", err)
          Files.resumable.upload();

      # Update the upload progress session variable
      Files.resumable.on 'fileProgress', (file) ->
         Session.set file.uniqueIdentifier, Math.floor(100*file.progress())

      # Finish the upload progress in the session variable
      Files.resumable.on 'fileSuccess', (file) ->
         Session.set file.uniqueIdentifier, undefined

      # More robust error handling needed!
      Files.resumable.on 'fileError', (file) ->
         console.warn "Error uploading", file.uniqueIdentifier
         Session.set file.uniqueIdentifier, undefined


    Deps.autorun ->
      $.cookie('X-Auth-Token', Accounts._storedLoginToken(), { path: '/' })
