define([
  './dispatcher'
  'backbone'
],
(
  dispatcher
  backbone
)->
  Store = {items: []}
  Store.dispatchCallback = (payload) ->
    switch payload.actionType
      when "add-item"
        Store.items.push payload.item
        console.log Store.items
      when "delete-last-item"
        Store.items.pop()
  Store.dispatchToken = dispatcher.register(Store.dispatchCallback)
  Store
)
