class BackboneRails.Views.ProductsForm extends Backbone.View
  template: JST['products/form']
  className: 'modal fade'
  events:
    "hidden" : 'remove' #the "hidden" event is from bootstrap modal dismiss
    "submit .product-form": 'save'
  initialize: ->
    @_modelBinder = new Backbone.ModelBinder();

  save: =>
    self = @;
    was_new = @model.isNew()
    @model.save({},
      success:->
        if was_new
          window.vent.trigger("products:add", self.model);
        self.$el.modal('hide');
    )
    false
  render: =>  
    @$el.html(@template({model:@model}))
    @_modelBinder.bind(@model, @el);
    @