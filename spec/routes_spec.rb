require 'spec_helper'

describe "Routes" do
  it "should successfully get '/'" do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it "should have no session on initial login" do
    get '/'
    expect(session[:user_id]).to be_nil
  end

  describe "post /signup" do
    it "succesfully adds user to database on signup" do
      User.delete_all
      expect {
        post "/signup", :name => "yohan"
      }.to change {User.count}
    end
  end

  describe "wrong login goes to error" do
    it "should go to error page" do
      post "/login", handle: "bozo", password: "clown"
      expect(last_response.body).to include("You fucked up.")
    end
  end

  describe "post /tweet" do
    it "succesfully adds tweet to database on tweet" do
      brohan = User.create(name: "Yohan", handle: "brohan")
      session[:user_id] = 2
      Tweet.delete_all
      expect {
        post "/tweet", :content => "fuck this tweet"
      }.to change {Tweet.count}
    end
  end
end
