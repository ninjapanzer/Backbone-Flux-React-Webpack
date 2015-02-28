define('EventsComponent',[
  'react'
  './eventDispatcher'
  './eventComp'
],
(
  React
  dispatcher
  eventComp
)->
  EventsComponent = React.createClass
    getInitialState: ->
      dispatcher.register (payload)=>
        switch payload.actionType
          when "load-events"
            @setState(payload.events)
      return {liked: false}

    render: ->
      <div id='something'>
      {
        @state.events.map (event, i)=>
          <eventComp event={event}/>
      }
      </div>
  EventsComponent
)
