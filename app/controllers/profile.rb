get '/users' do
  # current_user
  # logged_in?
  current_user 
  erb :profile
end

post '/tweet' do 
	# does not route to new page
	# adds tweet to user instance 
end

get '/users/followers' do 
	# route to new page that displays current users followers
	erb :followers
end

get '/users/following' do
	# route to new page that displays users that current user is following
	erb :followees
end

get 'users/tweets' do 
	# route to new page that displays current users tweets
	erb :current_users_tweets
end


