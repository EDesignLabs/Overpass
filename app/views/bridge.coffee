View = require '../lib/view'
PostView = require './post'
PlankView = require './plank'
BridgeModel = require '../models/bridge'

module.exports = class BridgeView extends View
    template: require 'views/templates/bridge'
    className: 'bridge'

    events:
        'click .go-button': 'onClickGoButton'
        'click .help': 'onClickHelp'

    subscriptions:
        "plank:moved":      "onPlankMoved"
        "plank:set":        "onPlankSet"
        "plank:unset":      "onPlankUnset"
        "bridge:modified":  "onBridgeModified"

    model: new BridgeModel()

    initialize: ->
        @plankViews = []
        @postViews = []
        @model.on 'change', @onChange
        @model.on 'add:posts', @addOnePost
        @model.on 'reset:posts', @addAllPosts
        @model.on 'add:planks', @addOnePlank
        @model.on 'reset:planks', @addAllPlanks
        super()

    afterRender: ->
        @hint = @$el.children(".hint")
        @hint.dialog
            autoOpen: true
            title: "Hint"

    addAllPosts: (@posts) ->
        @removeAllPosts()

        @posts.each (post)=>
            @addOnePost post, posts
        @

    removeAllPosts: () ->
        @$('.posts').empty()

        _.each @postViews, (view, index, list)->
            view.remove()

    addAllPlanks: (@planks) ->
        @removeAllPlanks()

        _.each @plankViews, (view, index, list)->
            view.remove()

        @planks.each (plank)=>
            @addOnePlank plank, planks
        @

    removeAllPlanks: () ->
        @$('.planks').empty()

        _.each @plankViews, (view, index, list)->
            view.remove()

    addOnePost: (post, posts) =>
        postView = new PostView
            model: post

        @postViews.push postView

        if post
            if post.get('lane') == 1
                @$('.posts.left').toggleClass 'active', true
                @$('.posts.left').append postView.$el
            if post.get('lane') == 2
                @$('.posts.right').toggleClass 'active', true
                @$('.posts.right').append postView.$el
        @

    addOnePlank: (plank, planks) =>
        plankView = new PlankView
            model: plank

        @plankViews.push plankView

        if plank
            @$('.planks').append plankView.$el
        @

    onChange: (ev)=>
        @render()

    onClickGoButton: (ev)=>
        success = @model.check()
        @$el.children('.indicator').toggleClass 'win', success
        @$el.children('.indicatorWin').toggleClass 'win', success
        @$el.children('.indicatorFail').toggleClass 'fail', not success

    onClickHelp: (ev)=>
        @hint.dialog "open"

    onPlankMoved: (ev)=>
        #do something like reset the activity timer
        @$el.children('.indicator').removeClass 'win'
        @$el.children('.indicatorWin').removeClass 'win'
        @$el.children('.indicatorFail').removeClass 'fail'

    onPlankSet: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onPlankUnset: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onBridgeModified: (ev)=>
        #do something like drop the next plank, etc.

    remove: ->
        @removeAllPosts()
        @removeAllPlanks()
        @hint.dialog "close"
        super()
