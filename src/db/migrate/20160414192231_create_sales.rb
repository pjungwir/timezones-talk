class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, null: false
      t.datetime :sold_at, null: false
      t.integer :price_cents, null: false
      t.timestamps null: false
    end
  end
end
