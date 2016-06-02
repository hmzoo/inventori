@Files = new FileCollection 'files' ,
  resumable: true
  baseURL: '/fs'
  locks:
      timeOut: 360
      pollingInterval: 5
      lockExpiration: 90       
  http: [
      { method: 'get', path: '/md5/:md5/:filename', lookup: (params, query) ->
        console.log(params.md5)
        return { md5: params.md5 }
      }
   ]

Files.helpers
  createdFrom: ->
    moment(@uploadDate).fromNow()
  niceUploadDate: ->
      moment(@uploadDate).format("MMM Do YY")
  ownerName: ->
    user=Meteor.users.findOne({_id:@metadata.owner})
    if not user
      return "unknown"
    user.username
  linkmd5:->
   "#{Files.baseURL}/md5/#{@md5}/#{@filename}"
  formattedLength:->
   numeral(@length).format('0.0b')
