class CreateTweets < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
    end
  end
end
