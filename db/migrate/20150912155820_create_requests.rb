class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
