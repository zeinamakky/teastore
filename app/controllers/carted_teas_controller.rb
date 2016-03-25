class CartedTeasController < ApplicationController
  def create
    @carted_tea = CartedTea.create ({
      tea_id: params[:tea_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: params[:status],
    })

     redirect_to "/cart/#{@carted_tea.id}"
  end

  def index
    @carted_teas = CartedTea.where(status: "carted", user_id: current_user.id)
    render 'index.html.erb'
  end

end
