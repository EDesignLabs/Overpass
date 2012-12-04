Model = require "../lib/model"

module.exports = class PostModel extends Model
    url: '/api/overpass/v1/post'

PostModel.setup()