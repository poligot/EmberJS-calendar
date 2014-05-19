App = require 'app'


App.Router.map ->
  # put your routes here
  @route "home", {path: '/'}
  @resource "year", { path: 'year/:year' }, ()->
    @resource "month", { path: 'month/:month' }, ()->
      @resource "day", { path: 'day/:day'}