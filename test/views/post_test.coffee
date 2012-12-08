PostView = require 'views/post'
PostModel = require 'models/post'
TestObjectFactory = require 'lib/test_object_factory'

describe 'PostView', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @model = @factory.create 'post'
        @view = new PostView
            model: @model

    it "should exist", ->
        expect(@view).to.be.ok

    it "should have a post model", ->
        expect(@view.model).to.be.an.instanceof PostModel

    it "should display its post type", ->
        expect(@view.$el.children('h2').text()).to.equal "Test title"