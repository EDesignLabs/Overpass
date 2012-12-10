View = require '../lib/view'
PlankModel = require '../models/plank'

module.exports = class PlankView extends View
    template: require 'views/templates/plank'
    tagName: 'li'
    className: 'plank'
    attributes:
        draggable: true
        ondragstart: "drag(event)"

    model: new PlankModel()

    initialize: ->
        super arguments
        @model.on 'change:body', =>
            @onChangeModelBody()
        @model.on 'error', =>
            @onErrorModel()

    afterRender: ->
        @$el.attr 'id', Math.random()*10000

    onChangeModelBody: () ->
        @render()

    onErrorModel: () ->
        @model.set('body', 'Error')