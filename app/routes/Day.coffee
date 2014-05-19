App = require 'app'

###*
  Route DayCurrentRoute

  @class DayCurrentRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.DayRoute = Ember.Route.extend
  controllerName: 'calendar'
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  model: (params) ->
    @_super arguments...
    return params.day
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  setupController: (controller, model) ->
    @_super arguments...
    controller.set 'day', model

  renderTemplate: ()->
    @render "day"