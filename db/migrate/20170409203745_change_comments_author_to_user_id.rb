class ChangeCommentsAuthorToUserId < ActiveRecord::Migration
  def change
    remove_column :comments, :author
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
