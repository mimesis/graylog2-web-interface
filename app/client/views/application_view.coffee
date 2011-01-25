class ApplicationView extends Backbone.View

  template: JST['application']
  init_fetch: ['messages', 'facilities'].sort()
  fetched_collections: []

  events: 
    'click a' : 'applyFilter'

  initialize: ->
    _.bindAll(this, "render", "onReady", "applyFilter")
    @messages = new MessageList
    @messages.bind('refresh', @addAllMessages)
    @messages.bind('change', @addAllMessages)
    @messages.filters.bind('change', @renderFilter)
    @messages.fetch()
    @facilities = new FacilityList
    @facilities.fetch(success: @onReady)
    
  onReady: (col)=>
    console.log("ready !")
    @render()
  
  render: =>
    $(@el).html(@template(this)) unless @rendered
    @rendered = true
    @renderFilter()
    
  renderFilter: =>
    this.$(".filters").html(JST['filter'](@messages.filters))
    
  addAllMessages: =>
    $(".message-row").remove()
    @messages.each(@addMessage)
    
  addMessage: (msg)=>
    (new MessageRowView(model: msg, parent_el: this.$(".messages tbody"))).render()
  
  applyFilter: ->
    console.log "applying filer"
    @messages.filter()