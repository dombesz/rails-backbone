class BackboneRails.Views.ProductsIndex extends Backbone.View

  template: JST['products/index']
  
  events:
    'click #add-product':'addProduct'

  initialize: ->
    _.bindAll(@, "render")
    @collection.on("add reset", @render)
    window.vent.on("products:add",(product)=>@collection.add(product))
    

  render: ->
    @$el.html(@template())
    @collection.each (product) ->
      productView = new BackboneRails.Views.ProductsShow({model: product})
      $('#products', @el).append(productView.render().el)    
    return @
    
  addProduct: =>
    @form = new BackboneRails.Views.ProductsForm({model:new BackboneRails.Models.Product()})
    @form.render().$el.appendTo($('#modal-container')).modal();
    false