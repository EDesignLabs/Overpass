PlankModel = require 'models/plank'

describe 'PlankModel', ->
    beforeEach ->
        @model = new PlankModel()
        
    it "should exist", ->
        expect(@model).to.be.ok
