View = require '../lib/view'
UserModel = require '../models/user'

module.exports = class UserView extends View
    template: require 'views/templates/user'

    model: new UserModel()
