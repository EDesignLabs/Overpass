Model = require "../lib/model"

module.exports = class UserModel extends Model
    url: 'http://rocky-fortress-7457.herokuapp.com/api/v1/user/'

UserModel.setup()