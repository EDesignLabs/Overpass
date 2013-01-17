View = require '../lib/view'
PostModel = require '../models/post'
template = require 'views/templates/post'

module.exports = class PostView extends View
    template: template
    tagName: 'li'
    className: 'post'

    model: new PostModel()

    events:
        'click .help': 'onClickHelp'

    afterRender: =>
        @$el.droppable
            drop: @drop
            out: @out

        @$el.toggleClass 'left', (@model.get('lane') == 1)

        @$el.toggleClass 'right', (@model.get('lane') == 2)

        @$(".hint").hide()

    drop: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:drop", @, ui.draggable

    out: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:out", @, ui.draggable

    onClickHelp: (ev)=>
        @$(".hint").dialog()
        @$(".help").hide()