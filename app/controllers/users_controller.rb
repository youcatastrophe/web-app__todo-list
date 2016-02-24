MyApp.get "/users/new" do 
  erb :"users/new"
end 

MyApp.post "/users/create" do 
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email "]
  @user.password = params["password"]
  @user.save

  erb :"users/created"
end 

MyApp.get "/users/edit" do
  @user = User.find_by_email(params["email"])
  erb :"users/edit"
end