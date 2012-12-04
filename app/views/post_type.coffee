View = require '../lib/view'
PostTypeModel = require '../models/post_type'

module.exports = class PostTypeView extends View
    template: require 'views/templates/post_type'

    model: new PostTypeModel()
