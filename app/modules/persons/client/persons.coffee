Template.registerHelper 'personsPath', ->
  FlowRouter.path("persons")

Template.registerHelper 'personPath', ->
  "#{FlowRouter.path('persons')}/#{FlowRouter.getParam('personId')}"

Template.registerHelper 'currentPerson', ->
  Persons.findOne(FlowRouter.getParam("personId"))

Template.persons.helpers
  persons:->
    Persons.find().fetch()


Template.editperson.events
  'click .showdeleteperson' : (event) ->
    $('#deleteperson').removeClass('hidden')
    $('#editperson').addClass('hidden')
  'click .hidedeleteperson' : (event) ->
    $('#deleteperson').addClass('hidden')
    $('#editperson').removeClass('hidden')

Template.deleteperson.events
  'click .deleteperson' : (event) ->
    Persons.remove(FlowRouter.getParam("personId"))
    FlowRouter.go("persons")


AutoForm.addHooks ['insertPersonForm', 'updatePersonForm'],
  onSuccess: (formType, result) ->
    console.log(result)
    switch formType
      when 'insert' then FlowRouter.go("#{FlowRouter.path('persons')}/#{this.docId}")
      when 'update' then FlowRouter.go("#{FlowRouter.path('persons')}/#{this.docId}")

  onError: (formType, err) ->
    console.log(err)