class FilmyBilly.Views.ReviewsIndex extends Backbone.View

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    for review in @collection.models
      @appendReview(review)
    
    this

  appendReview: (review) =>
    view = new FilmyBilly.Views.Review(model: review)
    $('#reviews').append(view.render().el())

