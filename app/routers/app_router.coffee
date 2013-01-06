BridgeModel  = require '../models/bridge'
BridgeView  = require '../views/bridge'
TestObjectFactory = require 'lib/test_object_factory'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': ->
        'bridge/:id': 'bridge'

    bridge: (id) ->
        Overpass?.Views?.AppView.$el.children('.layout-container').empty()
        @factory = new TestObjectFactory
        @bridge = new BridgeView
            model: new BridgeModel
                'id':id

        @bridge.model.fetch()

        Overpass?.Views?.BridgeView = @bridge

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @bridge.$el