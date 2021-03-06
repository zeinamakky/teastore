class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_teas
  has_many :teas, through: :carted_teas

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
