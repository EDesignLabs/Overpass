Model = require "../lib/model"

module.exports = class UserModel extends Model
    urlRoot:  ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/user/'

UserModel.setup()