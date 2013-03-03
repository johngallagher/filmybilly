class FilmyBilly.Routers.Reviews extends Backbone.Router
  routes:
    '': 'index'
    'reviews/:id': 'show'

  initialize: ->
    @collection = new FilmyBilly.Collections.Reviews()
    @collection.fetch()

  index: ->
    view = new FilmyBilly.Views.ReviewsIndex(collection: @collection)
    $('#reviews').html(view.render().el)
