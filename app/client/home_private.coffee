Template.home_private.events 
  '#codeForm submpit': (e) ->
    e.preventDefaults()
    console.log(e.target.inputCode.value)