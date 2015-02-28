'use strict';

// Adapted from https://github.com/ColCh/jest-webpack/blob/f8e02b7a51da48c55395392e61d9c03789e43911/preprocessor.js

var webpack = require('webpack');
var MemoryFileSystem = require('memory-fs');

var fs = new MemoryFileSystem();

module.exports = {
  process: function (src, filename) {
    var options = require('./webpack.config.test.js');
    options.entry = filename;
    options.output.path = '/';
    options.output.filename = filename;

    var compiler = webpack(options);

    compiler.outputFileSystem = fs;

    var stats = null;

    compiler.run(function() {
      console.log("\nwebpack compile "+ filename)
      stats = true;
    });

    while (stats === null) {
      require('deasync').sleep(100);
    }

    var contentBuffer = fs.readFileSync(filename);
    var content = contentBuffer + '';

    fs.unlinkSync(filename);

    return content;
  }
};
