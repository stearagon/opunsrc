class CreatePuns < ActiveRecord::Migration
  def change
    create_table :puns do |t|

      t.timestamps null: false
    end
  end
end
