window.BackboneRails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
window.vent =  _.extend({}, Backbone.Events)

$(document).ready ->
  products_router = new window.BackboneRails.Routers.Products()

  cart = new window.BackboneRails.Views.CartShow()

  $("#sidebar-content").html(cart.render().el);
  Backbone.history.start()
