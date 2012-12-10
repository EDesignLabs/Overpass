Model = require "../lib/model"
PostModel = require "models/post"
PlankModel = require "models/plank"
PostsCollection = require "collections/posts"
PlanksCollection = require "collections/planks"

class BridgeModel extends Model
    relations: [
        type: Backbone.HasMany
        key: 'planks'
        relatedModel: PlankModel
        collectionType: PlanksCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: true
    ,
        type: Backbone.HasMany
        key: 'posts'
        relatedModel: PostModel
        collectionType: PostsCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: true
    ]

BridgeModel.setup()

module.exports = BridgeModel