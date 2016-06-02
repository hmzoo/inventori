if Meteor.isClient
  @Selector =
    selection:[]
    lastSelected:''
    resetSelection:->
      @selection=[]
      @lastSelected=''
    select:(oid)->
      id=oid?.valueOf() ? oid
      @lastSelected=id
      if _.indexOf(@selection,id) is -1
        @selection.push(id)
    unselect:(oid)->
      id=oid?.valueOf() ? oid
      @selection=_.without(@selection,id)
    toggle:(oid)->
      id=oid?.valueOf() ? oid
      if _.indexOf(@selection,id) is -1
        @select(id)
      else
        @unselect(id)
    getSelectorClass:(oid)->
      id=oid?.valueOf() ? oid
      if _.indexOf(@selection,id) is -1
        return "selector"
      else
        return "unselector"
