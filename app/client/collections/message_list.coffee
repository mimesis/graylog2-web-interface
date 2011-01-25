class MessageList extends Backbone.Collection
  model: Message
  filters: new Filter
  url: ->
    ["/messages", @filters.paramsUrl()].join("?")
    
  setFilter: (n,v)->
    console.log "setFilter #{n}:#{v}"
    if !_.isNull(v) || !_.isUndefined(v)
      h = {}
      h[n] = v
      @filters.set(h)
    else
      @filters.unset(n)


  filter: (filters)->
    @filters.clear()
    @filters.set(filters)
    @fetch()