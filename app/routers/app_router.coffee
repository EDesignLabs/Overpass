KitsCollection  = require '../collections/kits'
KitsView  = require '../views/kits'

KitModel  = require '../models/kit'
KitView  = require '../views/kit'

BridgeModel  = require '../models/bridge'
BridgeView  = require '../views/bridge'

module.exports = class AppRouter extends Backbone.Router
    routes:
        '': 'kits'
        'kit/:id': 'kit'
        'bridge/:id': 'bridge'

    kits: () ->
        Overpass?.Views?.KitsView?.remove()

        kitsCollection = new KitsCollection()
        kitsCollection.fetch()

        @kits = new KitsView
            collection: kitsCollection

        @kits.collection.on 'reset', @kits.render, @

        Overpass?.Views?.KitsView = @kits

        Overpass?.Views?.AppView.$el.children('.layout-container').empty()

        Overpass?.Views?.AppView.$el.children('.layout-container')
            .prepend @kits.$el

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