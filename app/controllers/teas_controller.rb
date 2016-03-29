class TeasController < ApplicationController
  attr_reader :name, :price, :description, :reviews, :stars, :image, :supplier_id
  def index
  @teas = Tea.all
  tea_id = params[:id]
  sort_attribute = params[:sort]
  sort_order = params[:order]
  if sort_attribute && sort_order
    @teas = Tea.order(sort_attribute => sort_order)
  end

  discount_attribute = params[:discount]
  if discount_attribute != nil
    @teas = Tea.where("price <= ?", 5)
  end
  # above can be simplified to if params["discount"] == "true"
  
  search_for = params[:search]
  if search_for != nil
    @teas = Tea.where("name LIKE ? OR description LIKE ?", "%#{search_for}%", "%#{search_for}%")
  end
  
  if params[:category]
    @teas = Category.find_by(name: params[:category]).teas
  end
  render "index.html.erb"
  end

  def show
    tea_id = params[:id]
    if tea_id == "random"
      teas = Tea.all
      @tea = teas.sample
    else
      @tea = Tea.find_by(id: tea_id)
    end
    render "show.html.erb"
  end

  def new
    if current_user && current_user.admin
      render 'new.html.erb'
    else
      redirect_to '/teas'
    end
  end

  def create
    if current_user && current_user.admin
    Tea.create({
    name: params[:name],
    price: params[:price],
    description: params[:description],
    stock: params[:stock],
    supplier_id: params[:supplier_id]
               }) 
    tea_id = params[:id]
    @tea = Tea.last
    flash[:success] = "Tea listing successfully created"

    redirect_to "/teas/#{@tea.id}"

    else 
      redirect_to '/teas'
    end
  end

  def edit
    if current_user && current_user.admin
      tea_id = params[:id]
      @tea = Tea.find_by(id: tea_id)
      render 'edit.html.erb'
    else
      redirect_to '/teas'
    end

  end

  def update
    if current_user && current_user.admin
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    Tea.update(tea_id, {
      name: params[:name],
      price: params[:price],
      description: params[:description],
      stock: params[:stock],
      supplier_id: params[:supplier_id]

               })
    flash[:success] = "Tea listing successfully updated"
    redirect_to "/teas/#{@tea.id}"
    else
      redirect_to '/teas'
    end
  end

  def destroy
    if current_user && current_user.admin
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    @tea.destroy
    flash[:success] = "Tea listing successfully deleted"

    redirect_to '/teas'
  else
    redirect_to '/teas'
  end
  end
end
