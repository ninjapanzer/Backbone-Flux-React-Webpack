define([
  './dispatcher'
  'backbone'
  './data/meetup'
],
(
  dispatcher
  backbone
  meetup
)->
  Item = Backbone.Model.extend({})
  ItemCollection = Backbone.Collection.extend
    model: Item

    initialize: ->
      @dispatchToken = dispatcher.register((payload)=>
        @dispatchCallback(payload)
      )

    dispatchCallback: (payload)->
      switch payload.actionType
        when "add-item"
          @add {'item': payload}

  Store = new ItemCollection()
  Store.add({'item':"first"})
  Store
)
