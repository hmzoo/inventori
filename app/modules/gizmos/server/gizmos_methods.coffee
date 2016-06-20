Meteor.methods
  gizmosExportForCSV :()->
    console.log("exporting")
		data=[]
    gizmos=Gizmos.find().fetch()
    data.push([g.name,g.serial,g.category,g.code,g.description]) for g in gizmos
    console.log(data)
    results =
      fields : ["name","serial","category","code","description"]
      data : data