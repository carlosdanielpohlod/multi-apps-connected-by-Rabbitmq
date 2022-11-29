class CreatePurchase < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :product, foreign_key: true, null: false
      t.integer :external_user_id, null: false
      t.string :status, null: false, default: Purchase.status.values.first
    end
  end
end
