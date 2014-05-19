App = require 'app'

###*
  Route YearCurrentRoute

  @class YearCurrentRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.YearRoute = Ember.Route.extend
  controllerName: 'calendar'
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###

  model: (params) ->
    @_super arguments...
    return params.year 
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  setupController: (controller, model) ->
    @_super arguments...
    controller.set 'year', model

  renderTemplate: ()->
    @render "year"  