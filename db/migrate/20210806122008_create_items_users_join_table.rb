class CreateItemsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :items, :users do |t|
      t.index :item_id
      t.index :user_id
    end
  end
end
