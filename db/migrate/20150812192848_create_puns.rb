class CreatePuns < ActiveRecord::Migration
  def change
    create_table :puns do |t|
      t.string :term, null: false
      t.string :pun, null: false
      t.string :example, null: false

      t.timestamps null: false
    end

    add_index :puns, :term, unique: true
  end
end
