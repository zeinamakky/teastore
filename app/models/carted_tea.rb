class CartedTea < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  belongs_to :tea

  def calc_subtotal
    tea.price * quantity
  end

  def calc_tax
    subtotal * 0.09
  end

  def calc_total
    subtotal + tax
  end
end
