class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars, null: false
      t.integer :pun_id, null: false

      t.timestamps
    end
  end
end
