Coffee Shop
===

A chat server written in CoffeeScript with a focus on TDD over simple domain objects. The actual server was added later.

Getting Started
==
1. Install node.js 0.6.13 http://nodejs.org/
1. `git clone git@github.com:EndangeredMassa/coffee-shop.git`
1. `npm install -g coffee-script express jasmine-node jessie`
1. `gem install watchr`
1. `cd coffee-shop && npm install`
1. `coffee server`

Auto-compile CoffeeScript for Client
==
1. `./script/compile_coffee`

Testing
==
1. For acceptance tests: `watchr script/spec_server.watchr`
1. For unit tests: `watchr script/spec_app.watchr`


