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
        @plankViews = []
        @postViews = []
        super()
        @model.on 'change', @onChange
        @model.on 'add:posts', @addOnePost
        @model.on 'add:planks', @addOnePlank
        @model.fetch()

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

        console.log posts, @model.get('posts')

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

    check: (ev) =>
        @model.get('posts').every (post) =>
            plank = post.get 'plank'
            if plank
                post.matchesPlank(plank) or plank.get('lane') == 0
            else
                no

    onChange: (ev)=>
        @render()

    onClickGoButton: (ev)=>
        success = @check ev
        @$el.children('.indicator').toggleClass 'win', success
        @$el.children('.indicatorFail').toggleClass 'fail', not success

    onPlankMoved: (ev)=>
        #do something like reset the activity timer

    onPlankSet: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onPlankUnset: (ev)=>
        Backbone.Mediator.pub 'bridge:modified'

    onBridgeModified: (ev)=>
        #do something like drop the next plank, etc.

    remove: ->
        @removeAllPosts()
        @removeAllPlanks()
        super()
