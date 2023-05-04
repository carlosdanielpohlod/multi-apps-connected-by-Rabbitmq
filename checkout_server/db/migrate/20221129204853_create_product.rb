class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.bigint :external_reference_id, null: false, unique: true
    end
  end
end
