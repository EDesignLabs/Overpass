Mock = require "../lib/mock"

base = {
    posts: [
        {
            id: 20,
            post_type: {
                id: 40,
                title: "Test type"
            }
        }
    ]
    planks: [
        {
            id: 30,
            body: 'Test post',
            post_type: {
                id: 40,
                title: "Test type"
            }
        }
    ]
}

module.exports = class BridgeMock extends Mock
    base: base