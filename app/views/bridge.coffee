View = require '../lib/view'
PostView = require './post'
PlankView = require './plank'
BridgeModel = require '../models/bridge'

module.exports = class BridgeView extends View
    template: require 'views/templates/bridge'
    className: 'bridge'

    model: new BridgeModel()

    initialize: ->
        super()
        @model.on 'add:posts', @addOnePost
        @model.on 'add:planks', @addOnePlank

    afterRender: ->
        @addAllPosts @model.get('posts')#.models
        @addAllPlanks @model.get('planks')#.models

    addAllPosts: (posts) ->
        posts.each (post)=>
            @addOnePost post, posts

    addAllPlanks: (planks) ->
        planks.each (plank)=>
            @addOnePlank plank, planks

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

