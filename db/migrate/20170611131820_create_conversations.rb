class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.belongs_to :sender, class_name: :user, index: true, null: false
      t.belongs_to :receiver, class_name: :user, index: true, null: false

      t.timestamps
    end
  end
end
