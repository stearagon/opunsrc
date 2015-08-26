class CreateTopicPun < ActiveRecord::Migration
  def change
    create_table :topics_puns, id: false do |t|
      t.integer :topic_id, null: false, index: true
      t.integer :pun_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
