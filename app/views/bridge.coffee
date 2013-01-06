View = require '../lib/view'
PostView = require './post'
PlankView = require './plank'
BridgeModel = require '../models/bridge'

module.exports = class BridgeView extends View
    template: require 'views/templates/bridge'
    className: 'bridge'

    events:
        'click .go-button': 'onClickGoButton'

    subscriptions:
        "plank:moved":      "onPlankMoved"
        "plank:set":        "onPlankSet"
        "plank:unset":      "onPlankUnset"
        "bridge:modified":  "onBridgeModified"

    model: new BridgeModel()

    initialize: ->
        super()
        @model.on 'add:posts', @addOnePost
        @model.on 'add:planks', @addOnePlank

    afterRender: ->
        @addAllPosts @model.get('posts')#.models
        @addAllPlanks @model.get('planks')#.models

    addAllPosts: (@posts) ->
        @posts.each (post)=>
            @addOnePost post, posts
        @

    addAllPlanks: (@planks) ->
        @planks.each (plank)=>
            @addOnePlank plank, planks
        @

    addOnePost: (post, posts) =>
        @postView = new PostView
            model: post

        if post
            @$('.posts').append @postView.$el
        @

    addOnePlank: (plank, planks) =>
        @plankView = new PlankView
            model: plank
        if plank
            @$('.planks').append @plankView.$el
        @

    check: (ev) =>
        @posts.every (post) =>
            plank = post.get 'plank'
            if post.get 'plank'
                post.matchesPlank post.get 'plank'
            else
                no

    onClickGoButton: (ev)=>
        success = @check ev
        @$el.children('.indicator').toggleClass 'win', success
        @$el.children('.indicator').toggleClass 'fail', not success

    onPlankMoved: (ev)=>
        #do something like reset the activity timer

    onPlankSet: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onPlankUnset: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onBridgeModified: (ev)=>
        #do something like drop the next plank, etc.

