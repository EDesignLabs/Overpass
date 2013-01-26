ViewCollection = require '../lib/view_collection'
KitItemView = require './kit_item'

module.exports = class KitsView extends ViewCollection
    template: require 'views/templates/kits'
    className: 'kits'
    tagName: 'ul'

    view: KitItemView

    events:
        'add': 'addView'

    addView: (view)->
        console.log view

    render: ()=>
        super()
        console.log 'rendering'
        @renderAll()

