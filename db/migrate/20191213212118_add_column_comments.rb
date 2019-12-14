class AddColumnComments < ActiveRecord::Migration[5.1]
  def change
    add_column :Comments, :color, :string
  end
end
