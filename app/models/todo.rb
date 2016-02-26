class Todo < ActiveRecord::Base
  def category_name
    x = self.category_id
    y = Category.find_by_id(x)
    y.name
  end 
end