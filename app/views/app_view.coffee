View        = require '../lib/view'
AppRouter   = require '../routers/app_router'

module.exports = class AppView extends View
    el: 'body.application'

    initialize: ->
        @router = new AppRouter()
        Overpass?.Routers?.AppRouter = @router

        super()
