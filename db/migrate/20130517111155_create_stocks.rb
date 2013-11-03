class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :code
      t.string :name
      t.string :market
      t.string :industry
      t.string :price
      t.string :previousprice
      t.string :volume
      t.string :previousvolume
      t.string :opening
      t.string :high
      t.string :low
      t.string :chart
      t.string :margin_buying
      t.string :margin_selling
      t.string :d_margin_buying
      t.string :d_margin_selling     
      t.text :twitter
      t.text :yahoo
      t.timestamps
    end
    add_index :stocks, :code
    add_index :stocks, :name
  end
end
