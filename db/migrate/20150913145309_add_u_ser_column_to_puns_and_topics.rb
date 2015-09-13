class AddUSerColumnToPunsAndTopics < ActiveRecord::Migration
  def change
    add_column :topics, :user_id, :integer, null: false, default: 1
    add_column :puns, :user_id, :integer, null: false, default: 1
    add_column :requests, :user_id, :integer, null: false, default: 1
    add_column :ratings, :user_id, :integer, null: false, default: 1
  end
end
