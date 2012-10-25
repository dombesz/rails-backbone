class BackboneRails.Routers.Products extends Backbone.Router
  routes:
    '' : 'index'    

  index: ->
    @products = new BackboneRails.Collections.Products()
    @productsPage = new BackboneRails.Views.ProductsIndex(collection:@products)
    @products.fetch()
    $("#body-content").html(@productsPage.el)