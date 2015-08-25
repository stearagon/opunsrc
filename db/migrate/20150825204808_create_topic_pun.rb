class CreateTopicPun < ActiveRecord::Migration
  def change
    create_table :topic_puns do |t|
      t.integer :topic_id, null: false
      t.integer :pun_id, null: false

      t.timestamps null: false
    end

    add_index :topic_puns, :topic_id, unique: true
    add_index :topic_puns, :pun_id, unique: true
  end
end
