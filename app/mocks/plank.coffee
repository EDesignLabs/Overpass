Mock = require "../lib/mock"

base = {
    "body": "This is a fetch test",
    "lane": 1
}

module.exports = class PlankMock extends Mock
    base: base
