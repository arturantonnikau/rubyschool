require 'sinatra'

get "/" do
  erb :index
end

get "/admin" do
  erb :admin
end

post "/admin" do
  @user = params[:user].strip
  @pass = params[:pass].strip

  @file = File.open("users.txt", "r")

  if @user == "archi" && @pass == "301191"  
    erb :file
  else
    @file.close
    @fail_access = "Sorry, this is invalid user or password!"
    erb :file
  end
end

post "/" do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Thank you!"
  @message = "Dear #{@user_name}, we`ll be waiting for you at #{@date_time} "

  file = File.open("users.txt", "a")
  file.write("#{@user_name},#{@phone},#{@date_time}\n")
  file.close

  erb :message
end
