PlanksCollection = require 'collections/planks'
PlankModel = require 'models/plank'

describe 'PlanksCollection', ->
    beforeEach ->
        @collection = new PlanksCollection()

    it "should have a plank model", ->
        model = new @collection.model()
        expect(model).to.be.an.instanceof PlankModel
