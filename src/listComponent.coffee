define([
  'react'
],
(
  React
)->
  ListComponent = React.createClass
    componentDidMount: ->
      # the Component binds to the Store's events
      @props.store.on "add remove reset", =>
        @forceUpdate()
      , @
    componentWillUnmount: ->
      # turn off all events and callbacks that have this context
      @props.store.off null, null, this

    render: ->
      # show the items in a list.
      React.DOM.ul {}, @props.store.models.map (item) ->
        React.DOM.li {}, item.get('item')
  ListComponent
)
