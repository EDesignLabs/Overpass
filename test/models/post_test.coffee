PostModel = require 'models/post'

describe 'PostModel', ->
    beforeEach ->
        @model = new PostModel()

    it "should exist", ->
        expect(@model).to.be.ok
