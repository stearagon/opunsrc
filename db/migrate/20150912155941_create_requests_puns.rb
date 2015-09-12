class CreateRequestsPuns < ActiveRecord::Migration
  def change
    create_table :requests_puns, id: false do |t|
      t.integer :request_id, null: false, index: true
      t.integer :pun_id, null: false, index: true

      t.timestamps
    end
  end
end
