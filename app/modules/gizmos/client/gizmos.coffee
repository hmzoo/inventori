Template.registerHelper 'gizmosPath', ->
  FlowRouter.path("gizmos")

Template.registerHelper 'gizmoPath', ->
  "#{FlowRouter.path('gizmos')}/#{FlowRouter.getParam('gizmoId')}"

Template.registerHelper 'currentGizmo', ->
  Gizmos.findOne(FlowRouter.getParam("gizmoId"))

Template.gizmos.helpers
  gizmos:->
    Gizmos.find().fetch()


Template.editgizmo.events
  'click .showdeletegizmo' : (event) ->
    $('#deletegizmo').removeClass('hidden')
    $('#editgizmo').addClass('hidden')
  'click .hidedeletegizmo' : (event) ->
    $('#deletegizmo').addClass('hidden')
    $('#editgizmo').removeClass('hidden')

Template.deletegizmo.events
  'click .deletegizmo' : (event) ->
    Gizmos.remove(FlowRouter.getParam("gizmoId"))
    FlowRouter.go("gizmos")


AutoForm.addHooks ['insertGizmoForm', 'updateGizmoForm'],
  onSuccess: (formType, result) ->
    console.log(result)
    switch formType
      when 'insert' then FlowRouter.go("#{FlowRouter.path('gizmos')}/#{this.docId}")
      when 'update' then FlowRouter.go("#{FlowRouter.path('gizmos')}/#{this.docId}")

  onError: (formType, err) ->
    console.log(err)
