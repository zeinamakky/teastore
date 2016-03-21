class OrdersController < ApplicationController
  def create
    
    subtotal = Tea.find_by(id: params[:tea_id]).price.to_i * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    Order.create({
      tea_id: params[:tea_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
      })
    @order = Order.last

    render 'show.html.erb'
  end
end
