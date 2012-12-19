View = require '../lib/view'
PlankModel = require '../models/plank'
PostTypeModel = require '../models/post_type'

module.exports = class PlankView extends View
    template: require 'views/templates/plank'
    tagName: 'li'
    className: 'plank'

    model: new PlankModel()

    events:
        "dragstart": "dragstart"

    subscriptions:
        "post:drop":    "onPostDrop"
        "post:out":     "onPostOut"

    initialize: ->
        super arguments
        @model.on 'change:body', =>
            @onChangeModelBody()
        @model.on 'error', =>
            @onErrorModel()

    afterRender: ->
        @$el.draggable()
        @$el.attr 'id', 'plank-' + @cid

    onChangeModelBody: () ->
        @render()

    onErrorModel: () ->
        @model.set('body', 'Error')

    dragstart: (ev, ui) ->

    onPostDrop: (postView, draggable) ->
        if @$el.attr('id') == draggable.attr('id')
            postView.model.set 'plank', @model
            Backbone.Mediator.pub 'plank:set'

    onPostOut: (postView, draggable) ->
        if @$el.attr('id') == draggable.attr('id')
            postView.model.unset 'plank'
            Backbone.Mediator.pub 'plank:unset'
