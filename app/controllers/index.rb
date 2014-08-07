get '/' do
  erb :index
end

post '/signup' do
  user = User.new(name => params[:name],
                  email => params[:email],
                  handle => params[:handle],
                  bio => params[:bio])
  user.password = params[:password]
  user.save!
end

post '/login' do
  user = User.find_by(handle: params[:handle])
  if user == nil
    @error = "Your handle is incorrect"
    erb :error
  elsif user.password != params[:password]
    @error = "Your password is incorrect"
    erb :error
  else
    session[:user_id] = user.id
    redirect '/'
  end
end


delete '/logout' do


end
