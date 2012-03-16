require('coffee-script')

global.require_root = function(path) {
  var rootPath = process.env.PWD + '/' + path
  return require (rootPath)
}


