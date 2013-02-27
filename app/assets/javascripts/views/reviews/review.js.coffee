class FilmyBilly.Views.Review extends Backbone.View
  template: JST['reviews/show']
  
  render: ->
    this.setElement(@template(review: @model))
    this