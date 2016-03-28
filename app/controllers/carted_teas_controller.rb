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
    if @carted_teas[0] == nil
      redirect_to "/teas"

    else
      render 'index.html.erb'
    end
  end
  
  def update
    @carted_teas = CartedTea.where(status: "carted", user_id: current_user.id)
    tea_id = params[:id]
    CartedTea.update(tea_id, {
     status: "removed"
    })
    flash[:success] = "Item successfully removed"
    redirect_to '/cart'
  end
end
