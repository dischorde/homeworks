class ChangeSub < ActiveRecord::Migration
  def change
    remove_column :posts, :url
    add_column :subs, :url, :string
  end
end
