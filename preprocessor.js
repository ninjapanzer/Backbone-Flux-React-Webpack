'use strict';

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
