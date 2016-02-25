MyApp.get "/todos/new" do
  erb :"todos/new"
end

MyApp.post "/todos/create" do 

  @new_todo = Todo.new
  @new_todo.completed = false
  @new_todo.title = params["title"]
  @new_todo.description = params["description"]
  @new_todo.user_id = session["user_id"]
  @new_todo.assigned_to = params["assigned_to"]
  @new_todo.save

  redirect "/todos/index"
end 

MyApp.get "/todos/index" do
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
    @todo.assigned_to = params["new_assigned_to"]
    @todo.save
    redirect "/todos/index"
end 

MyApp.post "/todos/:id/delete/" do
  @todo = Todo.find_by_id(params[:id])
  @todo.delete
  redirect "/homepage"
end 