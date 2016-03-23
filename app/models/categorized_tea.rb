class CategorizedTea < ActiveRecord::Base
  belongs_to :tea
  belongs_to :category
end
