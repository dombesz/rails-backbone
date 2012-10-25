class BackboneRails.Views.CartShow extends Backbone.View
  template: JST['cart/index']
  initialize:->
    @collection = new Backbone.Collection();
    window.vent.on("cart:add", (product)=>@collection.add(product))
    window.vent.on("cart:remove", (product)=>@collection.remove(product))
    @collection.on("add", @addProduct)
    @collection.on("remove", @removeProduct)
    @collection.on("add remove", @calculateTotal)
      
  addProduct:(product)=>
    product.set('count', product.get('count')-1)
    itemView = new BackboneRails.Views.CartItem({model:product})
    $("#cart-items", @$el).append(itemView.render().el)        

  removeProduct:(product)=>
    product.set('count', product.get('count')+1)

  calculateTotal: =>
    total = 0
    _.each(@collection.pluck("price"), (price)=>
      if price>0
        total+=price
    )
    #show, hide empty message
    $("#cart-items li:first", @$el).toggle(@collection.length==0)    
    $(".cart-total", @el).html(total)

  render:=>
    @$el.html(@template())
    @