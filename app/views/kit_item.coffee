View = require '../lib/view'

module.exports = class KitItemView extends View
    template: require 'views/templates/kit_item'

    className: 'kit-item'
    tagName: 'li'
