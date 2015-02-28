### Flux & React backed by backbone

Following this tutorial http://www.toptal.com/front-end/simple-data-flow-in-react-applications-using-flux-and-backbone

I have build a sample application that uses backbone models instead of flux stores to get lots of backbone features

This maintains top down control but allows components to rely on EventEmiter through backbone models and Item Collections

Should be deployed to http://westmoreland-open-hack.github.io/Backbone-Flux-React-Webpack/build eventually

Enjoy

### Run Me
`npm run dev` -> Open `localhost:8080`

### Build Me
`npm build`

### Test Me
`npm test`

### Testing Issues

Testing here was a little bit of a challenge. Marrying dependencies of webpack require with Jests commonJS only module requirement.
The simple solution was just to let Webpack manage deps for the tests as well. When each testfile runs webpack builds its deps. Which is a little heavy and currently happens completely in memory but it makes writing test as easy as pie.

Check out `preprocessor.js` for info