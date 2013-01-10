View = require '../lib/view'
PlankModel = require '../models/plank'
PostTypeModel = require '../models/post_type'

module.exports = class PlankView extends View
    template: require 'views/templates/plank'
    tagName: 'li'
    className: 'plank'

    model: new PlankModel()

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
        @$el.draggable
            start: =>
                Backbone.Mediator.pub 'plank:moved'
        @$el.attr 'id', 'plank-' + @cid

    onChangeModelBody: () ->
        @render()

    onErrorModel: () ->
        @model.set('body', 'Error')

    onPostDrop: (postView, draggable) ->
        if @$el.attr('id') == draggable.attr('id')
            postView.model.set 'plank', @model
            Backbone.Mediator.pub 'plank:set', @, postView
            postView.$el.toggleClass 'full', true

    onPostOut: (postView, draggable) ->
        if @$el.attr('id') == draggable.attr('id')
            if postView.model.get('plank')?.get('id') == @model.get('id')
                postView.model.unset 'plank'
                Backbone.Mediator.pub 'plank:unset', @, postView
                postView.$el.toggleClass 'full', false
