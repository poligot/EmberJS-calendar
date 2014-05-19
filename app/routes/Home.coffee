App = require 'app'

###*
  Route HomeRoute

  @class HomeRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.HomeRoute = Ember.Route.extend
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  beforeModel: ()->
    now = new Date()
    year  = now.getFullYear()
    month = now.getMonth()
    month+=1
    day   = now.getDate()
    @transitionTo('day', year, month, day)
  model: (params) ->
    @_super arguments...

  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  setupController: (controller, model) ->
    @_super arguments...