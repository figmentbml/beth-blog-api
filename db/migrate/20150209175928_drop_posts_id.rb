class DropPostsId < ActiveRecord::Migration
  def change
    remove_column :users, :posts_id
  end
end
