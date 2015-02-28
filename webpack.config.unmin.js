var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
module.exports = {
  entry: './src/app.coffee',
  output: {
    path: './build',
    filename: 'bundle.js'
  },
  module: {
    noParse: [
      resolveBowerPath('/react/react.js'),
      resolveBowerPath('/flux/dist/Flux.js'),
      resolveBowerPath('/underscore/underscore-min.js'),
      resolveBowerPath('/jquery/jquery.min.js')
    ],
    loaders: [
      { test: /\.coffee$/, loader: "coffee-jsx-loader" }
      //{ test: /\.coffee$/, loader: "coffee" }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      underscore: 'underscore',
      jquery: 'jquery',
      Backbone: 'backbone',
      React: 'react',
      Flux: 'flux'
    })
  ],
  resolve: {
    alias: {
      'jquery': resolveBowerPath('/jquery/dist/jquery.min.js'),
      'backbone': resolveBowerPath('/backbone/backbone.js'),
      'react': resolveBowerPath('/react/react.js'),
      'flux': resolveBowerPath('/flux/dist/Flux.js'),
      'underscore': resolveBowerPath('/underscore/underscore-min.js')
    },
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};
