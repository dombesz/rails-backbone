class BackboneRails.Views.ProductsShow extends Backbone.View

  template: JST['products/show']
  
  events:
    'click img': 'edit'
    'click .buy' : 'addToCart'
  
  initialize: ->
    @model.on("change", @render, @)
    # @model.on("remove", @close, @)

  addToCart: =>
    window.vent.trigger("cart:add", @model)
  
  render: ->
    @$el.html(@template({model:@model}))
    return @
  
  edit: =>
    @form = new BackboneRails.Views.ProductsForm({model:@model})
    @form.render().$el.appendTo($('#modal-container')).modal();
    false
    
  close: ->
    @unbind()
    @remove()