Model = require "../lib/model"
BridgeModel = require "models/bridge"
BridgesCollection = require "collections/bridges"

class KitModel extends Model
    urlRoot: ($PROCESS_ENV_BASE_API_URL ||'') + '/api/v1/kit/'

    relations: [
        type: Backbone.HasMany
        key: 'levels'
        relatedModel: BridgeModel
        collectionType: BridgesCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'kit'
            includeInJSON: false
    ]

KitModel.setup()

module.exports = KitModel