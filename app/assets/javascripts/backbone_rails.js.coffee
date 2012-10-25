window.BackboneRails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

$(document).ready ->
  products_router = new window.BackboneRails.Routers.Products()
  Backbone.history.start()  