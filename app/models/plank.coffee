Model = require "../lib/model"

module.exports = class PlankModel extends Model
    urlRoot:  ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/plank/'
    idAttribute: "resource_uri"

    matchesPost: (post) ->
        match = @get('post_type') is post?.get('post_type')

PlankModel.setup()