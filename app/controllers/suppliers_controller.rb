class SuppliersController < ApplicationController
  attr_reader :name, :email, :phone
  def index
    @suppliers = Supplier.all
  end
end