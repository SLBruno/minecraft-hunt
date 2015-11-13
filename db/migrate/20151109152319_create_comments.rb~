class CreateComments < ActiveRecord::Migration
  
    def change
    create_table :comments do |t|
      t.integer :video_id
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :comments, :video_id
  end
end
