define([
  'react'
  './dispatcher'
  './store'
  './itemComponent'
  './listComponent'
  './events/eventStore'
  './events/eventsComp'
],
(
  React
  dispatcher
  store
  itemComp
  listComp
  eventStore
  eventComp
)->
  console.log store
  React.render(
    <itemComp />,
    document.getElementById('wow')
  );
  React.render(
    <listComp store={store} />,
    document.getElementById('list')
  );
  React.render(
    <eventComp store={eventStore} />,
    document.getElementById('events')
  )
)