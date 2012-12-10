base = {}

module.exports = class Mock
    base: base

    constructor: (@data = {}) ->

    toJSON: =>
        _.extend {}, @base, @data
