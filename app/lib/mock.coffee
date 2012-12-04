base = {}

module.exports = class Mock
    base: base

    constructor: (data = {}) ->
        _.extend @, @base, data
