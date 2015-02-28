define('EventComponent',[
  'react'
  './eventDispatcher'
],
(
  React
  dispatcher
)->
  EventComponent = React.createClass
    getInitialState: ->
      dispatcher.register (payload)=>
        switch payload.actionType
          when "show-event"
            console.log "hi"

      return @props.event

    handleInfo: ->
      "hi"

    render: ->
      <div onClick={@handleInfo}>
        <span>{@state.get('created')}</span>
      </div>

  EventComponent
)
