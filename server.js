/*global process: false */
var statik = require('statik'),
    server = statik.createServer();

server.listen(process.env.PORT || 1337);
