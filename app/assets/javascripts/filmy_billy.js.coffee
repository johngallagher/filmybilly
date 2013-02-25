window.FilmyBilly =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new FilmyBilly.Routers.Reviews
    Backbone.history.start()

$(document).ready ->
  FilmyBilly.initialize()
