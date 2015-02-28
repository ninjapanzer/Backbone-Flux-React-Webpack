// __tests__/sum-test.js
jest.dontMock('../src/events/eventComp.coffee');

describe('eventComp', function() {
  it('sees if the state is passed correctly to event', function() {
    var EventComp = require('../src/events/eventComp');
    var Backbone = require('backbone');
    var TestUtils = React.addons.TestUtils;

    var event = {
      get: function(thing){
        return thing;
      }
    };

    var eventBox = TestUtils.renderIntoDocument(
      React.createElement(EventComp, {event: event})
    );

    var box = TestUtils.findRenderedDOMComponentWithTag(
      eventBox, 'span');

    expect(box.getDOMNode().textContent).toEqual('created');
    expect(eventBox.state.get('created')).toEqual('created');
  });
});
