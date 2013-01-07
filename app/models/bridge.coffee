Model = require "../lib/model"
PostModel = require "models/post"
PlankModel = require "models/plank"
PostsCollection = require "collections/posts"
PlanksCollection = require "collections/planks"

class BridgeModel extends Model
    #for the moment, we're not actually cloning bridges
    #so, we use the level to fake it
    urlRoot: ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/level/'

    relations: [
        type: Backbone.HasMany
        key: 'planks'
        relatedModel: PlankModel
        collectionType: PlanksCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: false
    ,
        type: Backbone.HasMany
        key: 'posts'
        relatedModel: PostModel
        collectionType: PostsCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: false
    ]

BridgeModel.setup()

module.exports = BridgeModel