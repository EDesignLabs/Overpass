Model = require "../lib/model"
PostModel = require "models/post"
PlankModel = require "models/plank"
PostsCollection = require "collections/posts"
PlanksCollection = require "collections/planks"

class PostTypeModel extends Model
    urlRoot:  $PROCESS_ENV_BASE_API_URL + '/api/v1/post_type/'

    relations: [
        type: Backbone.HasMany
        key: 'posts'
        relatedModel: PostModel
        collectionType: PostsCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'post_type'
            includeInJSON: true
    ,
        type: Backbone.HasMany
        key: 'planks'
        relatedModel: PlankModel
        collectionType: PlanksCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'post_type'
            includeInJSON: true
    ]

PostTypeModel.setup()

module.exports = PostTypeModel