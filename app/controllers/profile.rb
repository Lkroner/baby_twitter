get '/users' do
  # current_user
  # logged_in?
  @user = current_user
  p "user + #{@user}"
  @handle = @user.handle 
  @id = @user.id 
  @name = @user.name 
  @bio = @user.bio
  # @followees_tweets = @user.followees.tweets 
  erb :profile
end

# post '/tweet' do
# 	# does not route to new page
# 	# adds tweet to user instance
#   new_tweet = Tweet.new(params)
#   new_tweet[:user_id] = session[:user_id]
#   new_tweet.save
		# redirect '/users'
# end

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


