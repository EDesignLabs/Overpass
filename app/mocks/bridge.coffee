Mock = require "../lib/mock"

base = {
    title: "Test Bridge",
    posts: [
        {
            resource_uri: '/api/v1/post/20',
            lane: 1,
            body: "Main Argument",
            post_type: {
                resource_uri: '/api/v1/post_type/40',
                title: "Post type 1"
            }
        },
        {
            resource_uri: '/api/v1/post/30',
            lane: 1,
            body: "Supporting Evidence",
            post_type: {
                resource_uri: '/api/v1/post_type/50',
                title: "Post type 2"
            }
        },
        {
            resource_uri: '/api/v1/post/40',
            lane: 1,
            body: "Counter Argument",
            post_type: {
                resource_uri: '/api/v1/post_type/60',
                title: "Post type 3"
            }
        },
        {
            resource_uri: '/api/v1/post/50',
            lane: 1,
            body: "Conclusion",
            post_type: {
                resource_uri: '/api/v1/post_type/70',
                title: "Post type 4"
            }
        }
    ],
    planks: [
        {
            resource_uri: '/api/v1/plank/30',
            lane: 1,
            body: 'Climate Change is happening because of pollution
            in the atmosphere caused by humans.',
            post_type: {
                resource_uri: '/api/v1/post_type/40',
                title: "Post type 1"
            }
        },
        {
            resource_uri: '/api/v1/plank/40',
            lane: 1,
            body: 'Carbon Dioxide levels in the atmosphere have have continued
            to rise since the beginning of the Industrial Revolution.',
            post_type: {
                resource_uri: '/api/v1/post_type/50',
                title: "Post type 2"
            }
        },
        {
            resource_uri: '/api/v1/plank/50',
            lane: 1,
            body: 'Climate change is not connected to human activity, and is
            a natural process that Earth undergoes as a result of the
            precession of the Earth’s axis.',
            post_type: {
                resource_uri: '/api/v1/post_type/60',
                title: "Post type 3"
            }
        },
        {
            resource_uri: '/api/v1/plank/60',
            lane: 1,
            body: 'There are both natural and unnatural (human induced)
            reasons that climate change is happening on Earth.',
            post_type: {
                resource_uri: '/api/v1/post_type/70',
                title: "Post type 4"
            }
        }
    ]
}

module.exports = class BridgeMock extends Mock
    base: base