View = require '../lib/view'
BridgeItemView = require '../views/bridge_item'
KitModel = require '../models/kit'

module.exports = class KitView extends View
    template: require 'views/templates/kit'

    className: 'kit'

    initialize: ->
        @bridgeItemViews = []
        super()
        @model.on 'change', @onChange
        @model.on 'add:levels', @addOneBridge
        @model.fetch()

    addOneBridge: (bridge, bridges) =>
        bridgeItemView = new BridgeItemView
            model: bridge

        @bridgeItemViews.push bridgeItemView

        if bridge
            @$('.bridges').append bridgeItemView.$el
        @

    onChange: =>
        @render()

    removeAllBridges: ->
        @$('.bridges').empty()

        _.each @bridgeItemViews, (view, index, list)->
            view.remove()

    remove: ->
        @removeAllBridges()
        super()