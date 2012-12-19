Mock = require "../lib/mock"

base = {
    posts: [
        {
            id: 20,
            post_type: {
                id: 40,
                title: "Post type 1"
            }
        },
        {
            id: 30,
            post_type: {
                id: 50,
                title: "Post type 2"
            }
        },
        {
            id: 40,
            post_type: {
                id: 60,
                title: "Post type 3"
            }
        },
        {
            id: 50,
            post_type: {
                id: 70,
                title: "Post type 4"
            }
        }
    ],
    planks: [
        {
            id: 30,
            body: 'Climate Change is happening because of pollution
            in the atmosphere caused by humans.',
            post_type: {
                id: 40,
                title: "Post type 1"
            }
        },
        {
            id: 40,
            body: 'Carbon Dioxide levels in the atmosphere have have continued
            to rise since the beginning of the Industrial Revolution.',
            post_type: {
                id: 50,
                title: "Post type 2"
            }
        },
        {
            id: 50,
            body: 'Climate change is not connected to human activity, and is
            a natural process that Earth undergoes as a result of the
            precession of the Earth’s axis.',
            post_type: {
                id: 60,
                title: "Post type 3"
            }
        },
        {
            id: 60,
            body: 'There are both natural and unnatural (human induced)
            reasons that climate change is happening on Earth.',
            post_type: {
                id: 70,
                title: "Post type 4"
            }
        }
    ]
}

module.exports = class BridgeMock extends Mock
    base: base