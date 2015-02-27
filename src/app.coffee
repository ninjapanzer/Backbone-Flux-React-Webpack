define([
  'react'
  './dispatcher'
  './store'
  './itemComponent'
  './listComponent'
],
(
  React
  dispatcher
  store
  itemComp
  listComp
)->
    store.add('HI')
    console.log underscore
    console.log dispatcher
    console.log store
    React.render(
      <itemComp />,
      document.getElementById('wow')
    );
    React.render(
      <listComp store={store} />,
      document.getElementById('list')
    );
)