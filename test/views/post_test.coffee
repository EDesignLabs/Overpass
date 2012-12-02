PostView = require 'views/post'
PostModel = require 'models/post'

describe 'PostView', ->
    beforeEach ->
        @model = new PostModel()
        @view = new PostView
            model: @model

    it "should exist", ->
        expect(@view).to.be.ok

    it "should have a post model", ->
        expect(@view.model).to.be.an.instanceof PostModel
