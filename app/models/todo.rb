class Todo < ActiveRecord::Base
  def category_name
    x = self.category_id
    y = Category.find_by_id(x)
    y.name
  end 

  def user_name
    x = self.user_id
    y = User.find_by_id(x)
    y.name
  end 

  def assigned_to_name
    x = self.assigned_to_id
    y = User.find_by_id(x)
    y.name
  end 
end