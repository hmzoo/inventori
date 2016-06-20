Template.gizmosimport.onCreated ()->
  Template.instance().uploading = new ReactiveVar(false)


Template.gizmosimport.helpers
  uploading :->
    Template.instance().uploading.get()

Template.gizmosimport.events
  'change [name="uploadCSV"]' : (event,template)->
    console.log("uploading")
    Papa.parse event.target.files[0] ,
      header: true,
      complete: (result,file) ->
        console.log(result)
        Meteor.call 'gizmosImportCSV', (err,result)->
          if err
            console.log(err)
          else
            template.uploading.set(false)
            console.log('uploaded')
