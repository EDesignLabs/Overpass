Mock = require "../lib/mock"

base = {
    "title": "Test title",
    "image": {
        "url": "/images/posts/123.png"
    }
}

module.exports = class PostTypeMock extends Mock
    base: base