class ValidateUserRatings < ActiveRecord::Migration
  def change
    add_foreign_key :ratings, :users
    add_foreign_key :ratings, :puns
    
  end
end
