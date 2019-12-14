class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :img_name
      t.text :contents

      t.timestamps
    end
  end
end
