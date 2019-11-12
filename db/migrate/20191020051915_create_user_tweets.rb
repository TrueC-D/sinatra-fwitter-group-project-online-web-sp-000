class CreateUserTweets < ActiveRecord::Migration
  def change
    create_table :user_tweets do |t|
      t.integer :user_id
      t.integer :tweet_id

    end
  end
end

# class AddTweetsTimestampColumn < ActiveRecord::Migration
#   def change
#     add_column :tweets, :created_at, :datetime, null: false
#     add_colun :users, :updated_at, :datetime, null: false
#   end
# end
