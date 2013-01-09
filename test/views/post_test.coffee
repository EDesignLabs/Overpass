PostView = require 'views/post'
PostModel = require 'models/post'
TestObjectFactory = require 'lib/test_object_factory'

describe 'PostView', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @model = @factory.create 'post'
        @model1 = new PostModel _.extend @model.toJSON(), {'lane': 1}
        @view = new PostView
            model: @model1
        @model2 = new PostModel _.extend @model.toJSON(), {'lane': 2}
        #@model2.set 'lane', 2
        @view2 = new PostView
            model: @model2

    it "should exist", ->
        expect(@view).to.be.ok

    it "should have a post model", ->
        expect(@view.model).to.be.an.instanceof PostModel

    describe 'View rendering', ->
        it "should display its post type", ->
            expect(@view.$el.text()).to.contain "Test title"

        it "should position in a left lane for lane=1", ->
            expect(@view.$el.hasClass 'left').to.be.ok

        it "should position in a right lane for lane=2", ->
            expect(@view2.$el.hasClass 'right').to.be.ok
