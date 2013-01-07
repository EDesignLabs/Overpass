TestObjectFactory = require 'lib/test_object_factory'

describe 'BridgeModel', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @model = @factory.create 'bridge'

    it "should contain valid posts", ->
        expect(@model.get('posts').at(0).get("post_type").get 'title').to.equal "Post type 1"
        expect(@model.get('posts').at(2).get("post_type").get 'title').to.equal "Post type 3"
        @model.get('posts').at(2).get("post_type").set "title", "Third"
        expect(@model.get('posts').at(2).get("post_type").get 'title').to.equal "Third"

    it "should contain valid planks", ->
        expect(@model.get('planks').at(2).get 'body').to.contain "Climate change is not connected to human activity"
        @model.get('planks').at(2).set "body", "C"
        expect(@model.get('planks').at(2).get 'body').to.equal "C"

    it "should match matching posts and planks", ->
        expect(@model.get('planks').at(0).matchesPost @model.get('posts').at 0 ).to.be.ok
        expect(@model.get('planks').at(1).matchesPost @model.get('posts').at 1 ).to.be.ok
        expect(@model.get('planks').at(2).matchesPost @model.get('posts').at 2 ).to.be.ok

    it "should not match mismatched posts and planks", ->
        expect(@model.get('planks').at(2).matchesPost @model.get('posts').at 0 ).to.not.be.ok
        expect(@model.get('planks').at(0).matchesPost @model.get('posts').at 1 ).to.not.be.ok