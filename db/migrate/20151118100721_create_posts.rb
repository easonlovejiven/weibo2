class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.boolean :published, default: false

      t.timestamps null: false
    end
    add_index :posts, :published
  end
end
