class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :bio

      t.timestamps
    end

    create_table :tweets do |t|
      t.belongs_to :user
      t.string :content
      t.integer :retweet_id, default: nil

      t.timestamps
    end
  end
end
