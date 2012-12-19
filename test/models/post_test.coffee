TestObjectFactory = require 'lib/test_object_factory'

describe 'PostModel', ->
    beforeEach ->
        @post = @factory.create 'post'
        @correctPlank = @factory.create 'plank'
        @incorrectPlank = @factory.create 'plank'
        
        correctPostType = @factory.create 'post_type'
        incorrectPostType = @factory.create 'post_type'

        @post.set 'post_type', correctPostType
        @correctPlank.set 'post_type', correctPostType
        @incorrectPlank.set 'post_type', incorrectPostType
        
    it "should recognize a positive match", ->
        expect(@post.matchesPlank @correctPlank).to.be.ok

    it "should recognize a negative match", ->
        expect(@post.matchesPlank @incorrectPlank).to.not.be.ok
