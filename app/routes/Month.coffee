App = require 'app'

###*
  Route MonthCurrentRoute

  @class MonthCurrentRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.MonthRoute = Ember.Route.extend
  controllerName: 'calendar'
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  model: (params) ->
    @_super arguments...
    return params.month
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  setupController: (controller, model) ->
    @_super arguments...
    controller.set 'month', model

  renderTemplate: ()->
    @render "month" 