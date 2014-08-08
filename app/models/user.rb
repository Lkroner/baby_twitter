require 'bcrypt'
class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  has_many :tweets
  has_many :followings
  has_many :followers, :through => :followings#, :source => 'followee'

  # has_many :followings


  def followees
    followees = []
    User.all.each do |user|
      followees << user if user.followers.include? User.find(self.id)
    end
    followees
  end

  def add_followee(followee)
    followee.followers << self
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def news_feed
    feed = []
    self.followees.each do |f|
      f.tweets.each do |t|
        feed << t
      end
    end
    feed = feed.sort_by(&:created_at).reverse
  end
end
