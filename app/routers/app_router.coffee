KitModel  = require '../models/kit'
KitView  = require '../views/kit'

BridgeModel  = require '../models/bridge'
BridgeView  = require '../views/bridge'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': ->
        'kit/:id': 'kit'
        'bridge/:id': 'bridge'

    kit: (id) ->
        Overpass?.Views?.KitView?.remove()

        kitModel = new KitModel
            'id':id
        kitModel.fetch()

        @kit = new KitView
            model: kitModel

        Overpass?.Views?.KitView = @kit

        Overpass?.Views?.AppView.$el.children('.layout-container').empty()

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @kit.$el

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