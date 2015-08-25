class CreateTopicPun < ActiveRecord::Migration
  def change
    create_table :topic_puns do |t|
      t.integer :topic_id, null: false
      t.integer :pun_id, null: false

      t.timestamps null: false
    end
  end
end
