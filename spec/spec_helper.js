require('coffee-script')

global.require_root = function(path) {
  var rootPath = process.env.PWD + '/' + path
  return require (rootPath)
}

beforeEach(function(){
  this.addMatchers({
    toContain: function() {
      for(var i=0; i<arguments.length; i++) {
        if (this.actual.indexOf(arguments[i]) === -1)
          return false;
      }
      return true;
    }
  });
});

