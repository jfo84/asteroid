class AddTextToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :text, :string
  end
end
