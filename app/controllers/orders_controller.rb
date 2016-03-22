class OrdersController < ApplicationController
  def create
    
    subtotal = Tea.find_by(id: params[:tea_id]).price.to_i * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.create({
      tea_id: params[:tea_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
      })
    #@order = Order.last
    # The above code would work but in cases where multiple users
    # are ordering stuff at the same time, the last order might not
    # be the one a user started.
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'

  end
end
