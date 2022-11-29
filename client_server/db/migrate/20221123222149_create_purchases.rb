class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.boolean :completed, default: false, null: false
      t.references :users, null: false
      t.references :products, null: false
    end
  end
end
