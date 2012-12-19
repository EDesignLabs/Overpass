View = require '../lib/view'
PostModel = require '../models/post'
template = require 'views/templates/post'

module.exports = class PostView extends View
    template: template
    tagName: 'li'
    className: 'post'

    model: new PostModel()

    afterRender: ->
        @$el.droppable
            drop: @drop
            out: @out

    drop: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:drop", this, ui.draggable

    out: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:out", this, ui.draggable