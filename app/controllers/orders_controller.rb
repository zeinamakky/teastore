class OrdersController < ApplicationController
  def create
    carted_teas = CartedTea.where(status: 'carted', user_id: current_user.id)
    subtotal = 0
    carted_teas.each do |carted_tea|
      subtotal += carted_tea.calc_subtotal
    end
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.create({
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,

      })
    carted_teas.each do |carted_tea|
      carted_tea.update({
        status: "purchased",
        order_id: @order.id
        })
    end
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
