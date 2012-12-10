BridgeView  = require '../views/bridge'
TestObjectFactory = require 'lib/test_object_factory'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': ->
        'test': 'dynamic'
        'test/:id': 'dynamic'

    dynamic: (id) ->
        console.log "kit #" + 1
        @factory = new TestObjectFactory
        @bridge = new BridgeView
            model: @factory.create 'bridge'

        Overpass?.Views?.BridgeView = @bridge

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @bridge.$el