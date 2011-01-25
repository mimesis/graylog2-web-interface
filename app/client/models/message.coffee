class Message extends Backbone.Model
  
  facility: (attr)->
    f = window.App.facilities.get(parseInt(@get('facility'), 10))
    f.get(attr) if f
  
  severity: ->
    window.SysLogLevels[parseInt(@get('level'), 10)]
    
  date: ->
    new Date(@get('created_at') * 1000)