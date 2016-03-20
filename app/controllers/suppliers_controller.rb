class SuppliersController < ApplicationController
  attr_reader :name, :email, :phone
  def index
    @suppliers = Supplier.all
  end

  def new
    render 'new.html.erb'
  end

  def create
    Supplier.create({
    name: params[:name],
    phone: params[:phone],
    email: params[:email],
               }) 
    supplier_id = params[:id]
    @supplier = Supplier.last
    flash[:success] = "Supplier listing successfully created"

    #render 'create.html.erb'
    redirect_to "/suppliers"
  end

  def edit
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    render 'edit.html.erb'
  end

  def update
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    Supplier.update(supplier_id, {
      name: params[:name],
      phone: params[:phone],
      email: params[:email]
               }) 
    supplier_id = params[:id]
    # render 'update.html.erb'
    flash[:success] = "Supplier listing successfully updated"
    redirect_to "/suppliers"
  end

  def destroy
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)
    @supplier.destroy
    flash[:success] = "Supplier listing successfully deleted"

    # render 'destroy.html.erb'
    redirect_to '/suppliers'
  end
end