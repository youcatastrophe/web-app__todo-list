MyApp.get "/users/new" do 
  erb :"users/new"
end 


MyApp.before "/users*" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user == nil
    redirect "/logins/new"
  end
end 

MyApp.get "/users" do
  @users = User.all
  erb :"users/index"
end


MyApp.post "/users/create" do 
  @new_user = User.new
  @new_user.name = params["name"]
  @new_user.email = params["email"]
  @new_user.password = params["password"]
  @new_user.save

  redirect "/users/#{@new_user.id}"
end 

MyApp.get "/users/:id" do
  @user = User.find_by_id(params[:id])
  erb :"users/show"
end


MyApp.get "/users/:id/edit" do
  @user = User.find_by_id(params[:id])
  erb :"users/edit"
end

MyApp.post "/users/:id/update" do
  @current_user = User.find_by_id(session["user_id"])

  @current_user != nil 
  @user = User.find_by_id(params[:id]) 
  @user.name = params["new_name"]
  @user.email = params["new_email"]
  @user.password = params["new_password"]
  @user.save

  redirect "/users/#{user.id}"
end 

MyApp.post "/users/:id/delete/" do
  @user = User.find_by_id(params[:id])
  @user.delete
  redirect "/"
end 


