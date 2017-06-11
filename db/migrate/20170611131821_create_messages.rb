class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, index: true, null: false
      t.timestamps
    end
  end
end
