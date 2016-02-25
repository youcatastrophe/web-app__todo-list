MyApp.get "/todos/new" do
  @current_user = User.find_by_id(session["user_id"])

  if @current_user != nil  
    erb :"todos/new"
  else
    erb :"login_first"
  end 
end


MyApp.post "/todos/create" do 
  @current_user = User.find_by_id(session["user_id"])

  if @current_user != nil   
    @new_todo.completed = false
    @new_todo.name = params["title"]
    @new_todo.description = params["description"]
    @new_todo.user_id = session["user_id"]
    @new_todo.save
    erb :"todos/created"
  else  
    erb :"login_first"
  end
end 


MyApp.get "/todos/view_todo/:id" do
  @current_user = User.find_by_id(session["user_id"])

  if @current_todo != nil 
    @todo = Todo.find_by_id(params[:id])
    erb :"todos/view_todo"
  else 
    erb :"login_first"
  end
end

MyApp.get "/todos/edit/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/edit"
end

MyApp.post "/todos/process_edit/:id" do
  @current_todo = Todo.find_by_id(session["user_id"])

  if @current_todo != nil 
    @todo = Todo.find_by_id(params[:id]) 
    @todo.name = params["new_name"]
    @todo.email = params["new_email"]
    @todo.password = params["new_password"]
    @todo.save
    erb :"todos/update_successful"
  else
    erb :"login_first"
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