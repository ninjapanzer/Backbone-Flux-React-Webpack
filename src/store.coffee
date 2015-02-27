define([
  './dispatcher'
  'backbone'
],
(
  dispatcher
  backbone
)->
  Item = Backbone.Model.extend({})
  ItemCollection = Backbone.Collection.extend
    model: Item
    #url: "/todo"

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
