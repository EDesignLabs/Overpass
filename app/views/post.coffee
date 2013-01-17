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

    initialize: ->
        super()
        @model.on 'remove', @onRemove

    afterRender: ->
        @$el.droppable
            drop: @drop
            out: @out

        @$el.toggleClass 'left', (@model.get('lane') == 1)

        @$el.toggleClass 'right', (@model.get('lane') == 2)

        @$(".hint").hide()
        @$el.attr 'id', 'post-' + @cid

        @hint = @$el.children(".hint")
        @hint.dialog
            autoOpen: false
            title: "Hint"

    drop: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:drop", @, ui.draggable

    out: (ev, ui)=>
        ev.preventDefault()
        Backbone.Mediator.pub "post:out", @, ui.draggable

    onClickHelp: (ev)=>
        @hint.dialog "open"
        false
 
    onRemove: ()=>
        @remove()
