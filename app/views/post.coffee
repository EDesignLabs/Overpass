View = require '../lib/view'
PostModel = require '../models/post'
template = require 'views/templates/post'

module.exports = class PostView extends View
    template: template
    tagName: 'li'
    className: 'post'
    attributes:
        ondrop: "drop(event)"
        ondragover: "allowDrop(event)"

    model: new PostModel()
