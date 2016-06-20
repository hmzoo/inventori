Template.registerHelper 'borrowingsPath', ->
  FlowRouter.path("borrowings")

Template.registerHelper 'borrowingPath', ->
  "#{FlowRouter.path('borrowings')}/#{FlowRouter.getParam('borrowingId')}"

Template.registerHelper 'currentBorrowing', ->
  Borrowings.findOne(FlowRouter.getParam("borrowingId"))

Template.borrowings.helpers
  borrowings:->
    Borrowings.find().fetch()


Template.editborrowing.events
  'click .showdeleteborrowing' : (event) ->
    $('#deleteborrowing').removeClass('hidden')
    $('#editborrowing').addClass('hidden')
  'click .hidedeleteborrowing' : (event) ->
    $('#deleteborrowing').addClass('hidden')
    $('#editborrowing').removeClass('hidden')

Template.deleteborrowing.events
  'click .deleteborrowing' : (event) ->
    Borrowings.remove(FlowRouter.getParam("borrowingId"))
    FlowRouter.go("borrowings")


AutoForm.addHooks ['insertBorrowingForm', 'updateBorrowingForm'],
  onSuccess: (formType, result) ->
    console.log(result)
    switch formType
      when 'insert' then FlowRouter.go("#{FlowRouter.path('borrowings')}/#{this.docId}")
      when 'update' then FlowRouter.go("#{FlowRouter.path('borrowings')}/#{this.docId}")

  onError: (formType, err) ->
    console.log(err)