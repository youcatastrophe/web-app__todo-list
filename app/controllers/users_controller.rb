MyApp.get "/users/new" do 
  erb :"users/new"
end 

MyApp.post "/users/create" do 
  @new_user = User.new
  @new_user.name = params["name"]
  @new_user.email = params["email"]
  @new_user.password = params["password"]
  @new_user.save

  erb :"users/created"
end 

MyApp.get "/users/view_user/:id" do
  @current_user = User.find_by_id(session["user_id"])

  if @current_user != nil 
    @user = User.find_by_id(params[:id])
    erb :"users/view_user"
  else 
    erb :"login_first"
  end
end

MyApp.get "/users/edit/:id" do
  @user = User.find_by_id(params[:id])
  erb :"users/edit"
end

MyApp.post "/users/process_edit/:id" do
  @current_user = User.find_by_id(session["user_id"])

  if @current_user != nil 
    @user = User.find_by_id(params[:id]) 
    @user.name = params["new_name"]
    @user.email = params["new_email"]
    @user.password = params["new_password"]
    @user.save
    erb :"users/update_successful"
  else
    erb :"login_first"
  end 
end 

MyApp.get "/users/delete/:id" do
  @user = User.find_by_id(params[:id])
  erb :"users/delete"
end 

MyApp.post "/users/process_delete/:id" do
  @user = User.find_by_id(params[:id])
  @user.delete
  erb :"users/update_successful"
end 