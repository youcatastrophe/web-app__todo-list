# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/logins/new" do
  #Display login form to user  
  erb :"logins/new"
end

MyApp.post "/logins/create" do
  @user = User.find_by_email(params["email"])
  if @user != nil
    if @user.password == params["password"]
      session["user_id"] = @user.id

      erb :"logins/success"
    end
  else
      erb :"logins/failed"
  end
end

MyApp.post "/logins/delete" do
  session["user_id"] = nil
  erb :"logins/logged_out"
end 