class MessageRowView extends Backbone.View
  
  template: JST['message_row']
  tagName: "tr"
  className: "message-row"
  
  events: 
    'click .filter' : 'addFilter'
  
  initialize: (opts)->
    _.bindAll(this, "render", "edit", "select")
    @parent_el = opts.parent_el
    @model.view = this unless !@model
    @model.bind("change", @render)
    
  render: ->
    @parent_el.append(@el)  if @parent_el && $("##{@model.id}").length == 0
    $(@el).attr("id", @model.id)
    $(@el).addClass("level-#{@model.get("level")}")
    $(@el).addClass("facility-#{@model.get("facility")}")
    $(@el).addClass("host-#{@model.get("host").replace(/[^0-9]/g, "-")}")
    $(@el).html(@template(@model))
    this    
    
  addFilter: (e)=>
    f = e.currentTarget.dataset
    @model.collection.setFilter(f.filter, f.value)
    