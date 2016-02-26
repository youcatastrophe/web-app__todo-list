MyApp.before "/todos*" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user == nil
    redirect "/logins/new"
  end
end 

MyApp.get "/todos/new" do
  @categories = Category.all  
  erb :"todos/new"
end

MyApp.post "/todos/create" do 

  @new_todo = Todo.new
  @new_todo.completed = false
  @new_todo.title = params["title"]
  @new_todo.description = params["description"]
  @new_todo.user_id = session["user_id"]
  @new_todo.assigned_to_id = params["assigned_to_id"]
  @new_todo.save

  redirect "/todos"
end 

MyApp.get "/todos" do
  @todos = Todo.all
  erb :"todos/index"
end

MyApp.get "/todos/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/show"
end

MyApp.get "/todos/:id/edit" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/edit"
end

MyApp.post "/todos/:id/update" do

    @todo = Todo.find_by_id(params[:id]) 
    @todo.completed = false
    @todo.title = params["new_title"]
    @todo.description = params["new_description"]
    @todo.assigned_to_id = params["new_assigned_to_id"]
    @todo.save
    redirect "/todos/#{@todo.id}"
end 

MyApp.post "/todos/:id/delete/" do
  @todo = Todo.find_by_id(params[:id])
  @todo.delete
  redirect "/homepage"
end 