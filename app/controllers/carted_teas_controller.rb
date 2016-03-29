class CartedTeasController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @carted_tea = CartedTea.create ({
      tea_id: params[:tea_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: params[:status],
      # status comes from hidden text field tag in form but could just be a string called 'carted' here
    })

     redirect_to "/cart/#{@carted_tea.id}"
  end

  def index
     @carted_teas = where(status: "carted", user_id: current_user.id)
    # or you could write current_user.carted_teas.where(status: "carted")
    if @carted_teas[0] == nil
      redirect_to "/teas"
      flash[:success] = "You have no items in your cart"

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
