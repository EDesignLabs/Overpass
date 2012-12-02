Mock = require "../lib/mock"

base = {
    "id": 123,
    "body": "This is a fetch test"
}

module.exports = class PlankMock extends Mock
    base: base
