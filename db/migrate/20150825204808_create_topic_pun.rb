class CreateTopicPun < ActiveRecord::Migration
  def change
    create_table :topics_puns, id: false do |t|
      t.belongs_to :topic, null: false, index: true
      t.belongs_to :pun, null: false, index: true

      t.timestamps null: false
    end
  end
end
