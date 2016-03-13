class TeasController < ApplicationController
 attr_reader :name, :price, :description, :reviews, :stars, :image

  def index
    @teas = Tea.all
    tea_id = params[:id]
    @teas = @teas.sort
    # @teas = @teas.sort_by('tea_id')
    #@teas.sort_by do |tea| #note the exclamation mark
    #tea[tea_id]
    #end 
   
    render "index.html.erb"
  end

  def show
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    render "show.html.erb"
  end

  def new
    render 'new.html.erb'
  end

  def create
    Tea.create({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
               })
    tea_id = params[:id]
    @tea = Tea.last
    flash[:success] = "Recipe successfully created"

    #render 'create.html.erb'
    redirect_to "/teas/#{@tea.id}"
  end

  def edit
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    render 'edit.html.erb'
  end

  def update
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    Tea.update(tea_id, {
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
               })
    #render 'update.html.erb'
    flash[:success] = "Recipe successfully updated"
    redirect_to "/teas/#{@tea.id}"
  end

  def destroy
    tea_id = params[:id]
    @tea = Tea.find_by(id: tea_id)
    @tea.destroy
    flash[:success] = "Recipe successfully deleted"

    #render 'destroy.html.erb'
    redirect_to '/teas'
  end
end
