BridgeModel  = require '../models/bridge'
BridgeView  = require '../views/bridge'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': ->
        'bridge/:id': 'bridge'

    bridge: (id) ->
        Overpass?.Views?.BridgeView?.remove()

        @model = new BridgeModel
            'id':id
        @model.fetch()

        @bridge = new BridgeView
            model: @model

        Overpass?.Views?.BridgeView = @bridge

        Overpass?.Views?.AppView.$el.children('.layout-container').empty()

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @bridge.$el