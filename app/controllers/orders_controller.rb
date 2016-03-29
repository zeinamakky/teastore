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

    carted_teas.update_all(status: "purchased", order_id: @order.id)
    # the above is more efficient than doing another loop bc you're not hitting the database
    # every single time
    
    
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'

  end


end
