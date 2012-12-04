Model = require "../lib/model"

module.exports = class PlankModel extends Model
    url: '/api/overpass/v1/plank'

    matchesPost: (post) ->
        match = @get('post_type') is post.get('post_type')

PlankModel.setup()