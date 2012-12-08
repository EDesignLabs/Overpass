module.exports = class TestObjectFactory
    create: (@type, data={}) ->
        Model = require 'models/' + type
        Mock = require 'mocks/' + type
        new Model new Mock data