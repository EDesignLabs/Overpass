TestObjectFactory = require 'lib/test_object_factory'

describe 'PlankModel', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @plank = @factory.create 'plank'
        @correctPost = @factory.create 'post'
        @incorrectPost = @factory.create 'post'
        
        correctPostType = @factory.create 'post_type'
        incorrectPostType = @factory.create 'post_type'

        @plank.set 'post_type', correctPostType
        @correctPost.set 'post_type', correctPostType
        @incorrectPost.set 'post_type', incorrectPostType
        
    it "should recognize a positive match", ->
        expect(@plank.matchesPost @correctPost).to.be.ok

    it "should recognize a negative match", ->
        expect(@plank.matchesPost @incorrectPost).to.not.be.ok
