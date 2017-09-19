class CreatePricelistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :pricelist_items do |t|
      t.references :pricelist, foreign_key: true
      t.references :good, foreign_key: true
      t.decimal :price
      t.string :currency

      t.timestamps
    end
  end
end
