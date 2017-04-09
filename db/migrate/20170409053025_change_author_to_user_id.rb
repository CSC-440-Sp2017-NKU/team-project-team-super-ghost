class ChangeAuthorToUserId < ActiveRecord::Migration
  def change
    remove_column :posts, :author
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
