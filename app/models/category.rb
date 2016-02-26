class Category < ActiveRecord::Base
  def associated_todos
    x = self.id
    y = Todo.where("category_id" => x)
    y
  end 
end