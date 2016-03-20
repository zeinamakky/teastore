class OrdersController < ApplicationController
  def create
    Order.create({
      tea_id: params[:tea_id],
      user_id: current_user.id,
      quantity: params[:quantity]
      })
    @order = Order.last

    render 'show.html.erb'
  end
end
