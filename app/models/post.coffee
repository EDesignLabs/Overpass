Model = require "../lib/model"

module.exports = class PostModel extends Model
    urlRoot:  $PROCESS_ENV_BASE_API_URL + '/api/v1/post/'

    matchesPlank: (plank) ->
        match = @get('post_type').id == plank?.get('post_type').id

PostModel.setup()