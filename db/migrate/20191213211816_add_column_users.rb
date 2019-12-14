class AddColumnUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :Users, :color, :string
  end
end
