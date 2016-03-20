class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :tea

  def subtotal
    tea.price * quantity
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + tax
  end
end
