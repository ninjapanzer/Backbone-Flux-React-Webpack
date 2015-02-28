define([
  './eventDispatcher'
  'backbone'
  '../data/meetup'
],
(
  dispatcher
  backbone
  meetup
)->
  Item = Backbone.Model.extend({})
  ItemCollection = Backbone.Collection.extend
    model: Item
    url: "http://api.meetup.com/2/events?text_format=simplehtml&format=json&page=4&group_id=#{meetup.groupId}&sign=true&key=#{meetup.apiKey}&callback=?"

    parse: (data)->
      @add data.results
      @dispatchLoaded()

    initialize: ->
      @fetch()
      @dispatchToken = dispatcher.register((payload)=>
        @dispatchCallback(payload)
      )

    dispatchLoaded: ->
      dispatcher.dispatch
        actionType: "load-events"
        events: @models

    dispatchCallback: (payload)->
      switch payload.actionType
        when "add-item"
          @add {'item': payload}

  Store = new ItemCollection()
  Store
)
