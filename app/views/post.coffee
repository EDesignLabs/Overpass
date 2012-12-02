View = require '../lib/view'
PostModel = require '../models/post'

module.exports = class PostView extends View
    template: require 'views/templates/post'

    model: new PostModel()
