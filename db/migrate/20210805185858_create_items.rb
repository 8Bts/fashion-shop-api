class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :image
      t.string :img_public_id

      t.timestamps
    end
  end
end
