Model = require "../lib/model"

module.exports = class PostModel extends Model
    url: '/api/overpass/v1/post'

    matchesPlank: (plank) ->
        match = @get('post_type').id == plank?.get('post_type').id

PostModel.setup()