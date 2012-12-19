BridgeView  = require '../views/bridge'
TestObjectFactory = require 'lib/test_object_factory'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': ->
        'bridge': 'dynamic'
        'kit/:id': 'dynamic'

    dynamic: (id) ->
        Overpass?.Views?.AppView.$el.children('.layout-container').empty()
        @factory = new TestObjectFactory
        @bridge = new BridgeView
            model: @factory.create 'bridge'

        Overpass?.Views?.BridgeView = @bridge

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @bridge.$el