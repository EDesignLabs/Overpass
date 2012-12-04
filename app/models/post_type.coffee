Model = require "../lib/model"
PostModel = require "models/post"
PlankModel = require "models/plank"
PostsCollection = require "collections/posts"
PlanksCollection = require "collections/planks"

class PostTypeModel extends Model

    relations: [
        type: Backbone.HasMany
        key: 'posts'
        relatedModel: PostModel
        collectionType: PostsCollection
        includeInJSON: Backbone.Model.prototype.idAttribute
        reverseRelation:
            type: Backbone.HasOne
            key: 'post_type'
            includeInJSON: Backbone.Model.prototype.idAttribute
    ,
        type: Backbone.HasMany
        key: 'planks'
        relatedModel: PlankModel
        collectionType: PlanksCollection
        includeInJSON: Backbone.Model.prototype.idAttribute
        reverseRelation:
            type: Backbone.HasOne
            key: 'post_type'
            includeInJSON: Backbone.Model.prototype.idAttribute
    ]

PostTypeModel.setup()

module.exports = PostTypeModel