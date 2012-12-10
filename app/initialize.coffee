# App Namespace
@Overpass ?= {}
Overpass.Routers ?= {}
Overpass.Views ?= {}
Overpass.Models ?= {}
Overpass.Collections ?= {}

$ ->
    # Load App Helpers
    require '../lib/app_helpers'

    # Initialize App
    Overpass.Views.AppView = new AppView = require 'views/app_view'

    # Initialize Backbone History
    Backbone.history.start
        pushState: true
        root: '/'
