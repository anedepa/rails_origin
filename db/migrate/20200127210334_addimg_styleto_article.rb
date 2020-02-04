class AddimgStyletoArticle < ActiveRecord::Migration[5.1]
  def change
   add_column :Articles, :img_style, :string
  end
end
