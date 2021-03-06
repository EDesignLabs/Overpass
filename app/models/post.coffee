Model = require "../lib/model"

module.exports = class PostModel extends Model
    urlRoot:  ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/post/'
    idAttribute: "resource_uri"

    matchesPlank: (plank) ->
        match = @get('post_type') is plank?.get('post_type')

PostModel.setup()