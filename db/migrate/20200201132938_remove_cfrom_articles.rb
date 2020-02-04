class RemoveCfromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :img_name, :string
    remove_column :articles, :author, :integer
  end
end
