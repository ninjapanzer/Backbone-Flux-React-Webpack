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
    console.log underscore
    console.log dispatcher
    console.log store
    React.render(
      <itemComp />,
      document.getElementById('wow')
    );
    React.render(
      <listComp />,
      document.getElementById('list')
    );
)