MyApp.get "/todos/new" do
  @current_user = User.find_by_id(session["user_id"])

  if @current_user != nil  
    erb :"todos/new"
  else
    erb :"login_first"
  end 
end


MyApp.post "/todos/create" do 

    @new_todo = Todo.new
    @new_todo.completed = false
    @new_todo.title = params["title"]
    @new_todo.description = params["description"]
    @new_todo.user_id = session["user_id"]
    @new_todo.save
    erb :"todos/created"
end 


MyApp.get "/todos/view_todo/:id" do
    @todo = Todo.find_by_id(params[:id])
    erb :"todos/view_todo"
end

MyApp.get "/todos/edit/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/edit"
end

MyApp.post "/todos/process_edit/:id" do
  @current_todo = Todo.find_by_id(session["user_id"])

    @todo = Todo.find_by_id(params[:id]) 
    @new_todo.completed = false
    @new_todo.title = params["title"]
    @new_todo.description = params["description"]
    @new_todo.user_id = session["user_id"]
    @new_todo.save
    erb :"todos/created"
  end 
end 

MyApp.get "/todos/delete/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/delete"
end 

MyApp.post "/todos/process_delete/:id" do
  @todo = Todo.find_by_id(params[:id])
  @todo.delete
  erb :"todos/update_successful"
end 