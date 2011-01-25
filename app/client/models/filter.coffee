class Filter extends Backbone.Model
  
  paramsUrl: ->
    $.param({ filters: @attributes })