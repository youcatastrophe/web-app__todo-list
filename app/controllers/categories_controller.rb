MyApp.before "/categories*" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user == nil
    redirect "/logins/new"
  end
end 

MyApp.get "/categories/new" do
  erb :"categories/new"
end

MyApp.post "/categories/create" do 

  @new_category = Category.new
  @new_category.name = params["name"]
  @new_category.save

  redirect "/categories"
end 

MyApp.get "/categories" do
  @categories = Category.all
  erb :"categories/index"
end

MyApp.get "/categories/:id" do
  @category = Category.find_by_id(params[:id])
  erb :"categories/show"
end

MyApp.get "/categories/:id/edit" do
  @category = Category.find_by_id(params[:id])
  erb :"categories/edit"
end

MyApp.post "/categories/:id/update" do
    @category = Category.find_by_id(params[:id]) 
    @category.name = params["new_name"]
    @category.save
    redirect "/categories/#{@category.id}"
end 

MyApp.post "/categories/:id/delete/" do
  @category = Category.find_by_id(params[:id])
  @category.delete
  redirect "/homepage"
end 

MyApp.get "/categories/:id/associated_todos" do
  
end 