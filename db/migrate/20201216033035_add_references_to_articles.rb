class AddReferencesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, null: false, foreign_key: true
    add_column :articles, :content, :text, null: false
  end
end
