Template.gizmosexport.events
  'click #exportgizmos' : (event) ->
    console.log("exporting gizmos");
    Meteor.call 'gizmosExportForCSV',(err,result)->
      if err
        console.log(err)
      else
        csv = Papa.unparse(result)
        console.log(csv)
        Download(csv,"gizmos.csv")
