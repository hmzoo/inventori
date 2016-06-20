if Meteor.isClient
  @Download = (data,filename)->
    blob = new Blob([data])
    a=window.document.createElement("a")

    a.href=window.URL.createObjectURL(blob,{type:"text/plain"})
    a.download = filename
    document.body.appendChild(a)
    a.click()
    document.body.removeChild(a)
