Mock = require "../lib/mock"

base = {
    "lane": 1,
    "post_type": {
        "title": "Test title",
        "image": {
            "url": "/images/posts/123.png"
        }
    }
}

module.exports = class PostMock extends Mock
    base: base
