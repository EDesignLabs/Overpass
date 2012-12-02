View = require '../lib/view'
PlankModel = require '../models/plank'

module.exports = class PlankView extends View
    template: require 'views/templates/plank'

    model: new PlankModel()

    initialize: ->
        super arguments
        @model.on 'change:body', =>
            @onChangeModelBody()
        @model.on 'error', =>
            @onErrorModel()

    onChangeModelBody: () ->
        @render()

    onErrorModel: () ->
        @model.set('body', 'Error')