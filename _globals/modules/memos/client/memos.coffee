Template.registerHelper 'memosPath', ->
  FlowRouter.path("memos")

Template.registerHelper 'memoPath', ->
  "#{FlowRouter.path('memos')}/#{FlowRouter.getParam('memoId')}"

Template.registerHelper 'currentMemo', ->
  Memos.findOne(FlowRouter.getParam("memoId"))

Template.memos.helpers
  memos:->
    Memos.find().fetch()


Template.editmemo.events
  'click .showdeletememo' : (event) ->
    $('#deletememo').removeClass('hidden')
    $('#editmemo').addClass('hidden')
  'click .hidedeletememo' : (event) ->
    $('#deletememo').addClass('hidden')
    $('#editmemo').removeClass('hidden')

Template.deletememo.events
  'click .deletememo' : (event) ->
    Memos.remove(FlowRouter.getParam("memoId"))
    FlowRouter.go("memos")


AutoForm.addHooks ['adminInsertMemoForm', 'adminUpdateMemoForm'],
  onSuccess: (formType, result) ->
    console.log(result)
    switch formType
      when 'insert' then FlowRouter.go("#{FlowRouter.path('memos')}/#{this.docId}")
      when 'update' then FlowRouter.go("#{FlowRouter.path('memos')}/#{this.docId}")

  onError: (formType, err) ->
    console.log(err)
