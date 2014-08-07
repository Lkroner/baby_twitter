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

# post '/login' do

# end
