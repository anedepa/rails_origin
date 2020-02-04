class AddcolortoArticle < ActiveRecord::Migration[5.1]
  def change
   add_column :Articles, :color, :string
  end
end
