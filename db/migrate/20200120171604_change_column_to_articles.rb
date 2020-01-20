class ChangeColumnToArticles < ActiveRecord::Migration[5.1]
  def change
remove_reference :articles, :user_id, index: true, foreign_key: true
  end
end
