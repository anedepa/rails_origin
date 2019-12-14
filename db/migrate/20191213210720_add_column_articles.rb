class AddColumnArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :color, :string
    add_column :articles, :img_style, :string
  end
end
