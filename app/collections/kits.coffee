module.exports = class KitsCollection extends Backbone.Collection
    urlRoot: ($PROCESS_ENV_BASE_API_URL ||'') + '/api/v1/kit/'
    model: require 'models/kit'
