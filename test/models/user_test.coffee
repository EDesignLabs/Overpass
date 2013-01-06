UserModel = require 'models/user'

describe 'UserModel', ->
    beforeEach ->
        @model = new UserModel()
