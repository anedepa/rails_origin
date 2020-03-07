class AddColumnArticles < ActiveRecord::Migration[5.1]
  def change
add_column :articles, :author, :integer
  end
end
