class BackboneRails.Models.Product extends Backbone.Model
  defaults:
    image_url: "http://localhost:3000/images/placeholder.png"
    count: 10
    price: 100
  url: -> "products/#{@id||''}"