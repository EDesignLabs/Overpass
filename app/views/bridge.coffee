View = require '../lib/view'
BridgeModel = require '../models/bridge'

module.exports = class BridgeView extends View
    template: require 'views/templates/bridge'

    model: new BridgeModel()
