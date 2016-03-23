class Category < ActiveRecord::Base
  has_many :categorized_teas
  has_many :teas, through: :categorized_teas

  
end
