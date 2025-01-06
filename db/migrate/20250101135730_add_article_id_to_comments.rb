class AddArticleIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :articles, null: false, foreign_key: true
  end
end
