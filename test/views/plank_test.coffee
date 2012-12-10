PlankView = require 'views/plank'
PlankModel = require 'models/plank'
PlankMock = require 'mocks/plank'
TestObjectFactory = require 'lib/test_object_factory'

describe 'PlankView', ->
    before ->
        @factory = new TestObjectFactory

    beforeEach ->
        @model = new PlankModel()
        @view = new PlankView
            model: @model  

    it "should have a plank model", ->
        expect(@view.model).to.be.an.instanceof PlankModel

 
    describe 'View rendering', ->
        beforeEach ->
            @view.model = @factory.create 'plank'
            @view.render()

        it "should display its body", ->
            expect(@view.$el.children('.body').text()).to.equal "This is a fetch test"

    describe 'Fetch', ->
        beforeEach ->
            @fetchStub = sinon.stub @model, "fetch", =>
                @model.set new PlankMock().toJSON()

        afterEach ->
            @model.fetch.restore()

        it "should call fetch once", ->
            expect(@view.$el.text().trim()).to.equal ''

            @model.fetch()
            
            expect(@fetchStub).to.have.been.calledOnce

        it "should display plank body text when fetched", ->
            expect(@view.$el.text().trim()).to.equal ''

            @model.fetch()
            
            expect(@view.$el.text().trim()).to.contain 'This is a fetch test'

    describe 'Save', ->

        beforeEach ->
            @saveStub = sinon.stub window.Backbone, 'sync', (method, model, options) ->
                options.success new PlankMock(
                    body: model.get('body')
                )
                .toJSON()

        afterEach ->
            window.Backbone.sync.restore()

        it "should display plank body text when saved", ->
            expect(@view.$el.text().trim()).to.equal ''

            @model.set 'body', 'This is a save test'
            @model.save()

            expect(@saveStub).to.be.called

            expect(@view.$el.text().trim()).to.contain 'This is a save test'

    describe 'Fail', ->

        beforeEach ->
            @failStub = sinon.stub window.Backbone, 'sync', (method, model, options) ->
                options.error()

        afterEach ->
            window.Backbone.sync.restore()

        it "should display error text when fetch fails", ->
            expect(@view.$el.text().trim()).to.equal ''

            @model.fetch()

            expect(@view.$el.text().trim()).to.contain 'Error'
