BridgeView = require 'views/bridge'
BridgeModel = require 'models/bridge'
PostModel = require 'models/post'
PlankModel = require 'models/post'
TestObjectFactory = require 'lib/test_object_factory'

describe 'BridgeView', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @model = new BridgeModel @factory.create('bridge')
        @model.on 'add:posts', =>
            console.log "got here"
        @view = new BridgeView
            model: @model

        # posts = []
        # @model.get('posts').each (post)=>
        #     posts.push post.toJSON()
        
        # @view.model.get('posts').add posts

        # _.each posts, (post)=>
        #     @view.model.get('posts').remove post 
        #     @view.model.get('posts').add post 

        # console.log @view.model.get('posts').length


        # planks = []
        # @model.get('planks').each (plank)=>
        #     planks.push plank.toJSON()
        
        # _.each planks, (plank)=>
        #     @view.model.get('planks').remove plank 
        #     @view.model.get('planks').add plank 

    afterEach ->
        @model.destroy()
        @view.destroy()

    it "should exist", ->
        expect(@view).to.be.ok

    it "should have a bridge model", ->
        expect(@view.model).to.be.an.instanceof BridgeModel

    describe 'Posts view rendering', ->
        it "should render its title", ->
            expect(@view.$('h1.title').length).to.equal 1
            expect(@view.$('h1.title').text())
                .to.equal @view.model.get 'title'

        it "should render its posts regions", ->
            expect(@view.$('.posts').length).to.equal 2

        it "should display its left posts region", ->
            expect(@view.$('.posts.left.active').length).to.equal 1

        it "should not display its right posts region", ->
            expect(@view.$('.posts.right.active').length).to.not.equal 1

        it "should display its correct number of posts", ->
            expect(@view.$('.posts.left').children('.post').length)
                .to.equal @view.model.get('posts').length

        it "should display new posts", ->
            expect(@view.$('.posts').children('.post').length)
                .to.equal @view.model.get('posts').length
            post = @view.model.get('posts').at(0).toJSON()
             
            mp = new PostModel(post)
            console.log mp

            p = @view.model.get('posts')

            console.log p.length
            console.log p.add mp
            console.log p.length

            expect(@view.$('.posts').children('.post').length)
                .to.equal @view.model.get('posts').length

        it "should display the correct first post html", ->
            @view.model.get('posts')
                .add @factory.create 'post'

            PostView = require 'views/post'
            postModel = @view.model.get('posts').at 0
            postView = new PostView
                model: postModel

            expect(@view.$('.posts')
                    .children('.post')
                    .first()
                    .html())
                .to.equal postView.$el.html()

        it "should display the correct last post html", ->
            @view.model.get('posts')
                .add @factory.create 'post'

            PostView = require 'views/post'
            postCount = @view.model.get('posts').length
            postModel = @view.model.get('posts').at postCount-1
            postView = new PostView
                model: postModel

            expect(@view.$('.posts')
                    .children('.post')
                    .last()
                    .html())
                .to.equal postView.$el.html()

    describe 'Planks view rendering', ->
        it "should display its planks region", ->
            expect(@view.$('.planks').length).to.equal 1

        it "should display its correct number of planks", ->
            expect(@view.$('.planks').children('.plank').length)
                .to.equal @view.model.get('planks').length

        it "should display new planks", ->
            expect(@view.$('.planks').children('.plank').length)
                .to.equal @view.model.get('planks').length
            @view.model.get('planks')
                .add @factory.create 'plank'
            expect(@view.$('.planks').children('.plank').length)
                .to.equal @view.model.get('planks').length

        it "should display the correct first plank html", ->
            @view.model.get('planks')
                .add @factory.create 'plank'

            PlankView = require 'views/plank'
            plankModel = @view.model.get('planks').at 0
            plankView = new PlankView
                model: plankModel

            expect(@view.$('.planks')
                    .children('.plank')
                    .first()
                    .html())
                .to.equal plankView.$el.html()

        it "should display the correct last plank html", ->
            @view.model.get('planks')
                .add @factory.create 'plank'

            PlankView = require 'views/plank'
            plankCount = @view.model.get('planks').length
            plankModel = @view.model.get('planks').at plankCount-1
            plankView = new PlankView
                model: plankModel

            expect(@view.$('.planks')
                    .children('.plank')
                    .last()
                    .html())
                .to.equal plankView.$el.html()

