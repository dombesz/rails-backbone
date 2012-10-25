class BackboneRails.Views.ProductsIndex extends Backbone.View

  template: JST['products/index']

  initialize: ->
    _.bindAll(@, "render")
    @collection.on("add remove reset", @render)

  render: ->
    @$el.html(@template())
    @collection.each (product) ->
      productView = new BackboneRails.Views.ProductsShow({model: product})
      $('#products', @el).append(productView.render().el)    
    return @