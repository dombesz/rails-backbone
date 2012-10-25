class BackboneRails.Views.ProductsShow extends Backbone.View

  template: JST['products/show']
  
  initialize: ->
    @model.on("change", @render, @)
    @model.on("remove", @close, @)

  render: ->
    @$el.html(@template({model:@model}))
    return @
    
  close: ->
    @unbind()
    @remove()