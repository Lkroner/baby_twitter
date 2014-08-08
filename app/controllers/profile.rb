get '/users' do
  # current_user
  # logged_in?
  @user = current_user
  @handle = @user.handle
  @id = @user.id
  @name = @user.name
  @bio = @user.bio
  # @followees_tweets = @user.followees.tweets
  erb :profile
end

post '/tweet' do
	# does not route to new page
	# adds tweet to user instance
  new_tweet = Tweet.new(content: params[:content])
  new_tweet[:user_id] = current_user.id
  new_tweet.save
	redirect "/users/#{current_user.id}"
end

get '/users/search' do
  # route to new page that displays current users tweets
  @users = User.all
  erb :search_users
end

get '/users/:id' do
   # current_user
  # logged_in?
  @user = User.find(params[:id])
  @handle = @user.handle
  @id = @user.id
  @name = @user.name
  @bio = @user.bio
  # @followees_tweets = @user.followees.tweets
  erb :profile
end

get '/users/:id/followers' do
  # route to new page that displays current users followers
  user = User.find(params[:id])
  @followers = user.followers
  erb :followers
end

get '/users/:id/following' do
  # route to new page that displays users that current user is following
  user = User.find(params[:id])
  @followees = user.followees
  erb :followees
end

get '/users/:id/tweets' do
  # route to new page that displays current users tweets
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :current_users_tweets
end

post '/users/:id/follow' do 
  @user = current_user
  followee = User.find(params[:id])
  @user.add_followee(followee)
  redirect "/users/#{params[:id]}" 
end


post '/users/:id/unfollow' do 
  @user = current_user
  followee = User.find(params[:id])
  followee.followers.delete(@user.id)
  redirect "/users/#{params[:id]}" 
end



