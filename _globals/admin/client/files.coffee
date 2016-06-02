Template.files.onRendered ->
    Files.resumable.assignDrop($(".fileDrop"));
    Files.resumable.assignBrowse($(".fileBrowse"));


Template.fileslist.helpers
  files:->
    Files.find().fetch()
  uploadStatus: () ->
    percent = Session.get "#{this._id}"
    unless percent?
      "Processing..."
    else
      "Uploading..."
  uploadProgress: () ->
    percent = Session.get "#{this._id}"

Template.fileslist.events
  'click #removefile': (event) ->
    Meteor.call("deleteFile",Selector.selection)
    Selector.resetSelection()
