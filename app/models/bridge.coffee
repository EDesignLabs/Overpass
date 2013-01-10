Model = require "../lib/model"
PostModel = require "models/post"
PlankModel = require "models/plank"
PostsCollection = require "collections/posts"
PlanksCollection = require "collections/planks"

class BridgeModel extends Model
    #for the moment, we're not actually cloning bridges
    #so, we use the level to fake it
    urlRoot: ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/level/'
    urlRoot: ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/level/'
    urlRoot: ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/level/'
    urlRoot: ($PROCESS_ENV_BASE_API_URL||'') + '/api/v1/level/'

    relations: [
        type: Backbone.HasMany
        key: 'planks'
        relatedModel: PlankModel
        collectionType: PlanksCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: false
    ,
        type: Backbone.HasMany
        key: 'posts'
        relatedModel: PostModel
        collectionType: PostsCollection
        includeInJSON: true
        reverseRelation:
            type: Backbone.HasOne
            key: 'bridge'
            includeInJSON: false
    ]

    matchLanes: =>
         #find the lanes established in the posts
        postGroups = @get('posts').groupBy (post)=>
            post.get 'lane'

        lanes = (parseInt(key, 10) for key of postGroups)

        minLane = _.min lanes
        maxLane = _.max lanes

        matchLanes = _.every postGroups, (postGroup)=>
            #all the planks are present and real or have an optional setting
            realPlanks = _.every postGroup, (post)=>
                #the plank has to be in place
                exists = true if post.get 'plank'
                #it can't have a lane higher than the highest in the posts
                real = true if post.get('plank')?.get('lane') <= maxLane
                #it can be changable, indicated by being lower than the lowest
                changable = true if post.get('plank')?.get('lane') < minLane

                exists and (real or changable)

            #count the non-optional planks by lane
            nonOptionalPlanks = _.filter postGroup, (post)=>
                post.get('plank')?.get('lane') >= minLane

            laneGroups = _.groupBy nonOptionalPlanks, (post)=>
                post.get('plank')?.get('lane')

            #only one lane exists?
            oneLane = _.size(laneGroups) is 1

            realPlanks and oneLane
       
    matchTypes: =>
        #match the types
        matchTypes = @get('posts').every (post) =>
            plank = post.get 'plank'
            if plank
                post.matchesPlank(plank)
            else
                no

    check: =>
        # check to make sure planks are grouped together
        @matchTypes() and @matchLanes()


BridgeModel.setup()

module.exports = BridgeModel