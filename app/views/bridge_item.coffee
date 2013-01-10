View = require '../lib/view'

module.exports = class BridgeItemView extends View
    template: require 'views/templates/bridge_item'

    tagName: 'li'

    className: 'bridge-item'

    initialize: ->
        super arguments
        @model.on 'change:title', =>
            @onChangeModelTitle()

    afterRender: ->
        @$el.attr 'id', 'bridge-' + @cid

    onChangeModelTitle: () ->
        @render()
