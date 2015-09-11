class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :article_id
      t.string :name
      t.string :desc
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :articles
  end
end
