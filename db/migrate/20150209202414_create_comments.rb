class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps
      t.text :body
      t.belongs_to :post
      t.belongs_to :user
    end
  end
end
