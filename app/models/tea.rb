class Tea < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :carted_teas
  has_many :categorized_teas
  has_many :categories, through: :categorized_teas

  def reviews_list
    reviews.split('; ')
  end

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l: %M %p")
  end

  def sale_item
    if price <= 2
      return "Discount item!"
    else
      return "This item is not on sale yet suckah"
    end
  end

  def tax
    price * 0.09
  end
  # you do not need to make it @tax = price * 0.09 no need to make a variable
  # tax is a method - price refers to the attr reader which is a method!!!

  def total
    price + tax
  end


  def stock_message
    if stock == false
     return "This item is out of stock"
    else
    "In stock"
   end
  end

  def category_names
    names = []
    categories.each do |category|
      names << category.name
    end
    names.join(", ")
  end
end
