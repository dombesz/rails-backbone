class BackboneRails.Views.CartItem extends Backbone.View
  template: JST['cart/show']
  tagName: 'li'
  events:
    "click .icon-remove" : 'close'
  initialize:=>
    @_modelBinder = new Backbone.ModelBinder();
  
  render: =>
    @$el.html(@template({model:@model}))
    @_modelBinder.bind(@model, @el);
    @
  close: =>
    window.vent.trigger("cart:remove", @model);
    @unbind()
    @remove()