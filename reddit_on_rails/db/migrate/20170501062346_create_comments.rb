class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false, index: true
      t.integer :post_id, null: false, index: true
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
