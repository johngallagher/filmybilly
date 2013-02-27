class FilmyBilly.Views.Review extends Backbone.View
  template: JST['reviews/show']
  tagName: 'li'
  
  render: ->
    $(@el).html(@template(review: @model))
    this